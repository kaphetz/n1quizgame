import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

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
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 35, right: 16),
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            child: NeumorphicButton(
              style: NeumorphicStyle(
                depth: 10,
                boxShape: NeumorphicBoxShape.circle(),
                shape: NeumorphicShape.concave,
                border: NeumorphicBorder(width: 6, color: Colors.white60),
              ),
              child: Center(
                child: _startButton(context),
              ),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }

  Widget _startButton(BuildContext context) {
    return Text(
      'Start',
      style: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
        color: NeumorphicTheme.defaultTextColor(context),
      ),
    );
  }

  Widget _title(BuildContext context) {
    return NeumorphicText(
      "Learn Japanese",
      style: NeumorphicStyle(
        color: NeumorphicTheme.defaultTextColor(context), //customize color here
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
        depth: 10,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
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
        depth: 10,
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
}
