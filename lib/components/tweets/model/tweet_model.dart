const String tableTweets = 'tweets';

class TweetModelFileds {
  static const String id = 'id';
  static const String content = 'content';
  static const String reaction = 'reaction';
  static const String isReacted = 'isReacted';

  static const List<String> values = [id, content, reaction, isReacted];
}

class TweetModel {
  late int id;
  late String content;
  String? reaction;
  bool isReacted = false;

  TweetModel({
    required this.id,
    required this.content,
    required this.reaction,
    required this.isReacted,
  });

  TweetModel.fromMap(Map<String, dynamic> json) {
    this.id = json['id'];
    this.content = json['content'];
    this.reaction = json['reaction'];
    this.isReacted = json['isReacted'];
  }

  Map<String, dynamic> toMap() {
    return {
      TweetModelFileds.id: id,
      TweetModelFileds.content: content,
      TweetModelFileds.reaction: reaction,
      TweetModelFileds.isReacted: isReacted,
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
