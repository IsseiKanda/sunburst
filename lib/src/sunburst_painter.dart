import 'dart:math';
import 'package:flutter/material.dart';


//Copy this CustomPainter code to the Bottom of the File
class SunburstPainter extends CustomPainter {
  final double outerCircleRadius;
  final double innerCircleRadius;
  final double linesCount;
  final double innerBaseRate;
  final double outerBaseRate;
  final Color? color;
  final List<Color>? colors;

  SunburstPainter(
      {required this.outerCircleRadius,
        required this.innerCircleRadius,
        required this.linesCount,
        required this.innerBaseRate,
        required this.outerBaseRate,
        this.color,
        this.colors
      });

  @override
  void paint(Canvas canvas, Size size) {

    Paint sunburstPaint = Paint();

    if (colors != null)  {
      sunburstPaint.shader = RadialGradient(
        colors: colors!,
      ).createShader(Rect.fromCircle(center: Offset(outerCircleRadius, outerCircleRadius), radius: outerCircleRadius));
    }
    for (var i = 1; i <= linesCount; i++) {
      Path path = Path();

      final firstX = innerCircleRadius *
          cos(2 * pi / linesCount * (i - innerBaseRate / 2)) +
          outerCircleRadius;
      final firstY = -innerCircleRadius *
          sin(2 * pi / linesCount * (i - innerBaseRate / 2)) +
          outerCircleRadius;
      final secondX = innerCircleRadius *
          cos(2 * pi / linesCount * (i + innerBaseRate / 2)) +
          outerCircleRadius;
      final secondY = -innerCircleRadius *
          sin(2 * pi / linesCount * (i + innerBaseRate / 2)) +
          outerCircleRadius;
      final thirdX = outerCircleRadius *
          cos(2 * pi / linesCount * (i + outerBaseRate / 2)) +
          outerCircleRadius;
      final thirdY = -outerCircleRadius *
          sin(2 * pi / linesCount * (i + outerBaseRate / 2)) +
          outerCircleRadius;
      final fourthX = outerCircleRadius *
          cos(2 * pi / linesCount * (i - outerBaseRate / 2)) +
          outerCircleRadius;
      final fourthY = -outerCircleRadius *
          sin(2 * pi / linesCount * (i - outerBaseRate / 2)) +
          outerCircleRadius;

      path.moveTo(firstX, firstY);
      path.lineTo(secondX, secondY);
      path.lineTo(thirdX, thirdY);
      path.lineTo(fourthX, fourthY);
      path.close();
      canvas.drawPath(path, sunburstPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}