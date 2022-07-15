import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'tweet_create_vm.g.dart';

class TweetCreateVM = _TweetCreateVM with _$TweetCreateVM;

abstract class _TweetCreateVM with Store {
  TextEditingController contentController = TextEditingController();
}
