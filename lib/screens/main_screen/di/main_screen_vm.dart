import 'package:flutter/material.dart';
import 'package:tweet_sample/components/tweets/di/tweet_vm.dart';
import 'package:tweet_sample/components/tweets/di/tweets_count.dart';
import 'package:tweet_sample/components/tweets/model/tweet_model.dart';
import 'package:tweet_sample/components/tweets/ui/tweet.dart';
import 'package:tweet_sample/db/sql_db/db.dart';
import 'package:tweet_sample/service/async_statuses/async_statuses.dart';
import 'package:mobx/mobx.dart';

part 'main_screen_vm.g.dart';

class MainScreenVM = _MainScreenVM with _$MainScreenVM;

abstract class _MainScreenVM with Store {
  /// Input controller
  @observable
  TextEditingController tweetCreateController = TextEditingController();

  _MainScreenVM() : super() {
    tweetCreateController.addListener(() {
      tweetContent = tweetCreateController.text;
    });
  }

  @observable
  String tweetContent = '';

  @observable
  AsyncStatus currrentStatus = AsyncStatus.empty;

  @observable
  List<TweetModel> tweetList = [];

  @action
  Future<void> createTweet() async {
    currrentStatus = AsyncStatus.downloading;
    if (tweetContent.isNotEmpty) {
      TweetModel model = TweetModel(
        content: tweetContent,
        isReacted: 0,
        reaction: '',
      );

      int newTweetID = await SqlDB.instance.create(model);
      model.id = newTweetID;
      tweetList.add(model);

      tweetCreateController.clear();
      currrentStatus = AsyncStatus.downloaded;
    }
  }

  @action
  Future<void> getTweetList() async {
    currrentStatus = AsyncStatus.downloading;

    try {
      final list = await SqlDB.instance.readAllTweets();
      if (list.isEmpty == true) {
        currrentStatus = AsyncStatus.empty;
      } else {
        tweetList.addAll(list);
        tweetsCountInstance.reactionsCount = 0;
        for (var item in list) {
          bool reaction = (item.isReacted == 1) ? true : false;
          if (reaction == true) {
            tweetsCountInstance.reactionsCount++;
          }
        }

        currrentStatus = AsyncStatus.downloaded;
      }
    } catch (e) {
      currrentStatus = AsyncStatus.error;
    }
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
            itemBuilder: (_, index) => TweetWidget(
              tweetVM: TweetVM(
                tweetData: tweetList[index],
              ),
            ),
            separatorBuilder: (BuildContext _, int index) => const Divider(),
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
