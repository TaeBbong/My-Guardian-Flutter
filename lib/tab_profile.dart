import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Container(
      child: Center(
        child: new Column(
          children: <Widget>[
            new SizedBox(
              height: _height / 12,
            ),
            new CircleAvatar(
              radius: _width < _height ? _width / 4 : _height / 4,
              backgroundImage: AssetImage('images/guinness.jpeg'),
            ),
            new SizedBox(
              height: _height / 25.0,
            ),
            new Text(
              'Guinness',
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: _width / 15,
                  color: Colors.black),
            ),
            Container(
              width: 140,
              height: 5,
              color: Colors.orange[200],
            ),
            new Padding(
              padding: new EdgeInsets.only(
                  top: _height / 30, left: _width / 8, right: _width / 8),
              child: new Text(
                '강아지를 너무 좋아해서 앱을 만든 기네스입니다!\n장고와 쫄랑이를 좋아해요:)',
                style: new TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: _width / 25,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            new Divider(
              height: _height / 30,
              color: Colors.orange,
            ),
            new Row(
              children: <Widget>[
                rowCell('5건', '입양견 등록'),
                rowCell('3건', '보호소 입양'),
                rowCell('90점', '퀴즈 성적'),
              ],
            ),
            new Divider(height: _height / 30, color: Colors.orange),
            new Padding(
              padding: new EdgeInsets.only(left: _width / 8, right: _width / 8),
              child: new FlatButton(
                onPressed: () {},
                child: new Container(
                    child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    new SizedBox(
                      width: _width / 30,
                    ),
                    new Text(
                      '프로필 수정하기',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )),
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rowCell(String title, String type) => new Expanded(
        child: new Column(
          children: <Widget>[
            new Text(
              title,
              style: new TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            new Text(type,
                style: new TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ))
          ],
        ),
      );
}
