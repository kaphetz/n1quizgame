import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:quiz_game/screens/home_screen.dart';
import 'package:quiz_game/screens/quiz_screen.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: NeumorphicAppBar(
          iconTheme: IconThemeData(
            color: NeumorphicTheme.defaultTextColor(context),
          ),
          automaticallyImplyLeading: false,
          actions: [],
          title: _title(context),
          centerTitle: true,
        ),
        backgroundColor: NeumorphicTheme.baseColor(context),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _groupButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(BuildContext context) {
    return NeumorphicText(
      "Result",
      style: NeumorphicStyle(
        color: NeumorphicTheme.defaultTextColor(context),
        depth: 0,
      ),
      textStyle: NeumorphicTextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _groupButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: NeumorphicButton(
            style: NeumorphicStyle(
              intensity: 0.75,
              shape: NeumorphicShape.flat,
              depth: 4,
              boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.home,
                  color: NeumorphicTheme.defaultTextColor(context),
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                NeumorphicText(
                  'Home',
                  style: NeumorphicStyle(
                    color: NeumorphicTheme.defaultTextColor(context),
                    depth: 0,
                  ),
                  textStyle: NeumorphicTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.push<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => HomeScreen(),
                ),
              );
            },
          ),
        ),
        SizedBox(
          width: 30,
        ),
        Expanded(
          child: NeumorphicButton(
            style: NeumorphicStyle(
              intensity: 0.75,
              shape: NeumorphicShape.flat,
              depth: 4,
              boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.refresh,
                  color: NeumorphicTheme.defaultTextColor(context),
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                NeumorphicText(
                  'Try again',
                  style: NeumorphicStyle(
                    color: NeumorphicTheme.defaultTextColor(context),
                    depth: 0,
                  ),
                  textStyle: NeumorphicTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.push<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => QuizScreen(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
