import 'package:flutter/material.dart';
import 'dart:math';

class RoundedCircularProgressIndicator extends StatelessWidget {
  final double percentage;
  final double strokeWidth;
  final Color backgroundColor;
  final Color progressColor;
  final String text;

  const RoundedCircularProgressIndicator({
    super.key,
    required this.percentage,
    this.strokeWidth = 30.0,
    this.backgroundColor = const Color(0xFFe0e0e0),
    this.progressColor = const Color(0xFF147AD6),
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      height: 250.0,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size.infinite, // Allow CustomPaint to fill the space
            painter: _RoundedCircularProgressPainter(
              percentage: percentage,
              strokeWidth: strokeWidth,
              backgroundColor: backgroundColor,
              progressColor: progressColor,
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${(percentage * 100).toStringAsFixed(1)}%', // Display the percentage
                  style: const TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  text, // Display additional text
                  style: const TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RoundedCircularProgressPainter extends CustomPainter {
  final double percentage;
  final double strokeWidth;
  final Color backgroundColor;
  final Color progressColor;

  _RoundedCircularProgressPainter({
    required this.percentage,
    required this.strokeWidth,
    required this.backgroundColor,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    const double startAngle = -pi / 2; // Start at the top
    final double sweepAngle = 2 * pi * percentage; // How much to draw

    // Draw the background circle
    final Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
        rect.deflate(strokeWidth / 2), 0, 2 * pi, false, backgroundPaint);

    // Draw the progress arc
    final Paint progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round; // Rounded ends

    canvas.drawArc(rect.deflate(strokeWidth / 2), startAngle, sweepAngle, false,
        progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
