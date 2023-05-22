import 'dart:async';
import 'package:floor/floor.dart';
import 'package:secondapp/database/client_dao.dart';
import 'package:secondapp/database/model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart'; 

@Database(version: 1, entities: [Client])
abstract class AppDatabase extends FloorDatabase {
  ClinetDAO get clientDao;

  static Future<AppDatabase> create(){
    return $FloorAppDatabase.databaseBuilder('test.db').build();
  }
}