import 'dart:async';
import 'dart:io';


import 'package:muhasebeflutter/Model/User.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Databases{
  static const _databaseName = "muhasebe.db";
  static const _userTableName = "Test";
  static const _databaseVersion = 1;
  Database? _database;


  static final columnId = 'id';
  static final columnName = 'name';
  static final currency = 'currency';
  static final currencyType = 'currencyType';

  Future<void> open() async{
    String dir = await getDatabasesPath();
    String path = join(dir , _databaseName);
    _database = await openDatabase(path , version: _databaseVersion  , onCreate: _onCreate);
  }

  FutureOr<void> _onCreate(Database db, int version) async{
    await db.execute("CREATE TABLE IF NOT EXISTS $_userTableName($columnId INTEGER PRIMARY KEY,$columnName VARCHAR(10) )");
  }


  Future<void> insert(User user) async{
    if(_database == null) open();
    var db = await _database;
    db!.insert(_userTableName, user.toJson());
  }



  Future<List<User>> getList() async {
    if(_database == null) open();
    var db = await _database;
    List<Map> list = await db!.query(_userTableName);
    return list.map((e) => User.fromJson(e)).toList();
  }

  Future<void> remove() async{
    if(_database == null) open();
    var db = await _database;
    db!.execute("DROP TABLE $_userTableName");
  }


  Future<void> close() async{
    if(_database == null) open();
    var db = await _database;
    await db!.close();
  }


}
