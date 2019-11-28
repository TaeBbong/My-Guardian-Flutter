import 'package:flutter/material.dart';
import 'package:my_guardian/form_adopt.dart';
import 'package:my_guardian/model_dog.dart';

class DetailScreen extends StatelessWidget {
  final Dog dog;
  DetailScreen({this.dog});

  @override
  Widget build(BuildContext context) {
    print('detail screen');
    print(this.dog.name);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.access_alarm,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
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
                child:
                    Text('My-Guardian', style: TextStyle(color: Colors.black)))
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Align(
                  child: Container(
                    width: double.infinity,
                    color: Colors.grey[350],
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 15,
                            child: CircleAvatar(
                              child: Text(
                                '!',
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                              backgroundColor: Colors.red,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              'Notice',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              '퀴즈를 통과해야 입양 신청이 가능합니다.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Container(
                            child: Icon(
                              Icons.close,
                              color: Colors.black54,
                              size: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                // 이미지
                Align(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                    child: Image.asset(
                      dog.imageName,
                      width: 300,
                    ),
                  ),
                ),
                // 이름
                Align(
                  child: Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: <Widget>[
                          Text(
                            dog.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Container(
                            width: dog.name.length.toDouble() * 24,
                            height: 5,
                            color: Colors.orange[200],
                          ),
                        ],
                      )),
                ),
                // 강아지 정보
                Align(
                  child: Container(
                      width: 300,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.orange,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(bottom: 4),
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    'images/foot.jpeg',
                                    width: 25,
                                  ),
                                  Text(
                                    '견종',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(' - ' + dog.type),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 4),
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    'images/foot.jpeg',
                                    width: 25,
                                  ),
                                  Text(
                                    '성별',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(' - ' + dog.sex),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 4),
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    'images/foot.jpeg',
                                    width: 25,
                                  ),
                                  Text(
                                    '나이',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(' - ' + dog.age),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 4),
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    'images/foot.jpeg',
                                    width: 25,
                                  ),
                                  Text(
                                    '접종여부',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(' - ' + dog.vac),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 4),
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    'images/foot.jpeg',
                                    width: 25,
                                  ),
                                  Text(
                                    '중성화수술',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(' - ' + dog.mid),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 4),
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    'images/foot.jpeg',
                                    width: 25,
                                  ),
                                  Text(
                                    '특이사항',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 20),
                                child: Row(
                                  children: <Widget>[
                                    Text(dog.spec),
                                  ],
                                ))
                          ],
                        ),
                      )),
                ),
                // 텍스트
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Column(
                    children: <Widget>[
                      Align(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                          child: Text(
                            dog.guard.type + '정보',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ),
                      Container(
                        width: (dog.guard.type.length + 2).toDouble() * 22,
                        height: 5,
                        color: Colors.orange[200],
                      ),
                    ],
                  ),
                ),
                // 견주 정보
                Align(
                  child: Container(
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      border: Border.all(
                        color: Colors.orange,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                        ),
                        CircleAvatar(
                          child: Icon(
                            Icons.person,
                            color: Colors.orange,
                          ),
                          backgroundColor: Colors.white,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 7),
                        ),
                        Text(
                          dog.guard.userName,
                          style: TextStyle(color: Colors.white),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 7),
                        ),
                        Text(
                          dog.guard.score.toString() + '점',
                          style: TextStyle(color: Colors.white),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          '          입양신청          ',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AdoptForm(dog)));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
