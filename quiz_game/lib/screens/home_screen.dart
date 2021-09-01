import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:quiz_game/blocs/home_bloc/home_bloc.dart';
import 'package:quiz_game/blocs/home_bloc/home_state.dart';
import 'package:quiz_game/models/result.dart';
import 'package:quiz_game/widgets/chart.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<void> _completer;
  final data = [10.0, 30.0, 50.0];

  @override
  void initState() {
    super.initState();
    _completer = Completer<void>();
  }

  void _addToChartData(List<Result> results) {
    for (final item in results) {
      data.clear();
      data.add(item.points.toDouble());
    }
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: NeumorphicAppBar(
          //leading: _changeThemeButton(context),
          actions: [
            _infoButton(context),
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
          child: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is HomeSuccess) {
                _completer?.complete();
                _completer = Completer();
              }
            },
            builder: (context, state) {
              if (state is HomeSuccess) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _startButton(context),
                    SizedBox(
                      height: 25,
                    ),
                    _pointsOfGame(context, state.lastResult, state.bestResult),
                    SizedBox(
                      height: 20,
                    ),
                    _achievement(context, state.results),
                  ],
                );
              } else if (state is HomeLoading) {
                return Center(child: CupertinoActivityIndicator());
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _title(BuildContext context) {
    return NeumorphicText(
      "JLPT N1",
      style: NeumorphicStyle(
        color: NeumorphicTheme.defaultTextColor(context),
        depth: 0,
      ),
      textStyle: NeumorphicTextStyle(
        fontSize: 27,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _infoButton(BuildContext context) {
    return NeumorphicButton(
      style: NeumorphicStyle(
        intensity: 0.75,
        shape: NeumorphicShape.flat,
        depth: 2,
        boxShape: NeumorphicBoxShape.roundRect(
          BorderRadius.circular(100),
        ),
      ),
      child: Icon(
        CupertinoIcons.info,
        size: 28,
        color: NeumorphicTheme.defaultTextColor(context),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/info');
      },
    );
  }

  Widget _changeThemeButton(BuildContext context) {
    return NeumorphicButton(
      style: NeumorphicStyle(
        intensity: 0.75,
        shape: NeumorphicShape.flat,
        depth: 2,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
      ),
      child: Icon(
        CupertinoIcons.lightbulb,
        color: NeumorphicTheme.defaultTextColor(context),
        size: 28,
      ),
      onPressed: () {
        NeumorphicTheme.of(context).themeMode =
            NeumorphicTheme.isUsingDark(context)
                ? ThemeMode.light
                : ThemeMode.dark;
      },
    );
  }

  Widget _startButton(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      child: NeumorphicButton(
        style: NeumorphicStyle(
          surfaceIntensity: 0.40,
          depth: 4,
          boxShape: NeumorphicBoxShape.circle(),
          shape: NeumorphicShape.concave,
          border: NeumorphicBorder(width: 6, color: Colors.white24),
        ),
        child: Center(
          child: Text(
            'Start',
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              color: NeumorphicTheme.defaultTextColor(context),
            ),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/quiz');
        },
      ),
    );
  }

  Widget _pointsOfGame(
      BuildContext context, Result lastResult, Result bestResult) {
    return Container(
      height: 170,
      child: Row(
        children: [
          Expanded(
            child: Neumorphic(
              style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
                depth: 2,
                intensity: 0.8,
                lightSource: LightSource.topLeft,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NeumorphicText(
                    "Last game",
                    style: NeumorphicStyle(
                      color: NeumorphicTheme.defaultTextColor(context),
                      depth: 0,
                    ),
                    textStyle: NeumorphicTextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NeumorphicText(
                        '${lastResult.points}',
                        style: NeumorphicStyle(
                          color: NeumorphicTheme.defaultTextColor(context),
                          depth: 0,
                        ),
                        textStyle: NeumorphicTextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      NeumorphicText(
                        " points",
                        style: NeumorphicStyle(
                          color: NeumorphicTheme.defaultTextColor(context),
                          depth: 0,
                        ),
                        textStyle: NeumorphicTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  NeumorphicText(
                    "in ${lastResult.playingTime} seconds",
                    style: NeumorphicStyle(
                      color: NeumorphicTheme.defaultTextColor(context),
                      depth: 0,
                    ),
                    textStyle: NeumorphicTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Neumorphic(
              style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                boxShape:
                NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
                depth: 2,
                intensity: 0.8,
                lightSource: LightSource.topLeft,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NeumorphicText(
                    "Best game",
                    style: NeumorphicStyle(
                      color: NeumorphicTheme.defaultTextColor(context),
                      depth: 0,
                    ),
                    textStyle: NeumorphicTextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NeumorphicText(
                        "${bestResult.points}",
                        style: NeumorphicStyle(
                          color: NeumorphicTheme.defaultTextColor(context),
                          depth: 0,
                        ),
                        textStyle: NeumorphicTextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      NeumorphicText(
                        " points",
                        style: NeumorphicStyle(
                          color: NeumorphicTheme.defaultTextColor(context),
                          depth: 0,
                        ),
                        textStyle: NeumorphicTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  NeumorphicText(
                    "in ${bestResult.playingTime} seconds",
                    style: NeumorphicStyle(
                      color: NeumorphicTheme.defaultTextColor(context),
                      depth: 0,
                    ),
                    textStyle: NeumorphicTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _achievement(BuildContext context, List<Result> results) {
    _addToChartData(results);
    return Expanded(
      child: Neumorphic(
        style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
          depth: 2,
          intensity: 0.8,
          lightSource: LightSource.topLeft,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    NeumorphicText(
                      "Achievement chart",
                      style: NeumorphicStyle(
                        color: NeumorphicTheme.defaultTextColor(context),
                        depth: 0,
                      ),
                      textStyle: NeumorphicTextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              _showChart(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showChart() {
    if (data.length < 5) {
      return Expanded(
        flex: 3,
        child: Center(
          child: NeumorphicText(
            "Play at least 5 games to show the chart",
            style: NeumorphicStyle(
              color: NeumorphicTheme.defaultTextColor(context),
              depth: 0,
            ),
            textStyle: NeumorphicTextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
    return Expanded(
      flex: 3,
      child: Chart(
        data: data,
      ),
    );
  }
}

