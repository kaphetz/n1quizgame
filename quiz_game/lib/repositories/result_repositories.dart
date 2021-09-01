import 'package:quiz_game/models/result.dart';
import 'package:quiz_game/utils/const.dart';
import 'package:sqflite/sqflite.dart';

class ResultRepositories {

  Future<Result> getLastResult(Database db) async {
    var results = await db.query(
      resultTableName,
      columns: [
        columnId,
        columnPoints,
        columnPlayingTime,
      ],
      orderBy: '$columnId DESC',
      limit: 1,
    );
    if (results.length == 0){
      return Result(id: 0, points: 0, playingTime: 0);
    } else {
      return Result.fromMap(results.first);
    }
  }

  Future<Result> getBestResult(Database db) async {
    var results = await db.query(
      resultTableName,
      columns: [
        columnId,
        columnPoints,
        columnPlayingTime,
      ],
      orderBy: '$columnPoints DESC, $columnPlayingTime DESC',
      limit: 1,
    );
    if (results.length == 0){
      return Result(id: 0, points: 0, playingTime: 0);
    } else {
      return Result.fromMap(results.first);
    }
  }

  Future<List<Result>> getRecentResult(Database db) async {
    var results = await db.query(
      resultTableName,
      columns: [
        columnId,
        columnPoints,
        columnPlayingTime,
      ],
      orderBy: '$columnId DESC',
      limit: 10,
    );
    if (results.length == 0){
      return null;
    } else {
      List<Result> listResult = [];
      for(final item in results){
        listResult.add(Result.fromMap(item));
      }
      return listResult;
    }
  }

}
