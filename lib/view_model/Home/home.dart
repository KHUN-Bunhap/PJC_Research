import 'package:flutter/material.dart';
import '../../ui/animated_gradient_background.dart';

class View extends StatefulWidget {
  const View({super.key});

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;
        final isMobile = screenWidth < 600;

        return Scaffold(
          body: AnimatedGradientBackground(
            child: Center(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: isMobile ? double.infinity : double.infinity,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 16 : 24,
                    vertical: isMobile ? 18 : 26,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Hero Image Section
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 4,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Stack(
                            children: [
                              Image.asset(
                                'lib/assets/images/soul.webp',
                                width: double.infinity,
                                height: isMobile
                                    ? screenHeight * 0.9
                                    : screenHeight * 0.85,
                                fit: BoxFit.cover,
                              ),

                              // Dark overlay for better text readability
                              Container(
                                width: double.infinity,
                                height: isMobile
                                    ? screenHeight * 0.9
                                    : screenHeight * 0.85,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.3),
                                      Colors.black.withOpacity(0.6),
                                    ],
                                  ),
                                ),
                              ),

                              // Text overlay - centered
                              Positioned.fill(
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: isMobile ? 14 : 40,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Bridging the Gap',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: isMobile ? 28 : 48,
                                            fontWeight: FontWeight.bold,
                                            shadows: [
                                              Shadow(
                                                color: Colors.black.withOpacity(
                                                  0.5,
                                                ),
                                                blurRadius: 10,
                                                offset: const Offset(2, 2),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: isMobile ? 8 : 16),
                                        Text(
                                          'Empowering Students in the Post-Pandemic Learning Era',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: isMobile ? 18 : 24,
                                            fontWeight: FontWeight.bold,
                                            shadows: [
                                              Shadow(
                                                color: Colors.black.withOpacity(
                                                  0.5,
                                                ),
                                                blurRadius: 8,
                                                offset: const Offset(1, 1),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
