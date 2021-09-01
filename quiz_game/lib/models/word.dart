import 'package:equatable/equatable.dart';

class Word extends Equatable {
  int id;
  String word;
  String yomikata;
  String mean;
  String example;
  String exampleVn;
  int numberOfOccurrences;

  Word({
    this.id,
    this.word,
    this.yomikata,
    this.mean,
    this.example,
    this.exampleVn,
    this.numberOfOccurrences,
  });

  @override
  List<Object> get props => [
        id,
        word,
        yomikata,
        mean,
        example,
        exampleVn,
        numberOfOccurrences,
      ];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'word': word,
      'yomikata': yomikata,
      'mean': mean,
      'example': example,
      'exampleVn': exampleVn,
      'numberOfOccurrences': numberOfOccurrences,
    };
  }

  Word.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    word = map['word'];
    yomikata = map['yomikata'];
    mean = map['mean'];
    example = map['example'];
    exampleVn = map['exampleVn'];
    numberOfOccurrences = map['numberOfOccurrences'];
  }
}
