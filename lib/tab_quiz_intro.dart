import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_guardian/adapter_api.dart';
import 'package:my_guardian/model_quiz.dart';
import 'package:my_guardian/screen_quiz.dart';

class AnnounceQuizScreen extends StatefulWidget {
  _AnnounceQuizScreenState createState() => _AnnounceQuizScreenState();
}

class _AnnounceQuizScreenState extends State<AnnounceQuizScreen> {
  List<Quiz> quizs;
  bool isLoading = false;

  _fetchQuizs() async {
    setState(() {
      isLoading = true;
    });
    final response =
        await http.get("http://guinness.pythonanywhere.com/api/quiz/");
    if (response.statusCode == 200) {
      this.quizs = parseQuizs(utf8.decode(response.bodyBytes));
      setState(() {
        isLoading = false;
        print('Done!!');
        print(this.quizs[0].title);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizScreen(
              quizs: quizs.sublist(0, 10),
            ),
          ),
        );
      });
    } else {
      throw Exception('Failed to load photos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 150,
            child: Image.asset(
              'images/logo_noback.png',
            ),
          ),
          Container(
            child: Text(
              '안내',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: 55,
            height: 5,
            color: Colors.orange[200],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
          ),
          Container(
            child: Text(
              '퀴즈를 풀기 전 안내사항입니다.\n꼼꼼히 읽으신 뒤 퀴즈 풀기를 눌러주세요.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
          ),
          _buildStep(
            1,
            '문제를 잘 읽고 제한 시간 내에 정답을 고른 뒤\n다음문제 버튼을 눌러주세요.',
          ),
          _buildStep(
            2,
            '입양신청과 게시글 작성이 가능한\n최소점수는 80점 입니다.',
          ),
          _buildStep(
            3,
            '결과는 점수로 환산되어 프로필에 저장됩니다.',
          ),
          _buildStep(
            4,
            '결과가 마음에 안들 시 재응시가 가능하며\n높은 점수일 수록 입양신청에 있어 유리할 수 있습니다.',
          ),
          Padding(
            padding: EdgeInsets.all(15),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 15),
            child: Center(
              child: ButtonTheme(
                minWidth: 200,
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: RaisedButton(
                  child: Text(
                    '퀴즈풀기',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.orange,
                  onPressed: _fetchQuizs,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildStep(int index, String text) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            'images/foot.jpeg',
            width: 25,
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
          ),
          Text(
            index.toString() + '. ' + text,
          ),
        ],
      ),
    );
  }
}
