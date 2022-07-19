import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tweet_sample/components/tweet_reactions/ui/tweet_reaction.dart';
import 'package:tweet_sample/components/tweets/di/tweet_vm.dart';
import 'package:tweet_sample/components/tweets/model/tweet_model.dart';

/// Tweet item widget
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
  void initState() {
    tweetVM.reactionCompare(tweetData.reaction!);

    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Observer(builder: (_) {
      return InkWell(
        onTap: (tweetVM.isReacted == false)
            ? () {
                showModalBottomSheet<void>(
                  context: _,
                  builder: (BuildContext _) {
                    return TweetReaction(
                      reactionLike: () {
                        tweetData.isReacted =
                            tweetVM.changeReactionStatus(Reactions.like, true);
                        tweetData.reaction = 'like';

                        tweetVM.updateReaction(tweetData);

                        Navigator.pop(_);
                      },
                      reactionThumbDown: () {
                        tweetData.isReacted = tweetVM.changeReactionStatus(
                            Reactions.thumbDown, true);
                        tweetData.reaction = 'thumbDown';
                        tweetVM.updateReaction(tweetData);

                        Navigator.pop(_);
                      },
                      reactionThumbUp: () {
                        tweetData.isReacted = tweetVM.changeReactionStatus(
                            Reactions.thumbUp, true);
                        tweetData.reaction = 'thumbUp';
                        tweetVM.updateReaction(tweetData);

                        Navigator.pop(_);
                      },
                    );
                  },
                );
              }
            : () {
                tweetData.isReacted =
                    tweetVM.changeReactionStatus(Reactions.noReaction, false);
                tweetData.reaction = '';
                tweetVM.updateReaction(tweetData);
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
