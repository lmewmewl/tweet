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
  late String content;
  String? reaction;
  bool isReacted = false;

  TweetModel({
    this.id,
    required this.content,
    required this.reaction,
    required this.isReacted,
  });

  TweetModel.fromMap(Map<String, dynamic> json) {
    this.id = json['id'];
    this.content = json['content'];
    this.reaction = json['reaction'];
    this.isReacted == json['isReacted'];
  }

  Map<String, dynamic> toMap() {
    String _reacted = isReacted.toString();
    return {
      TweetModelFileds.id: id,
      TweetModelFileds.content: content,
      TweetModelFileds.reaction: reaction,
      TweetModelFileds.isReacted: _reacted,
    };
  }

  TweetModel copy({
    int? id,
    String? content,
    String? reaction,
    bool? isReacted,
  }) =>
      TweetModel(
        id: id ?? this.id,
        content: content ?? this.content,
        reaction: reaction ?? this.reaction,
        isReacted: isReacted ?? this.isReacted,
      );
}
