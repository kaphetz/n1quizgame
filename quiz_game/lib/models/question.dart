import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Question extends Equatable {
  int id;
  int number;
  String word;
  bool isCorrect;

  Question({
    this.id,
    this.number,
    this.word,
    this.isCorrect,
  });

  @override
  List<Object> get props => [
    id,
    number,
    word,
    isCorrect,
  ];
}
