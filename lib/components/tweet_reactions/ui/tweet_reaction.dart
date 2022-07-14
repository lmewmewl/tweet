import 'package:flutter/material.dart';

class TweetReaction extends StatefulWidget {
  final Function()? reactionThumbUp;
  final Function()? reactionThumbDown;
  final Function()? reactionLike;

  const TweetReaction({
    Key? key,
    this.reactionThumbUp,
    this.reactionThumbDown,
    this.reactionLike,
  }) : super(key: key);

  @override
  State<TweetReaction> createState() => _TweetReactionState();
}

class _TweetReactionState extends State<TweetReaction> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: widget.reactionThumbUp,
            child: const Text('👍'),
          ),
          TextButton(
            onPressed: widget.reactionThumbDown,
            child: const Text('👎'),
          ),
          TextButton(
            onPressed: widget.reactionLike,
            child: const Text('♥️'),
          ),
        ],
      ),
    );
  }
}
