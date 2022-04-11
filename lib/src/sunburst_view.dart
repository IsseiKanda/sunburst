import 'package:flutter/cupertino.dart';
import 'sunburst_painter.dart';

class SunburstView extends StatelessWidget {
  const SunburstView({
    Key? key,
    required this.outerCircleRadius,
    required this.innerCircleRadius,
    required this.linesCount,
    required this.innerBaseRate,
    required this.outerBaseRate,
    this.color,
    this.colors,
  }) : super(key: key);

  final double outerCircleRadius;
  final double innerCircleRadius;
  final double linesCount;
  final double innerBaseRate;
  final double outerBaseRate;
  final Color? color;
  final List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(outerCircleRadius * 2, outerCircleRadius * 2),
      painter: SunburstPainter(
          linesCount: linesCount,
          outerCircleRadius: outerCircleRadius,
          innerCircleRadius: innerCircleRadius,
          innerBaseRate: innerBaseRate,
          outerBaseRate: outerBaseRate,
          color: color,
          colors: colors),
    );
  }
}
