import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tweet_sample/components/tweet_create/ui/tweet_create.dart';
import 'package:tweet_sample/components/tweets/di/tweets_count.dart';

import 'package:tweet_sample/screens/main_screen/di/main_screen_vm.dart';

class MainScreen extends StatefulWidget {
  final MainScreenVM mainVM;
  const MainScreen({
    Key? key,
    required this.mainVM,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainScreenVM get mainVM => widget.mainVM;

  @override
  void initState() {
    super.initState();
    mainVM.getTweetList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tweets'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Observer(builder: (_) {
              return Text(
                  'Reactions count: ${tweetsCountInstance.reactionsCount}');
            }),
          ),
          Observer(
            builder: (__) {
              return Expanded(
                child: mainVM.mainTweetWidget(mainVM.currrentStatus),
              );
            },
          ),
          TweetCreate(
            mainScreenVM: mainVM,
          )
        ],
      ),
    );
  }
}
