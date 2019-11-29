class Quiz {
  String title;
  String cand1;
  String cand2;
  String cand3;
  String cand4;
  int answer;

  Quiz({
    this.title,
    this.cand1,
    this.cand2,
    this.cand3,
    this.cand4,
    this.answer,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    String body = json['body'] as String;
    return Quiz(
      title: json['title'] as String,
      cand1: body.split('/')[0],
      cand2: body.split('/')[1],
      cand3: body.split('/')[2],
      cand4: body.split('/')[3],
      answer: json['answer'] as int,
    );
  }
}
