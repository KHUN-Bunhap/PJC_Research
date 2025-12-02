import 'package:flutter/material.dart';
import '../../ui/animated_gradient_background.dart';
import '../../ui/buildwidget.dart';

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
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 16 : 50,
                  vertical: isMobile ? 18 : 26,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Second Title
                              Container(
                                height: isMobile ? 40 : 60,

                                alignment: Alignment.centerLeft,
                                child: Text(
                                  (isMobile
                                      ? 'What is it about?'
                                      : 'What is this project about?'),
                                  style: TextStyle(
                                    fontSize: isMobile ? 18 : 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),

                              SizedBox(height: isMobile ? 6 : 12),

                              // Second description
                              Container(
                                padding: const EdgeInsets.all(12),
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
                                  'This project is an extension of the researcher regarding on students\' distance learning experiences during the COVID-19 pandemic. It aims to present the findings in a more accessible and creative format highlighting academic challenges, mental health struggles, technological barriers, and coping strategies. The goal is to inform, comfort, and empower students, educators, and parents.',
                                  style: TextStyle(
                                    fontSize: isMobile ? 15 : 16,
                                    height: 1.5,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: isMobile ? 16 : 20),
                        Expanded(
                          flex: 1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              isMobile
                                  ? 'lib/assets/images/looking_left_mobile.jpg'
                                  : 'lib/assets/images/looking_left.jpg',
                              height: isMobile
                                  ? screenHeight * 0.5
                                  : screenHeight * 0.7,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[300],
                                  height: isMobile
                                      ? screenHeight * 0.5
                                      : screenHeight * 0.7,
                                  child: const Center(
                                    child: Icon(
                                      Icons.image_not_supported,
                                      color: Colors.grey,
                                      size: 50,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: isMobile ? 24 : 32),

                    Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        // Bubbles (decorative)
                        if (isMobile)
                          Positioned(
                            bottom: screenHeight * 0.05,
                            left: screenWidth * -0.03,
                            child: addBubble(
                              screenWidth * 0.15,
                              Color.fromARGB(255, 102, 161, 237),
                              isMobile,
                            ),
                          ),
                        if (isMobile)
                          Positioned(
                            bottom: screenHeight * -0.02,
                            left: screenWidth * -0.04,
                            child: addBubble(
                              screenWidth * 0.2,
                              Color.fromARGB(255, 143, 200, 207),
                              isMobile,
                            ),
                          ),
                        if (isMobile)
                          Positioned(
                            bottom: screenHeight * -0.02,
                            right: screenWidth * -0.05,
                            child: addBubble(
                              screenWidth * 0.15,
                              Color.fromARGB(255, 115, 102, 208),
                              isMobile,
                            ),
                          ),
                        if (isMobile)
                          Positioned(
                            bottom: screenHeight * 0.015,
                            right: screenWidth * -0.05,
                            child: addBubble(
                              screenWidth * 0.2,
                              Color.fromARGB(255, 221, 192, 240),
                              isMobile,
                            ),
                          ),
                        Center(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: isMobile
                                  ? screenWidth * 0.95
                                  : screenWidth,
                            ),
                            child: buildTable(
                              headers: ['Objectives'],
                              rows: [
                                [
                                  '- To present the findings of the research in a clear and creative online platform.\n\n- To showcase students\' reflections and stories for greater awareness and emotional understanding.\n\n- To provide tips and emotional support that can help students manage academic and personal struggles to this age.',
                                ],
                              ],
                              isMobile: isMobile,
                            ),
                          ),
                        ),

                        if (!isMobile)
                          Positioned(
                            bottom: screenHeight * 0.05,
                            left: screenWidth * -0.04,
                            child: addBubble(
                              screenWidth * 0.07,
                              Color.fromARGB(255, 102, 161, 237),
                              isMobile,
                            ),
                          ),
                        if (!isMobile)
                          Positioned(
                            bottom: screenHeight * -0.08,
                            left: screenWidth * -0.03,
                            child: addBubble(
                              screenWidth * 0.08,
                              Color.fromARGB(255, 143, 200, 207),
                              isMobile,
                            ),
                          ),

                        if (!isMobile)
                          Positioned(
                            bottom: screenHeight * 0.05,
                            right: screenWidth * -0.04,
                            child: addBubble(
                              screenWidth * 0.07,
                              Color.fromARGB(255, 115, 102, 208),
                              isMobile,
                            ),
                          ),
                        if (!isMobile)
                          Positioned(
                            bottom: screenHeight * -0.06,
                            right: screenWidth * -0.03,
                            child: addBubble(
                              screenWidth * 0.08,
                              Color.fromARGB(255, 221, 192, 240),
                              isMobile,
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
