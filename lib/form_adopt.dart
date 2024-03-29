import 'package:flutter/material.dart';
import 'package:my_guardian/model_dog.dart';

class AdoptForm extends StatefulWidget {
  final Dog dog;
  const AdoptForm(this.dog);

  @override
  _AdoptFormState createState() => _AdoptFormState();
}

class _AdoptFormState extends State<AdoptForm> {
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
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 입양신청 타이틀
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Text(
                '입양신청',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            // 입양절차 타이틀
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Text(
                '입양절차',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // No.1
            _buildStep(
              1,
              '이용약관에 동의 후 신청',
              '입양신청 시, 분양자에게 닉네임과 점수, \n한마디가 전달됩니다.',
            ),
            // No.2
            _buildStep(
              2,
              '신청 후 대기',
              '분양자가 신청자의 요청을 수락하면 집사할래 측에서\n개별적으로 연락을 보내드립니다.',
            ),
            // No.3
            _buildStep(
              3,
              '장소 협의 후 미팅 진행',
              '집사할래 관계자가 주선하는 오프라인 미팅을 통해\n안전하고 공정한 입양을 도와드립니다.',
            ),
            // No.4
            _buildStep(
              4,
              '입양완료',
              '계약기간 동안 협의 내용을 완수했을 시\n보증금을 돌려 받습니다.',
            ),
            // 한 마디 필드
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    // padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                    child: Text(
                      '한마디 남기기',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: TextField(
                      maxLines: 8,
                      decoration: InputDecoration(
                        hintText: '견주님에게 한 마디 남겨주세요!',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // 이용약관
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      '이용약관',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                      ),
                    ),
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
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: RaisedButton(
                    child: Text(
                      '입양신청',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.orange,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildStep(int index, String title, String text) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
                child: Text(
                  index.toString(),
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 5),
            child: Row(
              children: <Widget>[
                Container(
                  width: 6,
                  height: 50,
                  color: Colors.orange[200],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                ),
                Container(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
