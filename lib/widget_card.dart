import 'package:flutter/material.dart';
import 'package:my_guardian/screen_detail.dart';

class CardWidget extends StatelessWidget {
  final String imageName;
  final String heading;
  final String subHeading;
  final double width;
  final double height;
  final int index;

  CardWidget(
      {this.imageName,
      this.heading,
      this.subHeading,
      this.width,
      this.index,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      // height: 500,
      // height: this.height,
      child: Card(
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              this.imageName,
              height: 100,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(1, 1.5, 1, 1),
              child: Text(
                this.heading,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.all(1),
              child: Text(
                this.subHeading,
                style: TextStyle(fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
