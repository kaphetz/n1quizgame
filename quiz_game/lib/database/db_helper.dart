import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> get database async {
  var databasePath = await getDatabasesPath();
  var path = join(databasePath, 'quizgame.db');
  var exists = await databaseExists(path);

  if (!exists) {
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (_) {}
    var data = await rootBundle.load(join('assets', 'quizgame.db'));
    List<int> bytes = data.buffer.asUint8List(
      data.offsetInBytes,
      data.lengthInBytes,
    );

    await File(path).writeAsBytes(bytes, flush: true);
  }
  return await openDatabase(path);
}
