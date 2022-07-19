// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_screen_vm.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainScreenVM on _MainScreenVM, Store {
  late final _$tweetCreateControllerAtom =
      Atom(name: '_MainScreenVM.tweetCreateController', context: context);

  @override
  TextEditingController get tweetCreateController {
    _$tweetCreateControllerAtom.reportRead();
    return super.tweetCreateController;
  }

  @override
  set tweetCreateController(TextEditingController value) {
    _$tweetCreateControllerAtom.reportWrite(value, super.tweetCreateController,
        () {
      super.tweetCreateController = value;
    });
  }

  late final _$tweetContentAtom =
      Atom(name: '_MainScreenVM.tweetContent', context: context);

  @override
  String get tweetContent {
    _$tweetContentAtom.reportRead();
    return super.tweetContent;
  }

  @override
  set tweetContent(String value) {
    _$tweetContentAtom.reportWrite(value, super.tweetContent, () {
      super.tweetContent = value;
    });
  }

  late final _$reactionsCountAtom =
      Atom(name: '_MainScreenVM.reactionsCount', context: context);

  @override
  int get reactionsCount {
    _$reactionsCountAtom.reportRead();
    return super.reactionsCount;
  }

  @override
  set reactionsCount(int value) {
    _$reactionsCountAtom.reportWrite(value, super.reactionsCount, () {
      super.reactionsCount = value;
    });
  }

  late final _$currrentStatusAtom =
      Atom(name: '_MainScreenVM.currrentStatus', context: context);

  @override
  AsyncStatus get currrentStatus {
    _$currrentStatusAtom.reportRead();
    return super.currrentStatus;
  }

  @override
  set currrentStatus(AsyncStatus value) {
    _$currrentStatusAtom.reportWrite(value, super.currrentStatus, () {
      super.currrentStatus = value;
    });
  }

  late final _$tweetListAtom =
      Atom(name: '_MainScreenVM.tweetList', context: context);

  @override
  List<TweetModel> get tweetList {
    _$tweetListAtom.reportRead();
    return super.tweetList;
  }

  @override
  set tweetList(List<TweetModel> value) {
    _$tweetListAtom.reportWrite(value, super.tweetList, () {
      super.tweetList = value;
    });
  }

  late final _$getTweetListAsyncAction =
      AsyncAction('_MainScreenVM.getTweetList', context: context);

  @override
  Future<void> getTweetList() {
    return _$getTweetListAsyncAction.run(() => super.getTweetList());
  }

  late final _$_MainScreenVMActionController =
      ActionController(name: '_MainScreenVM', context: context);

  @override
  void createTweet() {
    final _$actionInfo = _$_MainScreenVMActionController.startAction(
        name: '_MainScreenVM.createTweet');
    try {
      return super.createTweet();
    } finally {
      _$_MainScreenVMActionController.endAction(_$actionInfo);
    }
  }

  @override
  Widget mainTweetWidget(AsyncStatus status) {
    final _$actionInfo = _$_MainScreenVMActionController.startAction(
        name: '_MainScreenVM.mainTweetWidget');
    try {
      return super.mainTweetWidget(status);
    } finally {
      _$_MainScreenVMActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tweetCreateController: ${tweetCreateController},
tweetContent: ${tweetContent},
reactionsCount: ${reactionsCount},
currrentStatus: ${currrentStatus},
tweetList: ${tweetList}
    ''';
  }
}
