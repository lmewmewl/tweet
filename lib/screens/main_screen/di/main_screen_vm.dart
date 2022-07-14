import 'package:tweet_sample/components/tweets/model/tweet_model.dart';

class MainScreenVM {
  List<TweetModel> tweetList = [
    TweetModel(id: 1, content: '01 lorem ', isReacted: false, reaction: ''),
    TweetModel(id: 2, content: '02 lorem ', isReacted: false, reaction: ''),
    TweetModel(id: 3, content: '03 lorem ', isReacted: false, reaction: ''),
    TweetModel(id: 4, content: '04 lorem ', isReacted: false, reaction: ''),
  ];
}
