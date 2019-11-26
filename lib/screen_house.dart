import 'package:flutter/material.dart';
import 'package:my_guardian/form_dog.dart';
import 'package:my_guardian/widget_card.dart';

class HouseScreen extends StatefulWidget {
  _HouseScreenState createState() => _HouseScreenState();
}

class _HouseScreenState extends State<HouseScreen> {
  final TextEditingController _filter = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              '가정견 입양',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextField(
                  controller: _filter,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: '검색',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ))),
          Container(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Column(
              children: <Widget>[
                CardWidget(
                  heading: '보리',
                  subHeading: '견종: 믹스견',
                  imageName: 'images/logo.jpg',
                  width: 500,
                ),
                CardWidget(
                  heading: '보리',
                  subHeading: '견종: 믹스견',
                  imageName: 'images/logo.jpg',
                  width: 500,
                ),
                CardWidget(
                  heading: '보리',
                  subHeading: '견종: 믹스견',
                  imageName: 'images/logo.jpg',
                  width: 500,
                )
              ],
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: FloatingActionButton.extended(
                    onPressed: _addButtonClicked,
                    label: Text('등록'),
                    icon: Icon(Icons.add),
                    backgroundColor: Colors.orange,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _addButtonClicked() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DogForm('가정견')));
  }
}
