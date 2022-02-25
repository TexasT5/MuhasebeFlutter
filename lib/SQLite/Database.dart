import 'dart:async';
import 'dart:io';


import 'package:muhasebeflutter/Model/User.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Databases{
  static const _databaseName = "muhasebe.db";
  static const _userTableName = "User_DB";
  static const _databaseVersion = 1;
  Database? _database;


  static final columnId = 'id';
  static final columnName = 'name';
  static final price = 'price';
  static final currency = 'currency';

  Future<void> open() async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String dir = await getDatabasesPath();
    String path = join(documentsDirectory.path , _databaseName);
    _database = await openDatabase(path , version: _databaseVersion  , onCreate: _onCreate);
  }

  FutureOr<void> _onCreate(Database db, int version) async{
    await db.execute("CREATE TABLE IF NOT EXISTS $_userTableName($columnId INTEGER PRIMARY KEY,$columnName VARCHAR(20), $price VARCHAR(100) , $currency VARCHAR(10))");
  }


  Future<void> insert(User user) async{
    var user2 = User(id: 1 , name: "assd" , currency: "asd" , price: "asd");

    await open();
    var db = await _database;
    if(db != null) db.insert(_userTableName, user2.toJson());
    else print("db null");
  }



  Future<List<User>> getList() async {
    await open();
    var db = await _database;
    List<Map> list = await db!.query(_userTableName);
    list.map((e) => {print(e)});

    return list.map((e) => User.fromJson(e)).toList();
  }

  Future<void> remove() async{
    await open();
    var db = await _database;
    db!.execute("DROP TABLE $_userTableName");
  }


  Future<void> close() async{
    await open();
    var db = await _database;
    await db!.close();
  }

  Future<void> update(User user) async{
    await open();
    var db = await _database;
    await db!.update(_userTableName, user.toJson());
    await close();
  }
}
