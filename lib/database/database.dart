import 'dart:async';
import 'package:floor/floor.dart';
import 'package:secondapp/database/client_dao.dart';
import 'package:secondapp/database/model.dart';
import 'package:secondapp/database/produit_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart'; 

@Database(version: 1, entities: [Client,Produit])
abstract class AppDatabase extends FloorDatabase {
  ClientDAO get clientDao;
  ProduitDAO get produitDAO;

  static Future<AppDatabase> create(){
    return $FloorAppDatabase.databaseBuilder('test.db').build();
  }
}