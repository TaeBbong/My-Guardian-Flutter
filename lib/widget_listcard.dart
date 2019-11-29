import 'package:flutter/material.dart';
import 'package:my_guardian/screen_detail.dart';

class ListCardWidget extends StatelessWidget {
  final String imageName;
  final String heading;
  final String subHeading;
  final double width;
  final double height;
  final int index;

  ListCardWidget(
      {this.imageName,
      this.heading,
      this.subHeading,
      this.width,
      this.index,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      width: this.width,
      // height: 500,
      // height: this.height,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        // margin: EdgeInsets.all(5),
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                this.imageName,
                width: 150,
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(1, 0, 1, 15),
                      child: Text(
                        ' ' + this.heading,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(1),
                      child: Text(
                        ' ' + this.subHeading.split('/')[0],
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(1),
                      child: Text(
                        this.subHeading.split('/')[1],
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(1),
                      child: Text(
                        this.subHeading.split('/')[2] + '살',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
