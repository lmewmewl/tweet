import 'package:flutter/material.dart';
import 'package:tweet_sample/components/tweet_reactions/ui/tweet_reaction.dart';
import 'package:tweet_sample/components/tweets/di/tweet_vm.dart';
import 'package:tweet_sample/components/tweets/ui/tweet.dart';
import 'package:tweet_sample/screens/main_screen/di/main_screen_vm.dart';

class MainScreen extends StatefulWidget {
  final MainScreenVM mainVM;
  const MainScreen({Key? key, required this.mainVM}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainScreenVM get mainVM => widget.mainVM;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tweets'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        itemCount: mainVM.tweetList.length,
        itemBuilder: (context, index) => TweetWidget(
          id: mainVM.tweetList[index].id,
          content: mainVM.tweetList[index].content,
          reaction: mainVM.tweetList[index].reaction,
          isReacted: mainVM.tweetList[index].isReacted,
          tweetReactions: TweetReaction(),
          tweetVM: TweetVM(),
        ),
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: 10,
        ),
      ),
    );
  }
}
