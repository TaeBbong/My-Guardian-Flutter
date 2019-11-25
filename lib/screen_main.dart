import 'package:flutter/material.dart';
import './widget_card.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Container(
            child: Text('입양후기',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  CardWidget(
                      imageName: 'images/dog.png',
                      heading: '후기제목1',
                      subHeading: '내용1'),
                  CardWidget(
                      imageName: 'images/dog.png',
                      heading: '후기제목2',
                      subHeading: '내용2'),
                  CardWidget(
                      imageName: 'images/dog.png',
                      heading: '후기제목3',
                      subHeading: '내용3'),
                ],
              ))
          //버튼하고 메뉴바 추가예정.
        ],
      ),
    );
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
