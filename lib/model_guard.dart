class User {
  String userName;
  int score;
  String type;

  User({this.userName, this.score, this.type});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userName: json['username'] as String,
      score: json['score'] as int,
      type: json['guard_type'] as String,
    );
  }
}
