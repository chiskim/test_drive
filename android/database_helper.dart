import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_drive/JsonModels/accounts.dart';
import 'package:test_drive/JsonModels/users.dart';

class DatabaseHelper {
  final databaseName = "finance.db";
  String accountTable =
      "CREATE TABLE Accounts (accountId VARCHAR PRIMARY KEY NOT NULL,usrId INTEGER FOREIGN KEY NOT NULL,accountName TEXT NOT NULL, Balance DECIMAL NOT NULL, createdAt TEXT DEFAULT CURRENT_TIMESTAMP)";
  
  //Now we must create our user table into our sqlite db

  String users =
      "create table users (usrId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, usrName TEXT UNIQUE, usrPassword TEXT)";
//String.fromCharCode(charCode)
  String expenseTable=
  "CREATE TABLE Expenses (expenseId VARCHAR PRIMARY KEY, usrId INTEGER FOREIGN KEY, category TEXT NOT NULL, Balance DECIMAL NOT NULL,createdAt TEXT DEFAULT CURRENT_TIMESTAMP)";

  String investmentTable=
  "CREATE TABLE Investments (InvestmentId VARCHAR PRIMARY KEY, usrId INTEGER FOREIGN KEY, category TEXT NOT NULL, Balance DECIMAL NOT NULL,createdAt TEXT DEFAULT CURRENT_TIMESTAMP)";

  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      onConfigure(Database db) async {
  // Add support for cascade delete
  await db.execute("PRAGMA foreign_keys = ON");
}

var db = await openDatabase(path, onConfigure: onConfigure);
      await db.execute(users);
      await db.execute(accountTable);
      await db.execute(expenseTable);
      await db.execute(investmentTable);
      
    });
  }

  //Now we create login and sign up method
  

  //Login Method

  Future<bool> login(Users user) async {
    final Database db = await initDB();

    // I forgot the password to check
    var result = await db.rawQuery(
        "select * from users where usrName = '${user.usrName}' AND usrPassword = '${user.usrPassword}'");
    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  //Sign up
  Future<int> signup(Users user) async {
    final Database db = await initDB();

    return db.insert('users', user.toMap());
  }

  //Search Method for Accounts
  Future<List<accountModel>> searchAccounts(String keyword) async {
    final Database db = await initDB();
    List<Map<String, Object?>> searchResult = await db
        .rawQuery("select * from accounts where accountName LIKE ?", ["%$keyword%"]);
    return searchResult.map((e) => accountModel.fromMap(e)).toList();
  }

  //CRUD Methods for Accounts Table

  //Create Account
  Future<int> createAccount(accountModel user) async {
    final Database db = await initDB();
    return db.insert('Accounts', user.toMap());
    
  }

  //Get accounts
  Future<List<accountModel>> getAccount() async {
    final Database db = await initDB();
    List<Map<String, Object?>> result = await db.query('account');
    return result.map((e) => accountModel.fromMap(e)).toList();
  }

  //Delete Accounts
  Future<int> deleteAccount(int accountId) async {
    final Database db = await initDB();
    return db.delete('account', where: 'accountId = ?', whereArgs: [accountId]);
  }

  //Update Accounts
  Future<int> updateAccount(accountName, accountId) async {
    final Database db = await initDB();
    return db.rawUpdate(
        'update account set accountName = ? where accountId = ?',
        [accountName, accountId]);
  }
}

//CRUD methods for Expense table

//CRUD methods for Investments table


//Display method for records page