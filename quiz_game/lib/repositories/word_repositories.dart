import 'package:quiz_game/models/word.dart';
import 'package:quiz_game/utils/const.dart';
import 'package:sqflite/sqflite.dart';


class WordRepositories {
  Future<Word> getFirstWord(Database db) async {
    var results = await db.query(
      wordTableName,
      columns: [
        columnId,
        columnWord,
      ],
      limit: 1,
    );
    return Word.fromMap(results.first);
  }

}