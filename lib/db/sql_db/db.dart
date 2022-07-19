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
    const boolType = 'TEXT';
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

  Future<TweetModel> create(TweetModel model) async {
    final db = await instance.databaseTweets;
    final tweet = await db.insert(tableTweets, model.toMap());

    return model;
  }

  /// Read single tweet
  Future<TweetModel> readTweet(int id) async {
    final db = await instance.databaseTweets;

    final map = await db.query(
      tableTweets,
      columns: TweetModelFileds.values,
      where: '${TweetModelFileds.id} = ?',
      whereArgs: [id],
    );

    if (map.isNotEmpty) {
      return TweetModel.fromMap(map.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  /// Read all tweets
  Future<List<TweetModel>> readAllTweets() async {
    final db = await instance.databaseTweets;

    final list = await db.query(tableTweets);

    return list.map((json) => TweetModel.fromMap(json)).toList();
  }

  Future<int> updateTweet(TweetModel model) async {
    final db = await instance.databaseTweets;
    return db.update(
      tableTweets,
      model.toMap(),
      where: '${TweetModelFileds.id} = ?',
      whereArgs: [model.id],
    );
  }
}
