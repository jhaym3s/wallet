import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../models/wallet.dart';
//import 'package:web3dart/credentials.dart';


class SqlDatabaseHelper{

  SqlDatabaseHelper._createInstance();
  
  static final SqlDatabaseHelper instance = SqlDatabaseHelper._createInstance();

  static Database? _database;

  Future<Database> get database async{
    return _database ??= await _initializeDatabase();
  }

  Future<Database> _initializeDatabase() async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path =join(documentsDirectory.path, "wallets.db");
    return await openDatabase(path, 
    version: 1, 
    onCreate: _onCreate);
  }
  


  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute(''' 
    CREATE TABLE wallets(
      id INTEGER PRIMARY KEY,
      name TEXT
    )
    ''');
  }

  Future<List<Wallet>> getWallets()async{
      Database db = await instance.database;
      var walletsMap = await db.query('wallets', orderBy: 'name');
      List<Wallet> walletList  = walletsMap.isNotEmpty? walletsMap.map((e) => Wallet.fromMap(e)).toList(): [];
      return walletList;
  }

  Future<int> add(Wallet wallet)async{
    Database db  = await instance.database;
    return await db.insert('wallets', wallet.toMap());
  }

  Future<int> remove(int id) async{
    Database db = await instance.database;
    return await db.delete('wallets', where: 'id = ?', whereArgs: [id]);
  }
}