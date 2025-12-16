import 'dart:ui';
import 'package:flutter/material.dart';

Widget addBubble(double size, Color color, bool isMobile) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: RadialGradient(
        colors: [color.withOpacity(0.8), color.withOpacity(0.2)],
        center: const Alignment(-0.3, -0.3),
        radius: 0.9,
      ),
      boxShadow: [
        BoxShadow(
          color: color.withOpacity(0.1),
          blurRadius: 12,
          spreadRadius: 2,
          offset: const Offset(2, 2),
        ),
      ],
    ),
    child: Stack(
      children: [
        // Crescent shine
        Align(
          alignment: const Alignment(-0.5, -0.5),
          child: Transform.rotate(
            angle: -0.4,
            child: Container(
              width: size * 0.7,
              height: size * 0.3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.25), // shine
                    Colors.white.withOpacity(0.0),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(size),
              ),
            ),
          ),
        ),
        // Faint inner reflection
        Align(
          alignment: const Alignment(0.4, 0.4),
          child: Container(
            width: size * 0.2,
            height: size * 0.2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.08),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildCard({
  required IconData icon,
  required String title,
  required String description,
  required bool isMobile,
  double? angle,
  double? width,
  double? height,
  Color? outerColor,
  Color? innerColor,
  Color? iconColor,
}) {
  final double defaultWidth = isMobile ? 180 : 260;
  final double defaultHeight = isMobile ? 180 : 240;

  return Transform.rotate(
    angle: angle ?? 0.0,
    child: Container(
      width: width ?? defaultWidth,
      height: height ?? defaultHeight,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: outerColor ?? Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 12,
            spreadRadius: 2,
            offset: const Offset(3, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // OUTER ICON
          Icon(
            icon,
            size: isMobile ? 15 : 25,
            color: iconColor ?? Colors.black,
          ),

          const SizedBox(height: 10),

          // INNER CONTAINER (title + description)
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: innerColor ?? Colors.grey[400],
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.black.withOpacity(0.4),
                  width: 2,
                ),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Inner Title
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: isMobile ? 15 : 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Description
                  Expanded(
                    child: Text(
                      description,
                      style: TextStyle(
                        fontSize: isMobile ? 13 : 15,
                        color: Colors.black.withOpacity(0.7),
                        height: 1.4,
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
  );
}

Widget buildTable({
  required List<String> headers,
  required List<List<String>> rows,
  required bool isMobile,
  double? angle,
  Color? headerColor,
  Color? rowColor,
  TextAlign? titleAlign,
  TextAlign? descriptionAlign,
}) {
  return Transform.rotate(
    angle: angle ?? 0.0,
    child: Table(
      border: TableBorder.all(color: Colors.white, width: 2),
      columnWidths: {
        for (var i in List.generate(headers.length, (i) => i))
          i: const FlexColumnWidth(1),
      },
      children: [
        // Header row
        TableRow(
          decoration: BoxDecoration(
            color: (headerColor ?? Color.fromARGB(255, 102, 161, 237))
                .withOpacity(0.7),
          ),
          children: headers.map((header) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                header,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 15 : 18,
                ),
                textAlign: titleAlign ?? TextAlign.start,
              ),
            );
          }).toList(),
        ),

        // Data rows
        ...rows.map((rowData) {
          return TableRow(
            decoration: BoxDecoration(
              color: (rowColor ?? Color.fromARGB(255, 102, 161, 237))
                  .withOpacity(0.1),
            ),
            children: rowData.map((cellData) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  cellData,
                  style: TextStyle(fontSize: isMobile ? 13 : 16),
                  textAlign: descriptionAlign ?? TextAlign.start,
                ),
              );
            }).toList(),
          );
        }).toList(),
      ],
    ),
  );
}

