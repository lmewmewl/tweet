import 'package:flutter/material.dart';
import 'package:tweet_sample/components/tweets/di/tweet_vm.dart';
import 'package:tweet_sample/components/tweets/model/tweet_model.dart';
import 'package:tweet_sample/components/tweets/ui/tweet.dart';
import 'package:tweet_sample/db/sql_db/db.dart';
import 'package:tweet_sample/service/async_statuses/async_statuses.dart';
import 'package:mobx/mobx.dart';

part 'main_screen_vm.g.dart';

class MainScreenVM = _MainScreenVM with _$MainScreenVM;

abstract class _MainScreenVM with Store {
  @observable
  AsyncStatus currrentStatus = AsyncStatus.empty;

  @observable
  List<TweetModel> tweetList = [];

  @action
  void getTweetList() async {
    currrentStatus = AsyncStatus.downloading;
    final list = await SqlDB.instance.readAllTweets();

    tweetList.addAll(list);
    currrentStatus = AsyncStatus.downloaded;
  }

  @action
  Widget mainTweetWidget(AsyncStatus status) {
    switch (status) {
      case AsyncStatus.empty:
        {
          return const Center(
            child: Text('Empty list'),
          );
        }
      case AsyncStatus.downloaded:
        {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            itemCount: tweetList.length,
            itemBuilder: (context, index) => TweetWidget(
              tweetVM: TweetVM(isReacted: tweetList[index].isReacted),
              tweetData: tweetList[index],
            ),
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          );
        }
      case AsyncStatus.downloading:
        {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      case AsyncStatus.error:
        {
          return const Center(
            child: Text('Error'),
          );
        }
    }
  }
}
