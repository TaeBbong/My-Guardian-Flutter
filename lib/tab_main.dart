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
                  heading: '집사할래 입양 최고!',
                  subHeading: '항상 걱정이었는데, 입양이 잘되어..',
                  width: 200,
                  height: 200,
                ),
                CardWidget(
                  imageName: 'images/dog2.jpeg',
                  heading: '견주분 완전 강잘알;',
                  subHeading: '강형욱이 오신 줄 알았습니다..',
                  width: 200,
                  height: 200,
                ),
                CardWidget(
                  imageName: 'images/dog3.jpeg',
                  heading: '강아지 너무 귀여워요!',
                  subHeading: '너무 귀여워서 어떡하면 좋죠ㅠㅠ..',
                  width: 200,
                  height: 200,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(),
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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HouseScreen(),
                            ),
                          );
                        },
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
                              builder: (context) => ShelterScreen(),
                            ),
                          );
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
          Expanded(
            child: Container(),
          ),
          // 퀴즈풀기 버튼
          // Center(
          //   child: InkWell(
          //     child: Container(
          //       padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
          //       width: 400,
          //       child: Card(
          //           color: Colors.orange,
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(20),
          //           ),
          //           margin: EdgeInsets.all(5),
          //           child: Center(
          //             child: Container(
          //               padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
          //               child: Text(
          //                 '퀴즈풀기',
          //                 style: TextStyle(
          //                     fontSize: 18,
          //                     // fontWeight: FontWeight.bold,
          //                     color: Colors.white),
          //               ),
          //             ),
          //           )),
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
    items: <String>[
      'images/n_mockup1.png',
      'images/n_mockup4.png',
      'images/n_mockup3.png',
      'images/n_mockup2.png',
    ].map((i) {
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
