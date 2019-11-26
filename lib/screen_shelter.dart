import 'package:flutter/material.dart';
import 'package:my_guardian/form_dog.dart';
import 'package:my_guardian/screen_detail.dart';
import 'package:my_guardian/widget_card.dart';
import 'package:my_guardian/model_dog.dart';
import 'package:my_guardian/model_guard.dart';

class ShelterScreen extends StatefulWidget {
  _ShelterScreenState createState() => _ShelterScreenState();
}

class _ShelterScreenState extends State<ShelterScreen> {
  final TextEditingController _filter = new TextEditingController();
  List<Dog> dogs = [
    Dog(
      index: 0,
      name: '보보',
      type: '믹스견',
      sex: '여자',
      age: '1살',
      imageName: 'images/dog1.png',
      vac: '완료',
      mid: '완료',
      spec: '안녕하세요\n반갑습니다.\n우리 강아지 귀엽죠? 저도 알아요',
      guard: User(userName: 'Guinness', score: 90, type: '보호소'),
    ),
    Dog(
      index: 1,
      name: '휴지',
      type: '요크셔테리어',
      sex: '남자',
      age: '3살',
      imageName: 'images/dog2.jpeg',
      vac: '완료',
      mid: '완료',
      spec: '안녕하세요\n반갑습니다.\n우리 강아지 귀엽죠? 저도 알아요',
      guard: User(userName: 'Guinness', score: 90, type: '보호소'),
    ),
    Dog(
      index: 2,
      name: '사랑이',
      type: '치와와',
      sex: '여자',
      age: '2살',
      imageName: 'images/dog3.jpeg',
      vac: '완료',
      mid: '완료',
      spec: '안녕하세요\n반갑습니다.\n우리 강아지 귀엽죠? 저도 알아요',
      guard: User(userName: 'Guinness', score: 90, type: '보호소'),
    )
  ];
  String _searchText = "";

  _HouseScreenState() {
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text;
      });
    });
  }

  InkWell _buildCard(Dog dog) {
    return InkWell(
      child: CardWidget(
          heading: dog.name,
          subHeading:
              '견종: ' + dog.type + ' / 성별: ' + dog.sex + ' / 나이: ' + dog.age,
          imageName: dog.imageName,
          width: 500,
          index: dog.index),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(
                      dog: dog,
                    )));
      },
    );
  }

  List<Widget> _buildList() {
    List<Widget> result = [];
    if (_searchText.isEmpty || _searchText == "") {
      for (Dog dog in dogs) {
        result.add(_buildCard(dog));
      }
      return result;
    } else {
      for (Dog dog in dogs) {
        if ((dog.name + ' ' + dog.type).contains(_searchText)) {
          result.add(_buildCard(dog));
        }
      }
      return result;
    }
  }

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
              '유기견 입양',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
            child: TextField(
              style: TextStyle(fontSize: 15),
              controller: _filter,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.orange,
                  size: 20,
                ),
                hintText: '검색',
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            ),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate(_buildList()),
                )
              ],
            ),
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
        context, MaterialPageRoute(builder: (context) => DogForm('보호소 강아지')));
  }
}
