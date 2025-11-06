import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class View extends StatelessWidget {
  const View({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ViewModel(),
      child: Builder(
        builder: (context) {
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
                                          decoration: BoxDecoration(
                                            color: Colors.teal,
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
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
                                            color: Colors.teal.withOpacity(0.2),
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
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
                                          color: Colors.teal.withOpacity(0.3),
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
              );
            },
          );
        },
      ),
    );
  }
}

class ViewModel extends ChangeNotifier {}
