import 'package:flutter/material.dart';
import 'package:my_guardian/form_dog.dart';
import 'package:my_guardian/model_guard.dart';
import 'package:my_guardian/screen_detail.dart';
import 'package:my_guardian/widget_card.dart';
import 'package:my_guardian/model_dog.dart';
import 'package:my_guardian/widget_listcard.dart';

class HouseScreen extends StatefulWidget {
  List<Dog> dogs;
  List<User> users;
  HouseScreen({this.dogs, this.users});
  _HouseScreenState createState() => _HouseScreenState();
}

class _HouseScreenState extends State<HouseScreen> {
  final TextEditingController _filter = new TextEditingController();

  List<Dog> filtered_dogs = [];
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
      child: ListCardWidget(
        heading: dog.name,
        subHeading:
            '견종: ' + dog.type + ' / 성별: ' + dog.sex + ' / 나이: ' + dog.age,
        imageName: dog.imageName,
        width: 500,
        index: dog.index,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              dog: dog,
              users: widget.users,
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildList() {
    List<Widget> result = [];
    if (_searchText.isEmpty || _searchText == "") {
      for (Dog dog in this.filtered_dogs) {
        result.add(_buildCard(dog));
      }
      return result;
    } else {
      for (Dog dog in this.filtered_dogs) {
        if ((dog.name + ' ' + dog.type).contains(_searchText)) {
          result.add(_buildCard(dog));
        }
      }
      return result;
    }
  }

  @override
  void initState() {
    print(widget.dogs.length);
    for (Dog dog in widget.dogs) {
      User temp_user = widget.users[dog.guard - 1];
      // for (User user in widget.users) {
      //   if (user.userName == dog.guard) {
      //     temp_user = user;
      //     break;
      //   }
      // }
      if (temp_user.type == "person") {
        this.filtered_dogs.add(dog);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              'images/logo_noback.png',
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
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    '가정견 입양',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.orange)),
                    child: InkWell(
                      onTap: _addButtonClicked,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 3),
                          ),
                          Text(
                            '등록',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
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
            // Container(
            //   color: Colors.transparent,
            //   padding: EdgeInsets.all(8),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: <Widget>[
            //       Container(
            //         color: Colors.transparent,
            //         child: FloatingActionButton.extended(
            //           onPressed: _addButtonClicked,
            //           label: Text('등록'),
            //           icon: Icon(Icons.add),
            //           backgroundColor: Colors.orange,
            //         ),
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  void _addButtonClicked() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DogForm('가정견')));
  }
}
