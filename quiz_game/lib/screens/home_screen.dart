import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:quiz_game/widgets/arc_progress_bar.dart';
import 'package:quiz_game/widgets/chart.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  final data = [10.0, 30.0, 50.0, 40.0, 35.0, 55.0, 70.0, 30.0];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        leading: _changeThemeButton(context),
        actions: [
          _infoButton(context),
        ],
        title: _title(context),
        centerTitle: true,
      ),
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16, top: 10, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _startButton(context),
            SizedBox(
              height: 40,
            ),
            _lastScore(context),
            SizedBox(
              height: 20,
            ),
            _achievement(context),
            SizedBox(
              height: 20,
            ),
            _lastScore(context),
          ],
        ),
      ),
    );
  }

  Widget _title(BuildContext context) {
    return NeumorphicText(
      "Quiz",
      style: NeumorphicStyle(
        color: NeumorphicTheme.defaultTextColor(context)
      ),
      textStyle: NeumorphicTextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _infoButton(BuildContext context) {
    return NeumorphicButton(
      style: NeumorphicStyle(
        intensity: 0.75,
        shape: NeumorphicShape.flat,
        depth: 5,
        boxShape: NeumorphicBoxShape.roundRect(
          BorderRadius.circular(100),
        ),
      ),
      child: Icon(
        Icons.info_outlined,
        size: 30,
        color: NeumorphicTheme.defaultTextColor(context),
      ),
      onPressed: () {},
    );
  }

  Widget _changeThemeButton(BuildContext context) {
    return NeumorphicButton(
      style: NeumorphicStyle(
        intensity: 0.75,
        shape: NeumorphicShape.flat,
        depth: 5,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
      ),
      child: Icon(
        Icons.lightbulb_outline,
        color: NeumorphicTheme.defaultTextColor(context),
        size: 30,
      ),
      onPressed: () {},
    );
  }

  Widget _startButton(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      child: NeumorphicButton(
        style: NeumorphicStyle(
          surfaceIntensity: 0.40,
          depth: 7,
          boxShape: NeumorphicBoxShape.circle(),
          shape: NeumorphicShape.concave,
          border: NeumorphicBorder(width: 6, color: Colors.white24),
        ),
        child: Center(
          child: Text(
            'Start',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: NeumorphicTheme.defaultTextColor(context),
            ),
          ),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _lastScore(BuildContext context) {
    return Expanded(
      child: Neumorphic(
        style: NeumorphicStyle(
          shape: NeumorphicShape.convex,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
          depth: -5,
          intensity: 0.8,
          lightSource: LightSource.topLeft,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: NeumorphicText(
                    "Last score",
                    style: NeumorphicStyle(
                        color: NeumorphicTheme.defaultTextColor(context)),
                    textStyle: NeumorphicTextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularArc(),
                      Neumorphic(
                        padding: const EdgeInsets.all(12),
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(100)),
                          depth: 4,
                          intensity: 0.75,
                          lightSource: LightSource.topLeft,
                        ),
                        child: NeumorphicText(
                          "99",
                          style: NeumorphicStyle(
                              color:
                                  NeumorphicTheme.defaultTextColor(context)),
                          textStyle: NeumorphicTextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
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
      ),
    );
  }

  Widget _achievement(BuildContext context) {
    return Expanded(
      child: Neumorphic(
        style: NeumorphicStyle(
          shape: NeumorphicShape.convex,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
          depth: -5,
          intensity: 0.8,
          lightSource: LightSource.topLeft,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: NeumorphicText(
                    "Achievement",
                    style: NeumorphicStyle(
                        color: NeumorphicTheme.defaultTextColor(context)),
                    textStyle: NeumorphicTextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Container(
                    child: Chart(
                      data: data,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
