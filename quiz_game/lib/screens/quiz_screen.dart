import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:quiz_game/blocs/quiz_bloc/quiz_bloc.dart';
import 'package:quiz_game/blocs/quiz_bloc/quiz_event.dart';
import 'package:quiz_game/blocs/quiz_bloc/quiz_state.dart';
import 'package:quiz_game/models/question.dart';
import 'package:quiz_game/models/word.dart';
import 'package:quiz_game/widgets/wave_view.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Word _groupValue;
  double _completePercent;
  List<Word> _listWord;
  int _count;
  Word _currentWord;
  List<Question> _answeredQuestions = [];
  List<Word> _otherWords = [];

  @override
  void initState() {
    super.initState();
    _count = 0;
    _completePercent = 0.0;
  }

  void _getWordForTest() {
    if (_listWord.length > 0) {
      final random = new Random();
      var index = random.nextInt(_listWord.length);
      _currentWord = _listWord[index];
      _listWord.removeAt(index);

      index = random.nextInt(_listWord.length);
      _otherWords.add(_listWord[index]);

      var index2 = random.nextInt(_listWord.length);
      while (index2 == index) {
        index2 = random.nextInt(_listWord.length);
      }
      _otherWords.add(_listWord[index2]);

      var index3 = random.nextInt(_listWord.length);
      while (index3 == index || index3 == index2) {
        index3 = random.nextInt(_listWord.length);
      }
      _otherWords.add(_listWord[index3]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: NeumorphicAppBar(
          iconTheme: IconThemeData(
            color: NeumorphicTheme.defaultTextColor(context),
          ),
          leading: _homeButton(context),
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
                percentageValue: _completePercent,
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
          child: BlocBuilder<QuizBloc, QuizState>(
            builder: (context, state) {
              if (state is GetWordSuccess) {
                _listWord = state.listWords;
                _getWordForTest();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _question(context, _currentWord),
                    SizedBox(
                      height: 20,
                    ),
                    _description(context),
                    SizedBox(
                      height: 40,
                    ),
                    _answer(context, _currentWord, _otherWords),
                    _nextButton(context),
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  Widget _question(BuildContext context, Word question) {
    return Expanded(
      flex: 5,
      child: Center(
        child: NeumorphicText(
          question.word,
          style: NeumorphicStyle(
            color: NeumorphicTheme.defaultTextColor(context),
            depth: 0,
          ),
          textStyle: NeumorphicTextStyle(
            fontSize: 30,
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

  Widget _answer(BuildContext context, Word currentWord, List<Word> otherWord) {
    final listAnswer = [currentWord];
    listAnswer.addAll(otherWord);
    listAnswer.shuffle();
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
                    listAnswer[0].yomikata,
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
              value: listAnswer[0],
              groupValue: _groupValue,
              onChanged: (value) {
                _groupValue = value;
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
                    listAnswer[1].yomikata,
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
              value: listAnswer[1],
              groupValue: _groupValue,
              onChanged: (value) {
                _groupValue = value;
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
                    listAnswer[2].yomikata,
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
              value: listAnswer[2],
              groupValue: _groupValue,
              onChanged: (value) {
                _groupValue = value;
              },
            ),
            SizedBox(height: 15),
            NeumorphicRadio(
              style: NeumorphicRadioStyle(
                intensity: 0.75,
                unselectedDepth: -4,
              ),
              duration: const Duration(milliseconds: 50),
              child: SizedBox(
                height: 50,
                width: 50,
                child: Center(
                  child: NeumorphicText(
                    listAnswer[3].yomikata,
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
              value: listAnswer[3],
              groupValue: _groupValue,
              onChanged: (value) {
                  _groupValue = value;
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
      onPressed: () {
        if (_count < 20) {
          _answeredQuestions.add(Question(
            id: _currentWord.id,
            isCorrect: _groupValue.id == _currentWord.id,
            word: _currentWord.word,
            number: _count,
          ));
          _count++;
          _otherWords.clear();
          BlocProvider.of<QuizBloc>(context).add(
            ChangeQuestion(listWord: _listWord),
          );
          setState(() {
            _completePercent += 5.0;
          });
        } else {
          Navigator.pushNamed(context, '/result');
        }
      },
    );
  }

  Widget _title(BuildContext context) {
    return NeumorphicText(
      "Quiz Game",
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

  Widget _homeButton(BuildContext context) {
    return NeumorphicButton(
        style: NeumorphicStyle(
          intensity: 0.75,
          shape: NeumorphicShape.flat,
          depth: 4,
          boxShape: NeumorphicBoxShape.roundRect(
            BorderRadius.circular(100),
          ),
        ),
        child: Icon(
          Icons.home,
          size: 30,
          color: NeumorphicTheme.defaultTextColor(context),
        ),
        onPressed: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/home', (Route<dynamic> route) => false);
        });
  }
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