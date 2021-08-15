import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:quiz_game/widgets/wave_view.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _groupValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        iconTheme: IconThemeData(
          color: NeumorphicTheme.defaultTextColor(context),
        ),
        automaticallyImplyLeading: true,
        actions: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: HexColor('#E8EDFE'),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(60.0),
                  bottomLeft: Radius.circular(60.0),
                  bottomRight: Radius.circular(60.0),
                  topRight: Radius.circular(60.0)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    offset: const Offset(2, 2),
                    blurRadius: 4),
              ],
            ),
            child: WaveView(
              height: 56,
              percentageValue: 50.0,
            ),
          ),
        ],
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
            _nextButton(context),
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
          depth: -4,
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            NeumorphicRadio(
              duration: const Duration(milliseconds: 50),
              style: NeumorphicRadioStyle(
                intensity: 0.75,
                unselectedDepth: 4,
              ),
              child: SizedBox(
                height: 50,
                width: 200,
                child: Center(
                  child: NeumorphicText(
                    'とうろく',
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
              value: 1,
              groupValue: _groupValue,
              onChanged: (value) {
                setState(() {
                  _groupValue = value;
                });
              },
            ),
            SizedBox(height: 15),
            NeumorphicRadio(
              duration: const Duration(milliseconds: 50),
              style: NeumorphicRadioStyle(
                intensity: 0.75,
                unselectedDepth: 4,
              ),
              child: SizedBox(
                height: 50,
                width: 50,
                child: Center(
                  child: NeumorphicText(
                    'とうろく',
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
              value: 2,
              groupValue: _groupValue,
              onChanged: (value) {
                setState(() {
                  _groupValue = value;
                });
              },
            ),
            SizedBox(height: 15),
            NeumorphicRadio(
              duration: const Duration(milliseconds: 50),
              style: NeumorphicRadioStyle(
                intensity: 0.75,
                unselectedDepth: 4,
              ),
              child: SizedBox(
                height: 50,
                width: 50,
                child: Center(
                  child: NeumorphicText(
                    'とうろく',
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
              value: 3,
              groupValue: _groupValue,
              onChanged: (value) {
                setState(() {
                  _groupValue = value;
                });
              },
            ),
            SizedBox(height: 15),
            NeumorphicRadio(
              style: NeumorphicRadioStyle(
                intensity: 0.75,
                unselectedDepth: 4,
              ),
              duration: const Duration(milliseconds: 50),
              child: SizedBox(
                height: 50,
                width: 50,
                child: Center(
                  child: NeumorphicText(
                    'とうろく',
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
              value: 4,
              groupValue: _groupValue,
              onChanged: (value) {
                setState(() {
                  _groupValue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _nextButton(BuildContext context) {
    return NeumorphicButton(
      style: NeumorphicStyle(
        intensity: 0.75,
        shape: NeumorphicShape.flat,
        depth: 4,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NeumorphicText(
            'Next',
            style: NeumorphicStyle(
              color: NeumorphicTheme.defaultTextColor(context),
              depth: 0,
            ),
            textStyle: NeumorphicTextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            Icons.arrow_right_outlined,
            color: NeumorphicTheme.defaultTextColor(context),
            size: 30,
          ),
        ],
      ),
      onPressed: () {},
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

/*  Widget _guideButton(BuildContext context) {
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
  }*/
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}