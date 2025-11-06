import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../ui/buildwidget.dart';

class View extends StatelessWidget {
  const View({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ViewModel(),
      child: Builder(
        builder: (context) {
          // final vm = context.watch<ViewModel>();
          return LayoutBuilder(
            builder: (context, constraints) {
              final screenWidth = constraints.maxWidth;
              final screenHeight = constraints.maxHeight;
              final isMobile = screenWidth < 600;

              return Scaffold(
                body: Container(
                  height: screenHeight,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 115, 102, 208),
                        Color.fromARGB(255, 163, 154, 233),
                        Color.fromARGB(255, 221, 192, 240),
                        Color.fromARGB(255, 143, 200, 207),
                        Color.fromARGB(255, 102, 161, 237),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 16 : 150,
                        vertical: isMobile ? 18 : 26,
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    // Second Title
                                    Container(
                                      height: isMobile ? 40 : 60,
                                      decoration: BoxDecoration(
                                        color: Colors.teal,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Title',
                                        style: TextStyle(
                                          fontSize: isMobile ? 18 : 20,
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
                                        color: Colors.teal.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        'This is the description for the second title. You can put multiple lines here, like 4 to 5 lines of text.',
                                        style: TextStyle(
                                          fontSize: isMobile ? 15 : 16,
                                          height: 1.5,
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
                                    'lib/assets/images/looking_left.jpg',
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
                                        : 900,
                                  ),
                                  child: buildTable(
                                    headers: [
                                      'Objectives',
                                      'Significance',
                                      'Outcomes',
                                    ],
                                    rows: [
                                      [
                                        '_Something\n_Something\n_Something\n_Something\n_Something',
                                        '_Something\n_Something\n_Something\n_Something\n_Something',
                                        '_Something\n_Something\n_Something\n_Something\n_Something',
                                      ],
                                    ],
                                    isMobile: isMobile,
                                  ),
                                ),
                              ),

                              if (!isMobile)
                                Positioned(
                                  bottom: screenHeight * 0.05,
                                  left: screenWidth * -0.01,
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
                                  right: screenWidth * -0.01,
                                  child: addBubble(
                                    screenWidth * 0.07,
                                    Color.fromARGB(255, 115, 102, 208),
                                    isMobile,
                                  ),
                                ),
                              if (!isMobile)
                                Positioned(
                                  bottom: screenHeight * -0.06,
                                  right: screenWidth * 0.03,
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
        },
      ),
    );
  }
}

class ViewModel extends ChangeNotifier {
  //
  final formKey = GlobalKey<FormState>();
}
