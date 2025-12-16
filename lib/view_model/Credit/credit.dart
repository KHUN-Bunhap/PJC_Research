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
            child: SizedBox(
              width: screenWidth,
              height: screenHeight,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 16 : 24,
                  vertical: isMobile ? 18 : 26,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Right column
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Subtitles row
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: isMobile ? 40 : 60,
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Title',
                                        style: TextStyle(
                                          fontSize: isMobile ? 20 : 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          shadows: [
                                            Shadow(
                                              offset: const Offset(1, 1),
                                              blurRadius: 3,
                                              color: Colors.black.withOpacity(
                                                0.5,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: isMobile ? 8 : 12),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        '_ Description\n_ Description',

                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: isMobile ? 14 : 16,
                                          shadows: [
                                            Shadow(
                                              offset: const Offset(1, 1),
                                              blurRadius: 3,
                                              color: Colors.black.withOpacity(
                                                0.5,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: isMobile ? 6 : 12),

                              Table(
                                border: TableBorder.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                children: [
                                  TableRow(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '_ Description\n_ Description\n_ Description\n_ Description\n_ Description',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: isMobile ? 15 : 17,
                                            height: 2,
                                            shadows: [
                                              Shadow(
                                                offset: const Offset(1, 1),
                                                blurRadius: 2,
                                                color: Colors.black.withOpacity(
                                                  0.4,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '_ Description\n_ Description\n_ Description\n_ Description\n_ Description',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: isMobile ? 15 : 17,
                                            height: 2,
                                            shadows: [
                                              Shadow(
                                                offset: const Offset(1, 1),
                                                blurRadius: 2,
                                                color: Colors.black.withOpacity(
                                                  0.4,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
