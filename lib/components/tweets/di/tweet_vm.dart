import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'tweet_vm.g.dart';

enum Reactions { thumbUp, thumbDown, like, noReaction }

// final TweetVM
class TweetVM = _TweetVM with _$TweetVM;

abstract class _TweetVM with Store {
  bool isReacted;

  @observable
  Reactions currentReaction = Reactions.noReaction;

  _TweetVM({
    required this.isReacted,
  });

  @action
  void changeReactionStatus(Reactions current, bool reaction) {
    currentReaction = current;
    isReacted = reaction;
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
