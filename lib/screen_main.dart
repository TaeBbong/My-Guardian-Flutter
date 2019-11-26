import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_guardian/widget_card.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          mockupSection,
          Container(
            padding: EdgeInsets.fromLTRB(20, 15, 20, 5),
            child: Text(
              '입양 후기',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  CardWidget(
                    imageName: 'images/dog1.png',
                    heading: '후기제목1',
                    subHeading: '내용1',
                    width: 200,
                  ),
                  CardWidget(
                    imageName: 'images/dog2.jpeg',
                    heading: '후기제목2',
                    subHeading: '내용2',
                    width: 200,
                  ),
                  CardWidget(
                    imageName: 'images/dog3.jpeg',
                    heading: '후기제목3',
                    subHeading: '내용3',
                    width: 200,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

Widget mockupSection = Container(
  child: CarouselSlider(
    viewportFraction: 1.0,
    aspectRatio: 2.0,
    autoPlay: true,
    enlargeCenterPage: false,
    height: 250,
    items: <String>['images/mockup.png', 'images/dog1.png'].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage(i), fit: BoxFit.cover)),
          );
        },
      );
    }).toList(),
  ),
);
