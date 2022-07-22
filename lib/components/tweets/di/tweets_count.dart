import 'package:mobx/mobx.dart';
part 'tweets_count.g.dart';

/// Tweets count instance
TweetsCount tweetsCountInstance = TweetsCount();

/// Tweets count
class TweetsCount = _TweetsCount with _$TweetsCount;

abstract class _TweetsCount with Store {
  @observable
  int reactionsCount = 0;
}
