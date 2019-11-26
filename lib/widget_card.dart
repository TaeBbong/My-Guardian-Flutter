import 'package:flutter/material.dart';
import 'package:my_guardian/screen_detail.dart';

class CardWidget extends StatelessWidget {
  final String imageName;
  final String heading;
  final String subHeading;
  final double width;
  final int index;

  CardWidget(
      {this.imageName, this.heading, this.subHeading, this.width, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
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
