import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CircularArc extends StatefulWidget {
  const CircularArc({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CircularArcState();
}

class _CircularArcState extends State<CircularArc>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;
  int counter;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    final curvedAnimation = CurvedAnimation(
        parent: animationController, curve: Curves.easeInOutCubic);

    animation = Tween<double>(begin: 0.0, end: (math.pi * 2) * 0.75)
        .animate(curvedAnimation)
          ..addListener(() {
            setState(() {});
          });
    animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          CustomPaint(
            size: Size(80, 80),
            painter: ProgressArc(
              isBackground: true,
              arc: null,
              progressColor: Colors.white70,
            ),
          ),
          CustomPaint(
            size: Size(80, 80),
            painter: ProgressArc(
              isBackground: true,
              arc: animation.value,
              progressColor: NeumorphicTheme.defaultTextColor(context),
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressArc extends CustomPainter {
  bool isBackground;
  double arc;
  Color progressColor;

  ProgressArc({this.isBackground, this.arc, this.progressColor});

  final Gradient gradient = new SweepGradient(
    colors: <Color>[
      Colors.redAccent.withOpacity(1.0),
      Colors.greenAccent.withOpacity(1.0),
      Colors.yellowAccent.withOpacity(1.0),
    ],
    stops: [
      0.0, 0.75, 1.5,
    ],
  );

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0, 0, 80, 80);
    final startAngle = -math.pi / 2;
    final sweepAngle = arc != null ? arc : math.pi * 2;
    final useCenter = false;
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    if (!isBackground) {
      paint.shader = gradient.createShader(rect);
    }

    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
