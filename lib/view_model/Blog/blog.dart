import 'package:flutter/material.dart';
import 'package:presh_portfolio/ui/buildwidget.dart';

class BlogView extends StatefulWidget {
  const BlogView({super.key});

  @override
  State<BlogView> createState() => _BlogViewState();
}

class _BlogViewState extends State<BlogView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;
        final isMobile = screenWidth < 600;
        return Scaffold(
          body: Container(
            height: screenHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  isMobile
                      ? 'lib/assets/images/blog_small.jpg'
                      : 'lib/assets/images/blog_big.jpg',
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2),
                  BlendMode.darken,
                ),
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
                      // Left image
                      Container(
                        width: isMobile
                            ? screenWidth * 0.45
                            : screenWidth * 0.4,
                        height: isMobile ? screenHeight * 0.95 : 450,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: AssetImage('lib/assets/images/too_big.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: isMobile ? 12 : 24),

                      // Right column
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Blog Title
                            Container(
                              height: isMobile ? 40 : 60,
                              alignment: Alignment.center,
                              child: Text(
                                'Blog Title',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: isMobile ? 20 : 22,
                                  fontWeight: FontWeight.bold,
                                  shadows: [addShadow()],
                                ),
                              ),
                            ),
                            SizedBox(height: isMobile ? 10 : 20),

                            // Subtitles row
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: isMobile ? 40 : 60,

                                    alignment: Alignment.center,
                                    child: Text(
                                      'Subtitle 1',
                                      style: TextStyle(
                                        fontSize: isMobile ? 15 : 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        shadows: [addShadow()],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: isMobile ? 8 : 12),
                                Expanded(
                                  child: Container(
                                    height: isMobile ? 40 : 60,

                                    alignment: Alignment.center,
                                    child: Text(
                                      'Subtitle 2',
                                      style: TextStyle(
                                        fontSize: isMobile ? 15 : 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        shadows: [addShadow()],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: isMobile ? 6 : 12),

                            // Description row
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(8),

                                    child: Text(
                                      '_ Line 1\n_ Line 2\n_ Line 3\n_ Line 4\n_ Line 5',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: isMobile ? 14 : 16,
                                        height: 2,
                                        shadows: [addShadow()],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: isMobile ? 8 : 12),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      '_ Line 1\n_ Line 2\n_ Line 3\n_ Line 4\n_ Line 5',
                                      style: TextStyle(
                                        fontSize: isMobile ? 14 : 16,
                                        height: 2,
                                        color: Colors.white,
                                        shadows: [addShadow()],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: isMobile ? 10 : 20),

                            // Second Title
                            Container(
                              height: isMobile ? 40 : 60,
                              alignment: Alignment.center,
                              child: Text(
                                'Title',
                                style: TextStyle(
                                  fontSize: isMobile ? 18 : 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  shadows: [addShadow()],
                                ),
                              ),
                            ),

                            SizedBox(height: isMobile ? 6 : 12),

                            // Second description
                            Container(
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                'This is the description for the second title. You can put multiple lines here, like 4 to 5 lines of text.',
                                style: TextStyle(
                                  fontSize: isMobile ? 15 : 16,
                                  height: 1.5,
                                  color: Colors.white,
                                  shadows: [addShadow()],
                                ),
                              ),
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
  }
}
