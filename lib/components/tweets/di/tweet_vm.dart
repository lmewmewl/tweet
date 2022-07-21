import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:tweet_sample/components/tweets/di/tweets_count.dart';
import 'package:tweet_sample/components/tweets/model/tweet_model.dart';
import 'package:tweet_sample/db/sql_db/db.dart';

part 'tweet_vm.g.dart';

/// Tweet reactions
enum Reactions { thumbUp, thumbDown, like, noReaction }

/// Tweet View Model
class TweetVM = _TweetVM with _$TweetVM;

abstract class _TweetVM with Store {
  @observable
  TweetModel tweetData;

  @observable
  Reactions currentReaction = Reactions.noReaction;

  _TweetVM({
    required this.tweetData,
  });

  @action
  Future<void> changeReactionStatus(
      bool reacted, String newReaction, int globalCount) async {
    int flag = (reacted) ? 1 : 0;

    tweetData.reaction = newReaction;
    tweetData.isReacted = flag;
    reactionCompare(newReaction);
    _countUpdate();

    await _updateReaction(tweetData);
  }

  @action
  int _countUpdate() {
    bool isReacted = (tweetData.isReacted == 1) ? true : false;
    if (isReacted == true) {
      return tweetsCountInstance.reactionsCount++;
    } else {
      return tweetsCountInstance.reactionsCount--;
    }
  }

  @action
  Future<void> _updateReaction(TweetModel model) async {
    await SqlDB.instance.updateTweet(model);
  }

  @action
  Reactions reactionCompare(String reaction) {
    switch (reaction) {
      case 'thumbUp':
        {
          return currentReaction = Reactions.thumbUp;
        }
      case 'thumbDown':
        {
          return currentReaction = Reactions.thumbDown;
        }
      case 'like':
        {
          return currentReaction = Reactions.like;
        }
      default:
        {
          return currentReaction = Reactions.noReaction;
        }
    }
  }

  @action
  Widget widgetReactionChange(Reactions reactions) {
    switch (reactions) {
      case Reactions.thumbUp:
        {
          return const Text('👍');
        }
      case Reactions.thumbDown:
        {
          return const Text('👎');
        }
      case Reactions.like:
        {
          return const Text('♥️');
        }

      case Reactions.noReaction:
        {
          return Container();
        }
    }
  }
}
