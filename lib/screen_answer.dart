import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:my_guardian/model_quiz.dart';
import 'package:my_guardian/screen_quiz_done.dart';

class AnswerScreen extends StatefulWidget {
  final List<Quiz> quizs;
  AnswerScreen({Key key, this.quizs}) : super(key: key);
  _AnswerScreenState createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  final Map<int, dynamic> _answers = {};
  int _currentIndex = 0;
  SwiperController controller = SwiperController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.orange),
              ),
              width: 350,
              height: 500,
              child: Swiper(
                // physics: NeverScrollableScrollPhysics(),
                loop: false,
                itemBuilder: (BuildContext context, int index) {
                  return _buildQuizCard(index, widget.quizs[index]);
                },
                itemCount: widget.quizs.length,
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildQuizCard(int index, Quiz quiz) {
    String title_beauty = "";
    String temp_title = quiz.title;
    int len = temp_title.split(' ').length;
    print(len);
    print(len ~/ 5);
    if (len <= 5) {
      title_beauty = quiz.title;
    } else {
      for (int i = 0; i < (len ~/ 5); i++) {
        List<String> partial = temp_title.split(' ').sublist(i * 5, i * 5 + 5);
        for (var p in partial) {
          title_beauty += p + ' ';
        }
        title_beauty += '\n';
      }
      List<String> last = temp_title.split(' ').sublist(len ~/ 5 * 5, len);
      for (var p in last) {
        title_beauty += p + ' ';
      }
    }
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white),
          color: Colors.white),
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
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Text(
              title_beauty,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.only(bottom: 10),
          // ),
          Expanded(
            child: Container(),
          ),
          CandiWidget(
            defaultColor: Colors.white,
            selectedColor: Colors.orange,
            text: quiz.cand1,
            index: 1,
            answer: quiz.answer == 1 ? true : false,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
          ),
          CandiWidget(
            defaultColor: Colors.white,
            selectedColor: Colors.orange,
            text: quiz.cand2,
            index: 2,
            answer: quiz.answer == 2 ? true : false,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
          ),
          CandiWidget(
            defaultColor: Colors.white,
            selectedColor: Colors.orange,
            text: quiz.cand3,
            index: 3,
            answer: quiz.answer == 3 ? true : false,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
          ),
          CandiWidget(
            defaultColor: Colors.white,
            selectedColor: Colors.orange,
            text: quiz.cand4,
            index: 4,
            answer: quiz.answer == 4 ? true : false,
          ),
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
                  child: this._currentIndex == widget.quizs.length - 1
                      ? Text(
                          '돌아가기',
                          style: TextStyle(color: Colors.white),
                        )
                      : Text(
                          '다음문제',
                          style: TextStyle(color: Colors.white),
                        ),
                  color: Colors.orange,
                  onPressed: () {
                    if (this._currentIndex == widget.quizs.length - 1) {
                      this.dispose();
                      Navigator.pop(context);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => QuizResultScreen(
                      //         quizs: widget.quizs, answers: this._answers),
                      //   ),
                      // );
                    } else {
                      controller.next(animation: true);
                      this._currentIndex += 1;
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CandiWidget extends StatefulWidget {
  VoidCallback tap;
  Color defaultColor;
  Color selectedColor;
  String text;
  int index;
  bool answer;

  CandiWidget(
      {this.tap,
      this.defaultColor,
      this.selectedColor,
      this.text,
      this.index,
      this.answer});

  _CandiWidgetState createState() => _CandiWidgetState();
}

class _CandiWidgetState extends State<CandiWidget> {
  // bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.orange),
        color: widget.answer ? widget.selectedColor : widget.defaultColor,
      ),
      child: InkWell(
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 14,
            color: widget.answer ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
