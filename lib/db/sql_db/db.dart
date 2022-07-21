import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tweet_sample/components/tweets/model/tweet_model.dart';

/// Sql db class
class SqlDB {
  /// Singleton instance
  SqlDB._();
  static final SqlDB instance = SqlDB._();

  Database? _tweetsDB;

  /// Init database tweets
  Future<Database> get databaseTweets async {
    if (_tweetsDB != null) return _tweetsDB!;
    _tweetsDB = await initTweetDB();
    return _tweetsDB!;
  }

  /// Inition tweet database
  initTweetDB() async {
    Directory docDir = await getApplicationSupportDirectory();
    String dbPath = join(docDir.path, 'tweet_db.db');

    return await openDatabase(dbPath,
        version: 1, onOpen: (db) {}, onCreate: _onCreateInitTweetDB);
  }

  /// On create
  Future _onCreateInitTweetDB(Database db, int version) async {
    const intType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const boolType = 'INTEGER NOT NULL';
    const stringType = 'TEXT';
    const reactionType = 'TEXT';

    await db.execute('''CREATE TABLE $tableTweets (
        ${TweetModelFileds.id} $intType,
        ${TweetModelFileds.content} $stringType,
        ${TweetModelFileds.reaction} $reactionType,
        ${TweetModelFileds.isReacted} $boolType
         )''');
  }

  /// Close db
  Future<void> closeTweetDB() async {
    final db = instance._tweetsDB;

    await db!.close();
  }

  Future<int> create(TweetModel model) async {
    Map<String, dynamic> tweet = model.toMap();

    final db = await instance.databaseTweets;
    int newTweetID = await db.insert(tableTweets, tweet,
        conflictAlgorithm: ConflictAlgorithm.replace);

    return newTweetID;
  }

  /// Read all tweets
  Future<List<TweetModel>> readAllTweets() async {
    final db = await instance.databaseTweets;

    List<Map<String, dynamic>> list = await db.query(tableTweets);

    List<TweetModel> currentList = List.generate(list.length, (index) {
      return TweetModel(
        id: list[index]['id'],
        content: list[index]['content'],
        reaction: list[index]['reaction'],
        isReacted: list[index]['isReacted'],
      );
    });

    return currentList;
  }

  Future<int> updateTweet(TweetModel model) async {
    final db = await instance.databaseTweets;
    Map<String, dynamic> json = model.toMap();

    int dbUpdate = await db.update(
      tableTweets,
      json,
      where: 'id = ?',
      whereArgs: [model.id],
    );

    return dbUpdate;
  }
}
