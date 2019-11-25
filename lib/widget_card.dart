import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String imageName;
  final String heading;
  final String subHeading;

  CardWidget({this.imageName, this.heading, this.subHeading});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      child: Card(
        margin: EdgeInsets.all(5),
        child: Wrap(
          children: <Widget>[
            Image.asset(this.imageName),
            ListTile(
              title: Text(this.heading),
              subtitle: Text(this.subHeading), //카드 안 마진 크기 조절하기
            )
          ],
        ),
      ),
    );
  }
}
