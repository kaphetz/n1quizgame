import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:quiz_game/blocs/home_bloc/home_bloc.dart';
import 'package:quiz_game/blocs/home_bloc/home_event.dart';
import 'package:quiz_game/blocs/quiz_game_bloc_observer.dart';
import 'package:quiz_game/repositories/result_repositories.dart';
import 'package:quiz_game/screens/home_screen.dart';
import 'package:quiz_game/screens/info_screen.dart';
import 'package:quiz_game/screens/quiz_screen.dart';
import 'package:quiz_game/screens/result_screen.dart';
import 'package:sizer/sizer.dart';

Future main() async {
  Bloc.observer = QuizGameBlocObserver();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<HomeBloc>(
          create: (context) =>
              HomeBloc(resultRepositories: ResultRepositories())
                ..add(HomeRequest()))
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return WillPopScope(
        onWillPop: () async => false,
        child: NeumorphicApp(
          initialRoute: '/home',
          routes: <String, WidgetBuilder>{
            '/home': (context) => HomeScreen(),
            '/quiz': (context) => QuizScreen(),
            '/result': (context) => ResultScreen(),
            '/info': (context) => InfoScreen(),
          },
          debugShowCheckedModeBanner: false,
          title: 'Quiz game',
          themeMode: ThemeMode.light,
          theme: NeumorphicThemeData(
            baseColor: Color(0xFFE8E7E7),
            lightSource: LightSource.topLeft,
            defaultTextColor: Color(0xFF636262),
            depth: 6,
          ),
          darkTheme: NeumorphicThemeData(
            baseColor: Color(0xFF3E3E3E),
            lightSource: LightSource.topLeft,
            defaultTextColor: Color(0xFFE8E7E7),
            depth: 6,
          ),
          home: HomeScreen(),
        ),
      );
    });
  }
}