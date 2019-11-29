import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:my_guardian/model_quiz.dart';
import 'package:my_guardian/screen_quiz_done.dart';

class QuizScreen extends StatefulWidget {
  final List<Quiz> quizs;
  QuizScreen({Key key, this.quizs}) : super(key: key);
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final Map<int, dynamic> _answers = {};
  int _currentIndex = 0;
  int _timer = 30;
  String _showTimer = '30';
  SwiperController controller = SwiperController();

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (_timer < 1) {
          // t.cancel();
          _timer = 30;
          if (this._currentIndex == widget.quizs.length - 1) {
            t.cancel();
          } else {
            this._currentIndex += 1;
            controller.next(animation: true);
          }
        } else {
          _timer = _timer - 1;
          _showTimer = _timer.toString();
        }
      });
    });
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
              padding: EdgeInsets.fromLTRB(40, 0, 40, 10),
              child: Row(
                children: <Widget>[
                  Icon(Icons.timer),
                  Text('0:' + _showTimer),
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.exit_to_app),
                          Text('홈으로'),
                        ],
                      ),
                    ),
                  )
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
                physics: NeverScrollableScrollPhysics(),
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
            tap: () {
              this._answers[_currentIndex] = 1;
            },
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
          ),
          CandiWidget(
            defaultColor: Colors.white,
            selectedColor: Colors.orange,
            text: quiz.cand2,
            index: 2,
            tap: () {
              this._answers[_currentIndex] = 2;
            },
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
          ),
          CandiWidget(
            defaultColor: Colors.white,
            selectedColor: Colors.orange,
            text: quiz.cand3,
            index: 3,
            tap: () {
              this._answers[_currentIndex] = 3;
            },
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
          ),
          CandiWidget(
            defaultColor: Colors.white,
            selectedColor: Colors.orange,
            text: quiz.cand4,
            index: 4,
            tap: () {
              this._answers[_currentIndex] = 4;
            },
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
                          '결과보기',
                          style: TextStyle(color: Colors.white),
                        )
                      : Text(
                          '다음문제',
                          style: TextStyle(color: Colors.white),
                        ),
                  color: Colors.orange,
                  onPressed: () {
                    _timer = 30;
                    if (this._currentIndex == widget.quizs.length - 1) {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizResultScreen(
                              quizs: widget.quizs, answers: this._answers),
                        ),
                      );
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

  CandiWidget(
      {this.tap, this.defaultColor, this.selectedColor, this.text, this.index});

  _CandiWidgetState createState() => _CandiWidgetState();
}

class _CandiWidgetState extends State<CandiWidget> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.orange),
        color: _pressed ? widget.selectedColor : widget.defaultColor,
      ),
      child: InkWell(
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 14,
            color: _pressed ? Colors.white : Colors.black,
          ),
        ),
        onTap: () => setState(
          () {
            widget.tap();
            this.setState(() {
              _pressed = !_pressed;
            });
          },
        ),
      ),
    );
  }
}
