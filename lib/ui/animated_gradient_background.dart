import 'package:flutter/material.dart';

class AnimatedGradientBackground extends StatefulWidget {
  final Widget child;
  final List<Color> colors;

  const AnimatedGradientBackground({
    super.key,
    required this.child,
    this.colors = const [
      Color.fromARGB(255, 115, 102, 208),
      Color.fromARGB(255, 163, 154, 233),
      Color.fromARGB(255, 221, 192, 240),
      Color.fromARGB(255, 143, 200, 207),
      Color.fromARGB(255, 102, 161, 237),
    ],
  });

  @override
  State<AnimatedGradientBackground> createState() =>
      _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState extends State<AnimatedGradientBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        final progress = _animation.value;
        final offset = (progress * 2) % 2.0;

        // Create colors list with first color repeated at end for seamless loop
        final gradientColors = widget.colors;

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-1.0 + offset, -1.0 + offset),
              end: Alignment(1.0 + offset, 1.0 + offset),

              colors: gradientColors,
            ),
          ),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
