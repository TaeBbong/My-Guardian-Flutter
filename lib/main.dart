import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Container reviewCard(String imagename, String heading, String subHeading) {
    return Container(
      width: 200.0,
      child: Card(
        margin: EdgeInsets.all(5),
        child: Wrap(
          children: <Widget>[
            Image.asset(imagename),
            ListTile(
              title: Text(heading),
              subtitle: Text(subHeading), //카드 안 마진 크기 조절하기
            )
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter layout demo',
        home: Scaffold(
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
              )),
          body: Column(
            children: <Widget>[
              mockupSection,
              //여기 왼쪽정렬하기.
              Text('입양후기',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      reviewCard('images/dog.png', '후기제목1', '내용1'),
                      reviewCard('images/dog.png', '후기제목2', '내용2'),
                      reviewCard('images/dog.png', '후기제목3', '내용3'),
                    ],
                  ))
              //버튼하고 메뉴바 추가예정.
            ],
          ),
        ));
  }
}

Widget mockupSection = Container(
    height: 200,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Image.asset(
          'images/mockup1.png',
          width: 440,
          fit: BoxFit.cover,
        ),
        Image.asset(
          'images/mockup.png',
          width: 440,
          fit: BoxFit.cover,
        ),
      ],
    ));
