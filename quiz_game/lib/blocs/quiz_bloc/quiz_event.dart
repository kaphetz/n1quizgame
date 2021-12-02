import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:quiz_game/models/word.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();
}

class GetQuestion extends QuizEvent {

  const GetQuestion();

  @override
  List<Object> get props => [];
}

class ChangeQuestion extends QuizEvent {
  final List<Word> listWord;

  const ChangeQuestion({@required this.listWord});

  @override
  List<Object> get props => [];
}