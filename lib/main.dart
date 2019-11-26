import 'package:flutter/material.dart';
import 'package:my_guardian/screen_house.dart';
import 'package:my_guardian/screen_main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter layout demo',
        home: DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
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
                      child: Text('My-Guardian',
                          style: TextStyle(color: Colors.black)))
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                MainScreen(),
                HouseScreen(),
                Container(),
                Container(),
                Container()
              ],
            ),
            bottomNavigationBar: TabBar(
              labelColor: Colors.yellow,
              unselectedLabelColor: Colors.black,
              tabs: <Widget>[
                Tab(
                  icon: Icon(
                    Icons.home,
                  ),
                  text: 'home',
                ),
                Tab(
                  icon: Icon(
                    Icons.home,
                  ),
                  text: 'home',
                ),
                Tab(
                  icon: Icon(
                    Icons.home,
                  ),
                  text: 'home',
                ),
                Tab(
                  icon: Icon(
                    Icons.home,
                  ),
                  text: 'home',
                ),
                Tab(
                  icon: Icon(
                    Icons.home,
                  ),
                  text: 'home',
                ),
              ],
            ),
          ),
        ));
  }
}
