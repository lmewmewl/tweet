import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tweet_sample/components/tweet_reactions/ui/tweet_reaction.dart';
import 'package:tweet_sample/components/tweets/di/tweet_vm.dart';
import 'package:tweet_sample/components/tweets/model/tweet_model.dart';

class TweetWidget extends StatefulWidget {
  final TweetModel tweetData;
  final TweetVM tweetVM;
  const TweetWidget({
    Key? key,
    required this.tweetVM,
    required this.tweetData,
  }) : super(key: key);

  @override
  State<TweetWidget> createState() => _TweetWidget();
}

class _TweetWidget extends State<TweetWidget> {
  TweetVM get tweetVM => widget.tweetVM;

  TweetModel get tweetData => widget.tweetData;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Observer(builder: (_) {
      return TextButton(
        onPressed: () {
          (tweetVM.isReacted == false)
              ? showModalBottomSheet<void>(
                  context: _,
                  builder: (BuildContext context) {
                    return TweetReaction(
                      reactionLike: () {
                        tweetVM.changeReactionStatus(Reactions.like, true);
                        Navigator.pop(_);
                      },
                      reactionThumbDown: () {
                        tweetVM.changeReactionStatus(Reactions.thumbDown, true);
                        Navigator.pop(_);
                      },
                      reactionThumbUp: () {
                        tweetVM.changeReactionStatus(Reactions.thumbUp, true);
                        Navigator.pop(_);
                      },
                    );
                  })
              : tweetVM.changeReactionStatus(Reactions.noReaction, false);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tweetData.content,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            tweetVM.widgetReactionChange(tweetVM.currentReaction)
          ],
        ),
      );
    });
  }
}
