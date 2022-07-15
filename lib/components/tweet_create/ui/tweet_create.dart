import 'package:flutter/material.dart';

import 'package:tweet_sample/components/tweet_create/di/tweet_create_vm.dart';

class TweetCreate extends StatefulWidget {
  final TweetCreateVM tweetCreateVM;
  const TweetCreate({
    Key? key,
    required this.tweetCreateVM,
  }) : super(key: key);

  @override
  State<TweetCreate> createState() => _TweetCreateState();
}

class _TweetCreateState extends State<TweetCreate> {
  TweetCreateVM get tweetCreateVM => widget.tweetCreateVM;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: tweetCreateVM.contentController,
        )
      ],
    );
  }
}
