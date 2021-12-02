import 'package:quiz_game/models/word.dart';
import 'package:quiz_game/utils/const.dart';
import 'package:sqflite/sqflite.dart';


class WordRepositories {
  Future<List<Word>> selectListWord(Database db) async {
    var results = await db.query(
      wordTableName,
      columns: [
        columnId,
        columnWord,
        columnYomikata,
        columnMean,
      ],
      where: '$columnNumberOfOccurences < 20',
    );
    if (results.length == 0){
      return null;
    } else {
      List<Word> listResult = [];
      for(final item in results){
        listResult.add(Word.fromMap(item));
      }
      return listResult;
    }
  }

}