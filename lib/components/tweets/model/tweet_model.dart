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
}
