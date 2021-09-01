import 'package:equatable/equatable.dart';

class Result extends Equatable {
  int id;
  int points;
  int playingTime;

  Result({
    this.id,
    this.points,
    this.playingTime,
  });

  @override
  List<Object> get props => [
        id,
        points,
        playingTime,
      ];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'points': points,
      'playingTime': playingTime,
    };
  }

  Result.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    points = map['points'];
    playingTime = map['playingTime'];
  }
}
