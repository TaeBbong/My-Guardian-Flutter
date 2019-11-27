import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_guardian/screen_house.dart';
import 'package:my_guardian/screen_shelter.dart';
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
            padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
            child: Text(
              '입양 후기',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.0),
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                CardWidget(
                  imageName: 'images/dog1.png',
                  heading: '후기제목1',
                  subHeading: '내용1',
                  width: 200,
                  height: 200,
                ),
                CardWidget(
                  imageName: 'images/dog2.jpeg',
                  heading: '후기제목2',
                  subHeading: '내용2',
                  width: 200,
                  height: 200,
                ),
                CardWidget(
                  imageName: 'images/dog3.jpeg',
                  heading: '후기제목3',
                  subHeading: '내용3',
                  width: 200,
                  height: 200,
                ),
              ],
            ),
          ),
          // 가정입양/보호소입양 버튼
          Center(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: 400,
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                          child: Text(
                            '가정입양',
                            style: TextStyle(
                                fontSize: 18,
                                // fontWeight: FontWeight.bold,
                                color: Colors.orange),
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 30,
                        color: Colors.grey,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShelterScreen()));
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                          child: Text(
                            '보호소입양',
                            style: TextStyle(
                                fontSize: 18,
                                // fontWeight: FontWeight.bold,
                                color: Colors.orange),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          // 퀴즈풀기 버튼
          Center(
            child: InkWell(
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                width: 400,
                child: Card(
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.all(5),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                        child: Text(
                          '퀴즈풀기',
                          style: TextStyle(
                              fontSize: 18,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    )),
              ),
            ),
          ),
          // Center(
          //   child: Container(
          //     width: 350,
          //     height: 50,
          //     padding: EdgeInsets.all(0),
          //     decoration: BoxDecoration(boxShadow: [
          //       BoxShadow(
          //           color: Colors.grey,
          //           blurRadius: 20,
          //           spreadRadius: 5,
          //           offset: Offset(10, 10))
          //     ]),
          //     child: Container(
          //       padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
          //       decoration: BoxDecoration(
          //           color: Colors.orange,
          //           borderRadius: BorderRadius.circular(30),
          //           border: Border.all(color: Colors.orange)),
          //       child: InkWell(
          //         // onTap: _addButtonClicked,
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: <Widget>[
          //             Text(
          //               '퀴즈풀기',
          //               style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 20,
          //               ),
          //             )
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: EdgeInsets.only(top: 10),
          // ),
          // Center(
          //   child: Container(
          //     width: 350,
          //     height: 50,
          //     padding: EdgeInsets.all(0),
          //     child: Container(
          //       padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
          //       decoration: BoxDecoration(
          //           color: Colors.orange,
          //           borderRadius: BorderRadius.circular(30),
          //           border: Border.all(color: Colors.orange)),
          //       child: InkWell(
          //         // onTap: _addButtonClicked,
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: <Widget>[
          //             Text(
          //               '퀴즈풀기',
          //               style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 20,
          //               ),
          //             )
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
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
