import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_game/blocs/home_bloc/home_event.dart';
import 'package:quiz_game/blocs/home_bloc/home_state.dart';
import 'package:quiz_game/database/db_helper.dart';
import 'package:quiz_game/repositories/result_repositories.dart';
import 'package:quiz_game/repositories/word_repositories.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ResultRepositories resultRepositories;

  HomeBloc({@required this.resultRepositories})
      : assert(resultRepositories != null),
        super(HomeLoading());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    yield HomeLoading();
    if (event is HomeRequest) {
      try {
        var db = await database;
        final lastResult = await resultRepositories.getLastResult(db);
        final bestResult = await resultRepositories.getBestResult(db);
        final recentResults = await resultRepositories.getRecentResult(db);
        yield HomeSuccess.copyWith(
          results: recentResults,
          lastResult: lastResult,
          bestResult: bestResult,
        );
      } on Exception catch (_) {
        yield HomeFailure();
      }
    }
  }
}
