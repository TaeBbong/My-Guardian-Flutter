import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:my_guardian/adapter_api.dart';
import 'package:my_guardian/model_dog.dart';
import 'package:my_guardian/model_guard.dart';
import 'package:my_guardian/screen_house.dart';
import 'package:my_guardian/tab_main.dart';
import 'package:my_guardian/tab_profile.dart';
import 'package:my_guardian/tab_quiz_intro.dart';
import 'package:my_guardian/screen_shelter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Dog> dogs;
  List<User> users;
  bool isLoadingUser = false;
  bool isLoadingDog = false;

  _fetchDatas() async {
    setState(() {
      isLoadingUser = true;
      isLoadingDog = true;
    });

    final responseUser =
        await http.get("http://guinness.pythonanywhere.com/api/guard/");
    if (responseUser.statusCode == 200) {
      this.users = parseUsers(utf8.decode(responseUser.bodyBytes));
      setState(() {
        isLoadingUser = false;
        print('Done!!');
        print(this.users[0].userName);
      });
    } else {
      throw Exception('Failed to load users');
    }

    final responseDog =
        await http.get("http://guinness.pythonanywhere.com/api/dog/");
    if (responseDog.statusCode == 200) {
      this.dogs = parseDogs(utf8.decode(responseDog.bodyBytes));
      setState(() {
        isLoadingDog = false;
        print('Done!!');
        print(this.dogs[0].name);
      });
    } else {
      throw Exception('Failed to load dogs');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchDatas().then((result) {
      print('got data~~');
    });
  }

  @override
  Widget build(BuildContext context) {
    // _fetchDatas().then((result) {
    //   print('got data~~');
    // });
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
                MainScreen(dogs: dogs, users: users),
                AnnounceQuizScreen(), // QuizPage
                ProfileScreen(), // MyPage
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
