import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DogForm extends StatefulWidget {
  final String dogType;
  const DogForm(this.dogType);

  @override
  _DogFormState createState() => _DogFormState();
}

class _DogFormState extends State<DogForm> {
  bool sex_man = true, sex_woman = false;
  bool vac_done = true, vac_not = false;
  bool mid_done = true, mid_not = false;
  bool type_small = true, type_medium = false, type_large = false;
  bool agree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
          onTap: _goBack,
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
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Text(
                widget.dogType + ' 등록하기',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            // 이름 필드
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                    child: Text(
                      '이름',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: TextField(
                        decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    )),
                  )
                ],
              ),
            ),
            // 견종 필드
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                    child: Text(
                      '견종',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: TextField(
                        decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    )),
                  )
                ],
              ),
            ),
            // 나이 필드
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                    child: Text(
                      '나이',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: TextField(
                        decoration: InputDecoration(
                      hintText: '숫자만 기재해주세요.',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    )),
                  )
                ],
              ),
            ),
            // 성별 필드
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                    child: Text(
                      '성별',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        activeColor: Colors.orange,
                        value: sex_man,
                        onChanged: (bool value) {
                          setState(() {
                            sex_man = value;
                            sex_woman = value & false;
                          });
                        },
                      ),
                      Text('남자')
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        activeColor: Colors.orange,
                        value: sex_woman,
                        onChanged: (bool value) {
                          setState(() {
                            sex_woman = value;
                            sex_man = value & false;
                          });
                        },
                      ),
                      Text('여자')
                    ],
                  )
                ],
              ),
            ),
            // 접종여부 필드
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                    child: Text(
                      '접종여부',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        activeColor: Colors.orange,
                        value: vac_done,
                        onChanged: (bool value) {
                          setState(() {
                            vac_done = value;
                            vac_not = value & false;
                          });
                        },
                      ),
                      Text('완료')
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        activeColor: Colors.orange,
                        value: vac_not,
                        onChanged: (bool value) {
                          setState(() {
                            vac_not = value;
                            vac_done = value & false;
                          });
                        },
                      ),
                      Text('미완료')
                    ],
                  )
                ],
              ),
            ),
            // 중성화유무 필드
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                    child: Text(
                      '중성화여부',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        activeColor: Colors.orange,
                        value: mid_done,
                        onChanged: (bool value) {
                          setState(() {
                            mid_done = value;
                            mid_not = value & false;
                          });
                        },
                      ),
                      Text('완료')
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        activeColor: Colors.orange,
                        value: mid_not,
                        onChanged: (bool value) {
                          setState(() {
                            mid_not = value;
                            mid_done = value & false;
                          });
                        },
                      ),
                      Text('미완료')
                    ],
                  )
                ],
              ),
            ),
            // 분류 필드
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                    child: Text(
                      '분류',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        activeColor: Colors.orange,
                        value: type_small,
                        onChanged: (bool value) {
                          setState(() {
                            type_small = value;
                            type_medium = value & false;
                            type_large = value & false;
                          });
                        },
                      ),
                      Text('소형')
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        activeColor: Colors.orange,
                        value: type_medium,
                        onChanged: (bool value) {
                          setState(() {
                            type_small = value & false;
                            type_medium = value;
                            type_large = value & false;
                          });
                        },
                      ),
                      Text('중형')
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        activeColor: Colors.orange,
                        value: type_large,
                        onChanged: (bool value) {
                          setState(() {
                            type_small = value & false;
                            type_medium = value & false;
                            type_large = value;
                          });
                        },
                      ),
                      Text('대형')
                    ],
                  )
                ],
              ),
            ),
            // 특이사항 필드
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                    child: Text(
                      '특이사항',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: TextField(
                        maxLines: 8,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        )),
                  )
                ],
              ),
            ),
            // 이용약관 필드
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                    child: Text(
                      '이용약관',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: TextField(
                        enabled: false,
                        maxLines: 30,
                        decoration: InputDecoration(
                          hintText:
                              '집사할래는 개인정보취급방침을 통하여 담당자가 제공하는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치를 취해지고 있는지 알려드립니다. \n\n1. 수집하는 개인정보의 활용정보 및 항목\n집사할래에서는  아래의 개인정보를 수집하여 입양서비스제공과 입양 후 사후관리(보증금지급, 게약이행여부 확인 등)에 활용할 계획에 있습니다. \n- 수집항목 : 회원성명, 이메일, 연락처 등 개인정보\n\n2. 개인정보의 제3자 제공\n집사할래 회원의 개인정보를 원칙적으로 외부에 제공하지 않습니다. \n다만 서비스제공을 위하여 입양 신청서에 기재된 개인정보는 사전에 동의한 경우에 제한적으로 제공됩니다.\n- 제공대상 : 분양자\n- 제공하는 항목 : 회원성명, 점수내역 등 개인정보\n- 제공 목적 :  오프라인 미팅 주선과 사후관리(보증금지급, 게약이행여부 확인 등)\n\n위 개인정보의 수집·이용·제공과 관련하여 개인정보 동의를 거부할 수 있습니다. 다만, 위 개인정보는 원활한 서비스제공을 위한 자료 요청 등으로 활용할 계획이므로, 거부하실 경우 서비스사용이 제한되실 수 있습니다.\n\n※ 개인정보 제공자가 동의한 내용 외의 다른 목적으로 활용하지 않으며 제공된 개인정보의 이용을 , 거부하고자 할 때에는 개인정보 관리책임자를 통해 열람 정정 삭제를 요구할 수 있음',
                          hintStyle: TextStyle(color: Colors.black),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        )),
                  )
                ],
              ),
            ),
            // 동의 필드
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Checkbox(
                        activeColor: Colors.orange,
                        value: agree,
                        onChanged: (bool value) {
                          setState(() {
                            agree = value;
                          });
                        },
                      ),
                      Text('위의 이용약관을 모두 읽었으며 이에 동의합니다.')
                    ],
                  ),
                ],
              ),
            ),
            // 확인 버튼
            Container(
              padding: EdgeInsets.only(bottom: 15),
              child: Center(
                child: ButtonTheme(
                  minWidth: 200,
                  height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: RaisedButton(
                    child: Text(
                      '확인',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.orange,
                    onPressed: _goBack,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _goBack() {
    Navigator.pop(context);
  }
}
