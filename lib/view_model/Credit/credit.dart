import 'package:flutter/material.dart';
import '../../ui/animated_gradient_background.dart';
import '../../ui/buildwidget.dart';

class CreditView extends StatelessWidget {
  const CreditView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return Scaffold(
          body: AnimatedGradientBackground(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  // 🌊 Decorative bubbles
                  Positioned(
                    top: 80,
                    left: 40,
                    child: addBubble(
                      isMobile ? 70 : 100,
                      Colors.blue,
                      isMobile,
                    ),
                  ),
                  Positioned(
                    bottom: 120,
                    right: 60,
                    child: addBubble(
                      isMobile ? 60 : 90,
                      Colors.purple,
                      isMobile,
                    ),
                  ),

                  // 📜 Main content
                  SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 16 : 40,
                      vertical: isMobile ? 24 : 48,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // 🏷 Title
                        Center(
                          child: Text(
                            'CREDITS',
                            style: TextStyle(
                              fontSize: isMobile ? 28 : 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [addShadow()],
                            ),
                          ),
                        ),

                        const SizedBox(height: 32),

                        // 🧑‍💻 Credit cards
                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 20,
                          runSpacing: 20,
                          children: [
                            buildCard(
                              icon: Icons.person,
                              title: 'Developer',
                              description:
                                  'App architecture\nUI / UX\nFlutter logic',
                              isMobile: isMobile,
                              outerColor: Colors.white.withOpacity(0.9),
                              innerColor: Colors.grey[300],
                            ),
                            buildCard(
                              icon: Icons.brush,
                              title: 'Design',
                              description:
                                  'Visual layout\nAnimations\nColor system',
                              isMobile: isMobile,
                              outerColor: Colors.white.withOpacity(0.9),
                              innerColor: Colors.grey[300],
                            ),
                            buildCard(
                              icon: Icons.music_note,
                              title: 'Audio',
                              description:
                                  'Music selection\nSound effects\nMixing',
                              isMobile: isMobile,
                              outerColor: Colors.white.withOpacity(0.9),
                              innerColor: Colors.grey[300],
                            ),
                          ],
                        ),

                        const SizedBox(height: 40),

                        // 📊 Credit table
                        buildGradientTable(
                          isMobile: isMobile,
                          headers: const ['Category', 'Details'],
                          rows: const [
                            ['Framework', 'Flutter'],
                            ['Language', 'Dart'],
                            ['Design Style', 'Custom UI'],
                            ['Platform', 'Web / Mobile'],
                          ],
                          headerColor: const Color.fromARGB(255, 102, 161, 237),
                          rowColor: Colors.black.withOpacity(0.6),
                        ),

                        const SizedBox(height: 50),

                        // © Footer
                        Center(
                          child: Text(
                            'Your Name',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: isMobile ? 12 : 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