Widget buildGradientTable({
  required List<String> headers,
  required List<List<String>> rows,
  required bool isMobile,
  double? angle,
  TextAlign? titleAlign,
  TextAlign? descriptionAlign,
  Color? outerColor,
  Color? headerColor,
  Color? rowColor,
}) {
  return Transform.rotate(
    angle: angle ?? 0.0,
    child: Container(
      // 🌈 Gradient border
      // decoration: BoxDecoration(
      //   gradient: const LinearGradient(
      //     begin: Alignment.topLeft,
      //     end: Alignment.bottomRight,
      //     colors: [Colors.white, Colors.white, Colors.white],
      //   ),
      //   borderRadius: BorderRadius.circular(16),
      // ),
      decoration: BoxDecoration(
        color: outerColor ?? Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),

      // Border thickness
      padding: const EdgeInsets.all(3),

      child: Container(
        // Inner background
        decoration: BoxDecoration(
          color: rowColor ?? Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(14),
        ),

        child: Table(
          columnWidths: {
            for (int i = 0; i < headers.length; i++) i: const FlexColumnWidth(),
          },
          children: [
            /// HEADER ROW
            TableRow(
              decoration: BoxDecoration(
                color: (headerColor ?? Color.fromARGB(255, 102, 161, 237))
                    .withOpacity(0.7),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(14),
                ),
              ),
              children: headers.map((header) {
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    header,
                    textAlign: titleAlign ?? TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile ? 14 : 18,
                    ),
                  ),
                );
              }).toList(),
            ),

            /// DATA ROWS
            ...rows.map((row) {
              return TableRow(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                ),
                children: row.map((cell) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      cell,
                      textAlign: descriptionAlign ?? TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isMobile ? 13 : 16,
                      ),
                    ),
                  );
                }).toList(),
              );
            }).toList(),
          ],
        ),
      ),
    ),
  );
}

class DashedCurvePainter extends CustomPainter {
  final Offset startPoint;
  final Offset endPoint;
  final Offset? controlPoint1;
  final Offset? controlPoint2;
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;
  final double roadHeight;
  final Color? roadColor;

  DashedCurvePainter({
    required this.startPoint,
    required this.endPoint,
    this.controlPoint1,
    this.controlPoint2,
    this.color = Colors.white,
    this.strokeWidth = 2,
    this.dashWidth = 10,
    this.dashSpace = 6,
    this.roadHeight = 0,
    this.roadColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // --- 1️⃣ Draw soft "road" background path if roadHeight > 0 ---
    if (roadHeight > 0) {
      final roadPaint = Paint()
        ..color = (roadColor ?? color).withOpacity(0.25)
        ..strokeWidth = roadHeight
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8); // soft glow

      final roadPath = _buildPath();
      canvas.drawPath(roadPath, roadPaint);
    }

    // --- 2️⃣ Draw dashed line on top ---
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = _buildPath();

    // Draw dashes along the path
    for (final metric in path.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        final segment = metric.extractPath(distance, distance + dashWidth);
        canvas.drawPath(segment, paint);
        distance += dashWidth + dashSpace;
      }
    }
  }

  /// Build the path depending on provided control points
  Path _buildPath() {
    final path = Path()..moveTo(startPoint.dx, startPoint.dy);

    if (controlPoint1 != null && controlPoint2 != null) {
      path.cubicTo(
        controlPoint1!.dx,
        controlPoint1!.dy,
        controlPoint2!.dx,
        controlPoint2!.dy,
        endPoint.dx,
        endPoint.dy,
      );
    } else if (controlPoint1 != null) {
      path.quadraticBezierTo(
        controlPoint1!.dx,
        controlPoint1!.dy,
        endPoint.dx,
        endPoint.dy,
      );
    } else {
      path.lineTo(endPoint.dx, endPoint.dy);
    }
    return path;
  }

  @override
  bool shouldRepaint(DashedCurvePainter oldDelegate) {
    return oldDelegate.startPoint != startPoint ||
        oldDelegate.endPoint != endPoint ||
        oldDelegate.controlPoint1 != controlPoint1 ||
        oldDelegate.controlPoint2 != controlPoint2 ||
        oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.dashWidth != dashWidth ||
        oldDelegate.dashSpace != dashSpace ||
        oldDelegate.roadHeight != roadHeight ||
        oldDelegate.roadColor != roadColor;
  }
}
