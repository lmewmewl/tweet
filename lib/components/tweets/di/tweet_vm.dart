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
  bool isReacted;

  @observable
  Reactions currentReaction = Reactions.noReaction;

  _TweetVM({
    required this.isReacted,
  });

  @action
  Future<void> changeReactionStatus(Reactions current, bool reacted,
      TweetModel model, String newReaction, int globalCount) async {
    currentReaction = current;
    isReacted = reacted;

    int flag = (reacted) ? 1 : 0;

    model.reaction = newReaction;
    model.isReacted = flag;

    _countUpdate();

    await _updateReaction(model);
  }

  @action
  int _countUpdate() {
    if (isReacted == true) {
      return tweetsCountInstance.reactionsCount++;
    } else {
      return tweetsCountInstance.reactionsCount--;
    }
  }

  @action
  void reactionCompare(String reaction) {
    switch (reaction) {
      case 'thumbUp':
        {
          currentReaction = Reactions.thumbUp;
          break;
        }
      case 'thumbDown':
        {
          currentReaction = Reactions.thumbDown;
          break;
        }
      case 'like':
        {
          currentReaction = Reactions.like;
          break;
        }
      case "":
        {
          currentReaction = Reactions.noReaction;
        }
    }
  }

  @action
  Future<void> _updateReaction(TweetModel model) async {
    await SqlDB.instance.updateTweet(model);
  }

  @action
  Widget widgetReactionChange(Reactions reacts) {
    switch (reacts) {
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
