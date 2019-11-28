import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:my_guardian/screen_house.dart';
import 'package:my_guardian/tab_main.dart';
import 'package:my_guardian/tab_quiz_intro.dart';
import 'package:my_guardian/screen_shelter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.orange);
    return MaterialApp(
        title: 'Flutter layout demo',
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'images/logo_noback.png',
                    fit: BoxFit.contain,
                    height: 30,
                  ),
                  Container(
                      padding: const EdgeInsets.only(right: 1),
                      child: Text('My-Guardian',
                          style: TextStyle(color: Colors.black)))
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                MainScreen(),
                AnnounceQuizScreen(), // QuizPage
                AnnounceQuizScreen(), // MyPage
              ],
            ),
            bottomNavigationBar: SizedBox(
              height: 60,
              child: TabBar(
                labelColor: Colors.orange,
                unselectedLabelColor: Colors.black54,
                indicatorColor: Colors.orange,
                tabs: <Widget>[
                  Tab(
                    icon: Icon(
                      Icons.home,
                    ),
                    text: 'home',
                  ),
                  Tab(
                    icon: Icon(
                      Icons.help,
                    ),
                    text: 'quiz',
                  ),
                  Tab(
                    icon: Icon(
                      Icons.person,
                    ),
                    text: 'my page',
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
