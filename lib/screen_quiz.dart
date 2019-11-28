import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:my_guardian/model_quiz.dart';

class QuizScreen extends StatefulWidget {
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Quiz> quizs = [
    Quiz(
      title: '강아지를 자주 또는 오랫동안\n견사에서 기를 시,\n발달에 어떤 영향을 미칠 수 있는가?',
      cand1: '혼자 있는 법을 배울 수 있다.',
      cand2: '사회적으로 결핍되며 문제행동을 보인다.',
      cand3: '공격적이고 많이 짖게 된다.',
      cand4: '개에 따라 다르다.',
      answer: '사회적으로 결핍되며 문제행동을 보인다.',
    ),
    Quiz(
      title: '강아지를 자주 또는 오랫동안 견사에서 기를 시, 발달에 어떤 영향을 미칠 수 있는가?',
      cand1: '혼자 있는 법을 배울 수 있다.',
      cand2: '혼자 있는 법을 배울 수 있다.',
      cand3: '혼자 있는 법을 배울 수 있다.',
      cand4: '혼자 있는 법을 배울 수 있다.',
      answer: '혼자 있는 법을 배울 수 있다.',
    ),
    Quiz(
      title: '강아지를 자주 또는 오랫동안 견사에서 기를 시, 발달에 어떤 영향을 미칠 수 있는가?',
      cand1: '혼자 있는 법을 배울 수 있다.',
      cand2: '혼자 있는 법을 배울 수 있다.',
      cand3: '혼자 있는 법을 배울 수 있다.',
      cand4: '혼자 있는 법을 배울 수 있다.',
      answer: '혼자 있는 법을 배울 수 있다.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(40, 0, 0, 10),
              child: Row(
                children: <Widget>[
                  Icon(Icons.timer),
                  Text('0:30'),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.orange),
              ),
              width: 350,
              height: 500,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return _buildQuizCard(index, this.quizs[index]);
                },
                itemCount: 3,
                // pagination: new SwiperPagination(),
                control: new SwiperControl(
                  iconNext: null,
                  iconPrevious: null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildQuizCard(int index, Quiz quiz) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white),
          color: Colors.white),
      // color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(
              'Q' + (index + 1).toString() + '.',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 20),
            child: Text(
              quiz.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
          ),
          _buildCandidate(quiz.cand1),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
          ),
          _buildCandidate(quiz.cand2),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
          ),
          _buildCandidate(quiz.cand3),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
          ),
          _buildCandidate(quiz.cand4),
          Expanded(
            child: Container(),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 15),
            child: Center(
              child: ButtonTheme(
                minWidth: 200,
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: RaisedButton(
                  child: Text(
                    '다음문제',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.orange,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildCandidate(String cand) {
    return Container(
      width: 330,
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.orange),
      ),
      child: Text(
        cand,
        style: TextStyle(fontSize: 17),
      ),
    );
  }
}
