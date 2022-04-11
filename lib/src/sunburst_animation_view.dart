import 'package:flutter/cupertino.dart';
import 'sunburst_painter.dart';

enum RotationDirection { clockwise, antiClockwise }

class SunburstAnimationView extends StatefulWidget {
  const SunburstAnimationView({
    Key? key,
    required this.outerCircleRadius,
    required this.innerCircleRadius,
    required this.linesCount,
    required this.innerBaseRate,
    required this.outerBaseRate,
    required this.rotationDuration,
    required this.rotationDirection,
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
  final int rotationDuration;
  final RotationDirection rotationDirection;

  @override
  State<SunburstAnimationView> createState() => _SunburstAnimationViewState();
}

class _SunburstAnimationViewState extends State<SunburstAnimationView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: widget.rotationDuration),
    vsync: this,
  )..repeat(reverse: false);

  @override
  Widget build(BuildContext context) {
    final tweenEnd = widget.rotationDirection == RotationDirection.clockwise ? 1.0 : -1.0;
    return RotationTransition(
        turns: Tween(begin: 0.0, end: tweenEnd).animate(_controller),
        child: CustomPaint(
            size: Size(widget.outerCircleRadius * 2, widget.outerCircleRadius * 2),
            painter: SunburstPainter(
                linesCount: widget.linesCount,
                outerCircleRadius: widget.outerCircleRadius,
                innerCircleRadius: widget.innerCircleRadius,
                innerBaseRate: widget.innerBaseRate,
                outerBaseRate: widget.outerBaseRate,
                color: widget.color,
                colors: widget.colors)));
  }
}
