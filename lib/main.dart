import 'package:flutter/material.dart';
import 'package:tweet_sample/db/sql_db/db.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SqlDB.instance.initTweetDB();

  runApp(
    const MyApp(),
  );
}
