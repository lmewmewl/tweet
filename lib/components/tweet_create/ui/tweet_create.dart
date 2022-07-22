import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:tweet_sample/screens/main_screen/di/main_screen_vm.dart';

/// Tweet create widget
class TweetCreate extends StatefulWidget {
  final MainScreenVM mainScreenVM;

  const TweetCreate({
    Key? key,
    required this.mainScreenVM,
  }) : super(key: key);

  @override
  State<TweetCreate> createState() => _TweetCreateState();
}

class _TweetCreateState extends State<TweetCreate> {
  MainScreenVM get mainScreenVM => widget.mainScreenVM;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 15,
      ),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              minLines: 1,
              maxLines: 5,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.greenAccent),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.blue,
                  ),
                ),
                hintText: 'Enter a tweet',
              ),
              controller: mainScreenVM.tweetCreateController,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Observer(builder: (_) {
            return IconButton(
              onPressed: (mainScreenVM.tweetContent.isNotEmpty)
                  ? () => mainScreenVM.createTweet()
                  : null,
              icon: const Icon(
                Icons.subway,
                size: 30,
              ),
            );
          })
        ],
      ),
    );
  }
}
