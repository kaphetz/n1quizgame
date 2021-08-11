import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:quiz_game/blocs/quiz_game_bloc_observer.dart';
import 'package:quiz_game/screens/home_screen.dart';
import 'package:sizer/sizer.dart';

Future main() async {
  Bloc.observer = QuizGameBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return NeumorphicApp(
        debugShowCheckedModeBanner: false,
        title: 'Quiz game',
        themeMode: ThemeMode.light,
        theme: NeumorphicThemeData(
          baseColor: Color(0xFFF4F5F5),
          lightSource: LightSource.topLeft,
          defaultTextColor: Color(0xFF636262),
          depth: 10,
        ),
        darkTheme: NeumorphicThemeData(
          baseColor: Color(0xFF3E3E3E),
          lightSource: LightSource.topLeft,
          depth: 6,
        ),
        home: HomeScreen(),
      );
    });
  }
}