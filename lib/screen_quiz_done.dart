import 'package:flutter/material.dart';
import 'package:my_guardian/model_quiz.dart';

class QuizResultScreen extends StatelessWidget {
  final Map<int, dynamic> answers;
  final List<Quiz> quizs;
  QuizResultScreen({this.quizs, this.answers});
  @override
  Widget build(BuildContext context) {
    int score = 0;
    for (int i = 0; i < this.quizs.length; i++) {
      if (this.quizs[i].answer == this.answers[i]) {
        score += 10;
      }
    }
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.access_alarm,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
        elevation: 0.0,
        backgroundColor: Color(0xFFffffff),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/logo.png',
              fit: BoxFit.contain,
              height: 30,
            ),
            Container(
                padding: const EdgeInsets.only(right: 1),
                child:
                    Text('My-Guardian', style: TextStyle(color: Colors.black)))
          ],
        ),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.orange),
              color: Colors.orange,
            ),
            width: 350,
            height: 500,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.orange),
                    color: Colors.white,
                  ),
                  width: 300,
                  height: 200,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
                        child: Text(
                          '수고하셨습니다!',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          '당신의 점수는',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Container(
                        child: Text(
                          score.toString(),
                          style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    '입양신청과 입양게시글 작성은 80점부터 가능합니다.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.orange),
                    color: Colors.white,
                  ),
                  width: 300,
                  height: 70,
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '다시하기',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
