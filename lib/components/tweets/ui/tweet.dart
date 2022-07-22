import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:tweet_sample/components/tweet_reactions/ui/tweet_reaction.dart';
import 'package:tweet_sample/components/tweets/di/tweet_vm.dart';
import 'package:tweet_sample/components/tweets/di/tweets_count.dart';

/// Tweet item widget
class TweetWidget extends StatefulWidget {
  final TweetVM tweetVM;
  const TweetWidget({
    Key? key,
    required this.tweetVM,
  }) : super(key: key);

  @override
  State<TweetWidget> createState() => _TweetWidget();
}

class _TweetWidget extends State<TweetWidget> {
  TweetVM get tweetVM => widget.tweetVM;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (ctx) {
      return InkWell(
        onTap: (tweetVM.tweetData.isReacted == 0)
            ? () {
                showModalBottomSheet<void>(
                  isScrollControlled: true,
                  context: ctx,
                  builder: (BuildContext _) {
                    return TweetReaction(
                      reactionLike: () {
                        setState(() {
                          tweetVM.changeReactionStatus(
                              true, 'like', tweetsCountInstance.reactionsCount);
                        });

                        Navigator.pop(_);
                      },
                      reactionThumbDown: () {
                        setState(() {
                          tweetVM.changeReactionStatus(true, 'thumbDown',
                              tweetsCountInstance.reactionsCount);
                        });

                        Navigator.pop(_);
                      },
                      reactionThumbUp: () {
                        setState(() {
                          tweetVM.changeReactionStatus(true, 'thumbUp',
                              tweetsCountInstance.reactionsCount);
                        });

                        Navigator.pop(_);
                      },
                    );
                  },
                );
              }
            : () {
                setState(() {
                  tweetVM.changeReactionStatus(
                      false, '', tweetsCountInstance.reactionsCount);
                });
              },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tweetVM.tweetData.content,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            tweetVM.widgetReactionChange(
              tweetVM.reactionCompare(tweetVM.tweetData.reaction),
            ),
          ],
        ),
      );
    });
  }
}
