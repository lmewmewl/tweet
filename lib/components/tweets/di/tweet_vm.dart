import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Reactions { thumbUp, thumbDown, like, noReaction }

// final TweetVM

class TweetVM {
  Reactions currentReaction = Reactions.noReaction;

  Widget reaction(Reactions reacts) {
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
