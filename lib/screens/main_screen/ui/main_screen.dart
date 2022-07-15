import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
    mainVM.getTweetList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tweets'),
      ),
      body: Observer(
        builder: (_) {
          return mainVM.mainTweetWidget(mainVM.currrentStatus);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('Bump'),
        child: const Icon(
          Icons.sailing,
          size: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}
