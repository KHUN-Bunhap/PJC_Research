import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../ui/animated_gradient_background.dart';
import '../../ui/buildwidget.dart';

class StoryView extends StatefulWidget {
  const StoryView({super.key});

  @override
  State<StoryView> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;
        final isMobile = screenWidth < 600;

        return Scaffold(
          body: SizedBox(
            height: screenHeight,
            child: AnimatedGradientBackground(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(isMobile ? 16 : 24),
                  child: Center(
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: isMobile ? double.infinity : 1200,
                      ),
                      child: Builder(
                        builder: (context) {
                          final roadHeight = isMobile
                              ? screenHeight * 0.65
                              : screenHeight * 1.5;
                          final cardWidth = isMobile
                              ? screenWidth * 0.400
                              : 175.0;
                          final cardHeight = isMobile ? 200.0 : 250.0;
                          final containerWidth = isMobile ? screenWidth : 900.0;

                          // Define card positions
                          final card1Top = isMobile
                              ? screenHeight * 0.055
                              : screenHeight * 0.01;
                          final card1Right = isMobile
                              ? screenWidth * 0.03
                              : 120.0;

                          final card2Top = isMobile
                              ? screenHeight * 0.350
                              : screenHeight * 0.45;
                          final card2Left = isMobile
                              ? screenWidth * 0.05
                              : 40.0; // Fixed position for large screens

                          final card3Bottom = isMobile
                              ? screenHeight * -0.25
                              : screenHeight * 0.02;
                          final card3Right = isMobile
                              ? screenWidth * 0.02
                              : 70.0; // Fixed position for large screens

                          final card1Left = isMobile
                              ? containerWidth - card1Right - cardWidth
                              : containerWidth - card1Right - cardWidth + 80;
                          final card3Left = isMobile
                              ? containerWidth - card3Right - cardWidth
                              : containerWidth - card3Right - cardWidth - 80;
                          final card3Top =
                              roadHeight - card3Bottom - cardHeight;

                          // Card 1 top-left corner
                          final x1 = isMobile ? card1Left + 20 : card1Left;
                          final y1 = isMobile ? card1Top + 10 : card1Top;

                          // Card 2 top-center
                          final x2 = card2Left + cardWidth / 2;
                          final y2 = card2Top;

                          // Card 2 top-right corner
                          final x2r = isMobile
                              ? card2Left + cardWidth
                              : card2Left + cardWidth - 20;
                          final y2r = isMobile ? card2Top + 20 : card2Top + 20;

                          // Card 3 top-right corner
                          final x3 = isMobile
                              ? card3Left + cardWidth - 20
                              : card3Left + cardWidth;
                          final y3 = card3Top;

                          return SizedBox(
                            width: containerWidth,
                            height: roadHeight,
                            child: Stack(
                              alignment: Alignment.center,
                              clipBehavior: Clip.none,
                              children: [
                                // Curve 1: Card 1 top-left to Card 2 top-center (SVG)
                                Positioned.fill(
                                  child: SvgPicture.string(
                                    '''
          <svg viewBox="0 0 $containerWidth $roadHeight" xmlns="http://www.w3.org/2000/svg">
            <path 
              d="M $x1 $y1 C ${x1 - 120} ${y1 + 120}, ${x2 - 80} ${y2 - 80}, $x2 $y2"
              stroke="white" 
              stroke-width="3" 
              fill="none" 
              stroke-dasharray="10 6"
              opacity="0.9"
            />
          </svg>
          ''',
                                    fit: BoxFit.fill,
                                    placeholderBuilder: (context) =>
                                        const SizedBox.shrink(),
                                  ),
                                ),

                                // Curve 2: Card 2 top-right to Card 3 top-right (SVG)
                                Positioned.fill(
                                  child: SvgPicture.string(
                                    '''
          <svg viewBox="0 0 $containerWidth $roadHeight" xmlns="http://www.w3.org/2000/svg">
            <path 
              d="M $x2r $y2r C ${x2r + 120} ${y2r + 120}, ${x3 + 80} ${y3 - 80}, $x3 $y3"
              stroke="white" 
              stroke-width="3" 
              fill="none" 
              stroke-dasharray="10 6"
              opacity="0.9"
            />
          </svg>
          ''',
                                    fit: BoxFit.fill,
                                    placeholderBuilder: (context) =>
                                        const SizedBox.shrink(),
                                  ),
                                ),

                                // Cards Positioned
                                Positioned(
                                  top: card1Top,
                                  right: card1Right,
                                  child: buildCard(
                                    icon: Icons.circle,
                                    angle: -0.2,
                                    width: 175,
                                    height: isMobile ? 200 : 250,
                                    title: 'Something 01',
                                    description:
                                        '_ Description\n_ Description\n_ Description\n_ Description\n_ Description',
                                    isMobile: isMobile,
                                    outerColor: Colors.white,
                                  ),
                                ),

                                Positioned(
                                  top: card2Top,
                                  left: card2Left,
                                  child: buildCard(
                                    icon: Icons.circle,
                                    angle: 0.3,
                                    width: 175,
                                    height: isMobile ? 200 : 250,
                                    title: 'Something 01',
                                    description:
                                        '_ Description\n_ Description\n_ Description\n_ Description\n_ Description',
                                    isMobile: isMobile,
                                    outerColor: Colors.white,
                                  ),
                                ),
                                Positioned(
                                  bottom: card3Bottom,
                                  right: card3Right,
                                  child: buildCard(
                                    icon: Icons.circle,
                                    angle: -0.1,
                                    width: 175,
                                    height: isMobile ? 200 : 250,
                                    title: 'Something 01',
                                    description:
                                        '_ Description\n_ Description\n_ Description\n_ Description\n_ Description',
                                    isMobile: isMobile,
                                    outerColor: Colors.white,
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  left: isMobile ? 10 : 15,
                                  child: Text(
                                    'Write My Story?',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: isMobile ? 20 : 28,
                                      fontWeight: FontWeight.bold,
                                      shadows: [addShadow()],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: isMobile ? 40 : 50,
                                  left: isMobile ? 10 : 15,
                                  child: Text(
                                    isMobile
                                        ? 'A collection of personal stories,\nreflections, and\ntestimonies from\nstudents who lived\nthrough distance learning.'
                                        : 'A collection of personal stories, reflections,\nand testimonies from students who lived\nthrough distance learning. ',

                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: isMobile ? 12 : 16,
                                      fontWeight: FontWeight.bold,
                                      shadows: [addShadow()],
                                    ),
                                  ),
                                ),

                                Positioned(
                                  bottom: isMobile ? -120 : 200,
                                  left: isMobile ? 12 : 14,
                                  child: Text(
                                    isMobile
                                        ? 'This space highlights meaningful\nexperiences shared by\nstudents who chose to\nspeak up. Each story\ncontributes to bridging\nunderstanding within\nour school community.'
                                        : 'This space highlights meaningful experiences shared\nby students who chose to speak up. Each story contributes to\nbridging understanding within our school community.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: isMobile ? 12 : 16,
                                      fontWeight: FontWeight.bold,
                                      shadows: [addShadow()],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
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
