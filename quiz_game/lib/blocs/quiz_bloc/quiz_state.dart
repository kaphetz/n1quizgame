import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:quiz_game/models/word.dart';

abstract class QuizState extends Equatable {
  final List<Word> listWords;

  const QuizState(this.listWords);

  @override
  List<Object> get props => [];
}

class QuizLoading extends QuizState {
  QuizLoading(List<Word> listWords) : super(listWords);
}

class GetWordSuccess extends QuizState {
  final List<Word> listWords;

  const GetWordSuccess({
    @required this.listWords,
  }) : assert(listWords != null), super(null);

  factory GetWordSuccess.copyWith({List<Word> listWords}) {
    return GetWordSuccess(listWords: listWords);
  }
}

class GetWordFailure extends QuizState {
  GetWordFailure(List<Word> listWords) : super(listWords);
}
