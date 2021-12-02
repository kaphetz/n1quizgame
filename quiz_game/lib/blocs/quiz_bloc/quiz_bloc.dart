import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_game/blocs/quiz_bloc/quiz_event.dart';
import 'package:quiz_game/blocs/quiz_bloc/quiz_state.dart';
import 'package:quiz_game/database/db_helper.dart';
import 'package:quiz_game/repositories/word_repositories.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final WordRepositories wordRepositories;

  QuizBloc({@required this.wordRepositories})
      : assert(wordRepositories != null),
        super(QuizLoading(null));

  @override
  Stream<QuizState> mapEventToState(QuizEvent event) async* {
    yield QuizLoading(null);
    if (event is GetQuestion) {
      try {
        var db = await database;
        final listWords = await wordRepositories.selectListWord(db);
        yield GetWordSuccess.copyWith(listWords: listWords);
      } on Exception catch (_) {
        yield GetWordFailure(null);
      }
    } else if (event is ChangeQuestion) {
      yield GetWordSuccess.copyWith(listWords: event.listWord);
    }
  }
}
