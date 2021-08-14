import 'package:flutter/cupertino.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        leading: _backButton(context),
        actions: [
          _guideButton(context),
        ],
        title: _title(context),
        centerTitle: true,
      ),
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          top: 10,
          right: 16,
          bottom: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _question(context),
            SizedBox(
              height: 20,
            ),
            _description(context),
            SizedBox(
              height: 40,
            ),
            _answer(context),
          ],
        ),
      ),
    );
  }

  Widget _question(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Center(
        child: NeumorphicText(
          '就職',
          style: NeumorphicStyle(
            color: NeumorphicTheme.defaultTextColor(context),
            depth: 0,
          ),
          textStyle: NeumorphicTextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _description(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Neumorphic(
        style: NeumorphicStyle(
          shape: NeumorphicShape.convex,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
          depth: -5,
          intensity: 0.75,
          lightSource: LightSource.topLeft,
        ),
        child: Center(
          child: NeumorphicText(
            'Tìm việc',
            style: NeumorphicStyle(
              color: NeumorphicTheme.defaultTextColor(context),
              depth: 0,
            ),
            textStyle: NeumorphicTextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _answer(BuildContext context) {
    return Expanded(
      flex: 10,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 60,
                  child: NeumorphicButton(
                    style: NeumorphicStyle(
                      surfaceIntensity: 0.40,
                      depth: 4,
                      shape: NeumorphicShape.flat,
                      border: NeumorphicBorder(width: 1, color: Colors.white10),
                    ),
                    child: Center(
                      child: Text(
                        'しゅうしょく',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: NeumorphicTheme.defaultTextColor(context),
                        ),
                      ),
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
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  height: 60,
                  child: NeumorphicButton(
                    style: NeumorphicStyle(
                      surfaceIntensity: 0.40,
                      depth: 4,
                      shape: NeumorphicShape.flat,
                      border: NeumorphicBorder(width: 1, color: Colors.white10),
                    ),
                    child: Center(
                      child: Text(
                        'とうろく',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: NeumorphicTheme.defaultTextColor(context),
                        ),
                      ),
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
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 60,
                  child: NeumorphicButton(
                    style: NeumorphicStyle(
                      surfaceIntensity: 0.40,
                      depth: 4,
                      shape: NeumorphicShape.flat,
                      border: NeumorphicBorder(width: 1, color: Colors.white10),
                    ),
                    child: Center(
                      child: Text(
                        'しゅうしょく',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: NeumorphicTheme.defaultTextColor(context),
                        ),
                      ),
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
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  height: 60,
                  child: NeumorphicButton(
                    style: NeumorphicStyle(
                      surfaceIntensity: 0.40,
                      depth: 4,
                      shape: NeumorphicShape.flat,
                      border: NeumorphicBorder(width: 1, color: Colors.white10),
                    ),
                    child: Center(
                      child: Text(
                        'とうろく',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: NeumorphicTheme.defaultTextColor(context),
                        ),
                      ),
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
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _backButton(BuildContext context) {
    return NeumorphicButton(
      style: NeumorphicStyle(
        intensity: 0.75,
        shape: NeumorphicShape.flat,
        depth: 5,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
      ),
      child: Icon(
        Icons.arrow_back_ios_sharp,
        color: NeumorphicTheme.defaultTextColor(context),
        size: 30,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  Widget _title(BuildContext context) {
    return NeumorphicText(
      "Quiz Game",
      style: NeumorphicStyle(color: NeumorphicTheme.defaultTextColor(context)),
      textStyle: NeumorphicTextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _guideButton(BuildContext context) {
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
        AntDesign.question,
        size: 30,
        color: NeumorphicTheme.defaultTextColor(context),
      ),
      onPressed: () {},
    );
  }
}
