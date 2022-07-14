import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

/// Sql db class
class SqlDB {
  /// SQL database instance
  static final SqlDB db = SqlDB();
  Database? _tweetsDB;
  Database? _tweetsCountDB;

  /// Init database tweets
  Future<Database> get databaseTweets async {
    if (_tweetsDB != null) return _tweetsDB!;
    _tweetsDB = await initTweetDB();
    return _tweetsDB!;
  }

  /// Init database tweets count
  Future<Database> get databaseTweetsCounts async {
    if (_tweetsCountDB != null) return _tweetsCountDB!;
    _tweetsCountDB = await initTweetDB();
    return _tweetsCountDB!;
  }

  /// Inition tweet database
  initTweetDB() async {
    Directory _docDir = await getApplicationSupportDirectory();
    String _dbPath = join(_docDir.path, 'tweet_db.db');

    return await openDatabase(
      _dbPath,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute("CREATE TABLE tweets ("
            "id INTEGER PRIMARY KEY,"
            "content TEXT,"
            "reaction TEXT,"
            "isReacted TEXT"
            " )");
      },
    );
  }

  /// Inition tweet database counts
  initTweetCountDB() async {
    Directory _docDir = await getApplicationSupportDirectory();
    String _dbPath = join(_docDir.path, 'tweet_counter_db.db');

    return await openDatabase(
      _dbPath,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute("CREATE TABLE tweetsCount ("
            "tweetsCount INTEGER PRIMARY KEY,"
            " )");
      },
    );
  }
}
