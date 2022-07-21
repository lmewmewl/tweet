const String tableTweets = 'tweets';

class TweetModelFileds {
  static const String id = 'id';
  static const String content = 'content';
  static const String reaction = 'reaction';
  static const String isReacted = 'isReacted';

  static const List<String> values = [id, content, reaction, isReacted];
}

class TweetModel {
  int? id;
  String content;
  String reaction;
  int isReacted;

  TweetModel({
    this.id,
    required this.content,
    required this.reaction,
    required this.isReacted,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'reaction': reaction,
      'isReacted': isReacted,
    };
  }
}
