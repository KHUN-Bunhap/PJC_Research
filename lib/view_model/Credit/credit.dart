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
              height: screenHeight,
              width: screenWidth,
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
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: isMobile ? 8 : 12),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(
                                          255,
                                          102,
                                          161,
                                          237,
                                        ).withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        '_ Description\n_ Description',
                                        style: TextStyle(
                                          fontSize: isMobile ? 14 : 16,
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
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(
                                        255,
                                        102,
                                        161,
                                        237,
                                      ).withOpacity(0.3),
                                    ),
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '_ Description\n_ Description\n_ Description\n_ Description\n_ Description',
                                          style: TextStyle(
                                            fontSize: isMobile ? 15 : 17,
                                            height: 2,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '_ Description\n_ Description\n_ Description\n_ Description\n_ Description',
                                          style: TextStyle(
                                            fontSize: isMobile ? 15 : 17,
                                            height: 2,
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
