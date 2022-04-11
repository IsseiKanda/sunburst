import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunburst/sunburst.dart';

class SunburstViewSample extends StatelessWidget {
  const SunburstViewSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('Sunburst View Sample'),
      centerTitle: true,
    );

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top;
    final double outerCircleRadius = screenWidth / 2;

    return Scaffold(
      appBar: appBar,
      backgroundColor: const Color(0xff7FFFD4),
      body: FractionalTranslation(
        translation: Offset(-(outerCircleRadius - (screenWidth / 2)) / screenWidth, -(outerCircleRadius - (screenHeight / 2)) / screenHeight),
        child: Align(
          alignment: Alignment.bottomRight,
          child: SunburstView(
              outerCircleRadius: outerCircleRadius,
              innerCircleRadius: screenWidth / 4,
              linesCount: 40,
              innerBaseRate: 0.2,
              outerBaseRate: 0.6,
              colors: [
                Colors.white.withOpacity(0.1),
                Colors.white.withOpacity(0.7),
              ]),
        ),
      ),
    );
  }
}
