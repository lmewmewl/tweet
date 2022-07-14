import 'package:flutter/material.dart';
import 'package:tweet_sample/components/tweet_reactions/ui/tweet_reaction.dart';
import 'package:tweet_sample/components/tweets/di/tweet_vm.dart';

class TweetWidget extends StatefulWidget {
  final int id;
  final String content;
  final String? reaction;
  final bool isReacted;
  final TweetReaction tweetReactions;
  final TweetVM tweetVM;
  const TweetWidget({
    Key? key,
    required this.id,
    required this.content,
    required this.reaction,
    required this.isReacted,
    required this.tweetReactions,
    required this.tweetVM,
  }) : super(key: key);

  @override
  State<TweetWidget> createState() => _TweetWidgetState();
}

class _TweetWidgetState extends State<TweetWidget> {
  TweetVM get tweetVM => widget.tweetVM;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {
          showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return widget.tweetReactions;
              });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.content,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            (widget.isReacted == true)
                ? tweetVM.reaction(tweetVM.currentReaction)
                : Container(),
          ],
        ),
      ),
    );
  }
}
