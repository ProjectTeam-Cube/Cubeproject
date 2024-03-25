import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'CheckBox.dart';

class Agreement extends StatefulWidget {
  const Agreement({super.key});

  @override
  State<Agreement> createState() => _AgreementState();
}

class _AgreementState extends State<Agreement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '회원 가입',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF393939)
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // 하단 선의 높이 설정
          child: Divider(
            height: 0.5, // 선의 높이 설정
            color: Color(0xFFe1e1e1), // 선의 색상 설정
          ),
        ),
        leading: IconButton(
          icon: Icon(
              CupertinoIcons.chevron_back,
              color: Color(0xFF393939)
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              //height: 1000,
              decoration: BoxDecoration(
                //border: Border.all(color:Colors.white),
                //color: Colors.grey[200], // 배경색 설정
                //borderRadius: BorderRadius.circular(10), // 테두리 모양 설정
              ),
              child: Padding(
                padding: const EdgeInsets.only(top:30.0),
                child: Column( // 여러 텍스트를 추가하기 위해 Column을 사용합니다
                    mainAxisAlignment: MainAxisAlignment.center, // 텍스트를 세로 중앙 정렬
                    children: [
                      Text(
                        '약관동의',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF393939)
                        ),
                      ),
                      SizedBox(height: 6), // 텍스트 사이에 간격을 줍니다
                      Text(
                        '필수정책 및 선택항목 약관에 동의해주세요',
                        style: TextStyle(
                            fontSize: 13,
                            //fontWeight: FontWeight.bold,
                            color: Color(0xFF404040)
                        ),
                      ),
                      SizedBox(height: 40), // 텍스트 사이에 간격을 줍니다
                      // 약관 동의 체크박스랑 텍스트 추가
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30), // 왼쪽에 30의 패딩을 추가합니다
                                child: CheckBox(), // CheckBox 위젯 추가
                              ),
                              SizedBox(width: 8), // 간격을 조절합니다
                              Text(
                                '전체동의',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF1B1F23),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10), // 간격을 조절합니다
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30), // 왼쪽에 30의 패딩을 추가합니다
                                child: CheckBox(), // CheckBox 위젯 추가
                              ),
                              SizedBox(width: 8), // 간격을 조절합니다
                              Text(
                                '[필수] 서비스 이용약관',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF1B1F23),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10), // 간격을 조절합니다
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30), // 왼쪽에 30의 패딩을 추가합니다
                                child: CheckBox(), // CheckBox 위젯 추가
                              ),
                              SizedBox(width: 8), // 간격을 조절합니다
                              Text(
                                '[필수] 개인정보수집/이용동의',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF1B1F23),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10), // 간격을 조절합니다
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30), // 왼쪽에 30의 패딩을 추가합니다
                                child: CheckBox(), // CheckBox 위젯 추가
                              ),
                              SizedBox(width: 8), // 간격을 조절합니다
                              Text(
                                '[선택] 위치기반 서비스 이용약관 동의',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF1B1F23),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10), // 간격을 조절합니다
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30), // 왼쪽에 30의 패딩을 추가합니다
                                child: CheckBox(), // CheckBox 위젯 추가
                              ),
                              SizedBox(width: 8), // 간격을 조절합니다
                              Text(
                                '[선택] 개인정보 제 3자 정보제공 동의',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF1B1F23),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 260), // 간격을 조절합니다
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16, left: 16),
                              child: ElevatedButton(
                                onPressed: () {
                                  // 버튼을 눌렀을 때 수행할 동작을 여기에 추가하세요.
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white, // 버튼 내 텍스트의 색상
                                  backgroundColor: const Color(0xFFFF6F0F), // 버튼 배경색
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 156, vertical: 24), // 버튼의 내부 패딩
                                  shape: RoundedRectangleBorder(
                                    // 버튼의 모양 설정
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  minimumSize: Size(300, 50), // 버튼의 최소 크기 지정
                                ),
                                child: Text(
                                  '회원가입',
                                  style: TextStyle(
                                    fontSize: 18, // 버튼 내 텍스트의 크기
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,// 버튼 내 텍스트의 색상
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ]
                ),
              ),
            ),
          ),
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: SizedBox(
      //     height: 100,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Icon(Icons.phone),
      //         Icon(Icons.message),
      //         Icon(Icons.contact_page),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}


//기본구조
// return MaterialApp(
// home: Scaffold(
// appBar: AppBar(),
// body: Container(),
// bottomNavigationBar: BottomAppBar (),
// )
// );
