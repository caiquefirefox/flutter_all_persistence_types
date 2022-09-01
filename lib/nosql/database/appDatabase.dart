import 'dart:async';

import 'package:floor/floor.dart';
import '../daos/BookDao.dart';
import '../models/Book.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'appDatabase.g.dart';

@Database(version: 1, entities: [Book])
abstract class AppDatabase extends FloorDatabase {
  BookDao get bookDao;
}
