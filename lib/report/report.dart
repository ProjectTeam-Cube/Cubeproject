import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../appbarAndnavigatorbar/app_bar.dart';

class Report extends StatefulWidget {
  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  final List<ContactRecord> contacts = [
    ContactRecord(name: '아빠', call: '통화성공', time: '2분', phonenum: '2024.03.4'),
    ContactRecord(name: '이은재', call: '통화성공', time: '1분', phonenum: '2024.03.3'),
    ContactRecord(
        name: '배정현', call: '통화실패', time: '취소된 통화', phonenum: '2024.03.2'),
    ContactRecord(name: '김이랑', call: '통화성공', time: '2분', phonenum: '2024.03.2'),
  ];

  String dropdownValue = '3월';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '리포트',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF393939)),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // 하단 선의 높이 설정
          child: Divider(
            height: 0.5, // 선의 높이 설정
            color: Color(0xFFe1e1e1), // 선의 색상 설정
          ),
        ),
        actions: <Widget>[
          // 우측 끝에 아이콘 버튼 추가
          IconButton(
            icon: Icon(
              Icons.search,
              color: Color(0xFF393939),
            ), // 첫 번째 아이콘
            onPressed: () {
              // 첫 번째 아이콘 버튼의 동작 정의
              print('검색 버튼이 클릭되었습니다.');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Color(0xFF393939),
            ), // 두 번째 아이콘
            onPressed: () {
              // 두 번째 아이콘 버튼의 동작 정의
              print('더보기 버튼이 클릭되었습니다.');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20, // 아이콘 크기 설정
                      backgroundImage:
                          AssetImage('assets/images/dohyun.jpg'), // 이미지 소스 설정
                    ),
                    Text(
                      '  이강권',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              icon: const Icon(
                                Icons.expand_more,
                                color: Colors.black,
                              ), // 드롭다운 아이콘
                              iconSize: 26, // 아이콘 크기
                              elevation: 16, // 드롭다운 메뉴의 높이
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 25), // 텍스트 스타일
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    dropdownValue = newValue;
                                  });
                                }
                              },
                              items: <String>[
                                '1월',
                                '2월',
                                '3월',
                                '4월',
                                '5월',
                                '6월',
                                '7월',
                                '8월',
                                '9월',
                                '10월',
                                '11월',
                                '12월'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              child: Container(
                height: 60.0, // 높이 유지
                decoration: BoxDecoration(
                  color: Colors.orange[100],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 17.0), // 수직 패딩 감소
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '리포트',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                            fontSize: 20),
                      ),
                    ),
                    Icon(
                      Icons.bar_chart,
                      size: 40, // 아이콘 크기 조정
                      color: Colors.deepOrange,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 5.0), // 좌우 여백 조절
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment:
                              MainAxisAlignment.center, // 항목들을 수직 중앙에 배치
                          children: [
                            Text(
                              '😃',
                              style: TextStyle(
                                fontSize: 55, // 숫자의 텍스트 크기는 조금 더 작게 설정
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                '예약 등록',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4), // 텍스트 주변 여백 조절
                              decoration: BoxDecoration(
                                color: Colors.blueAccent, // 배경색 설정
                                borderRadius:
                                    BorderRadius.circular(20), // 모서리 둥글게 설정
                              ),
                              child: Text(
                                '20건',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white, // 텍스트 색상을 배경과 대비되게 설정
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25, bottom: 25),
                      child: VerticalDivider(
                        // 두 번째와 세 번째 섹션 사이의 구분선
                        color: Colors.grey, // 구분선 색상
                        thickness: 1, // 구분선 두께
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment:
                              MainAxisAlignment.center, // 항목들을 수직 중앙에 배치
                          children: [
                            Text(
                              '😍',
                              style: TextStyle(
                                fontSize: 55, // 숫자의 텍스트 크기는 조금 더 작게 설정
                                color: Colors.green,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                '통화 성공',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4), // 텍스트 주변 여백 조절
                              decoration: BoxDecoration(
                                color: Colors.green, // 배경색 설정
                                borderRadius:
                                    BorderRadius.circular(20), // 모서리 둥글게 설정
                              ),
                              child: Text(
                                '12건',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white, // 텍스트 색상을 배경과 대비되게 설정
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25, bottom: 25),
                      child: VerticalDivider(
                        // 두 번째와 세 번째 섹션 사이의 구분선
                        color: Colors.grey, // 구분선 색상
                        thickness: 1, // 구분선 두께
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment:
                              MainAxisAlignment.center, // 항목들을 수직 중앙에 배치
                          children: [
                            Text(
                              '😭',
                              style: TextStyle(
                                fontSize: 55, // 숫자의 텍스트 크기는 조금 더 작게 설정
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                '통화 실패',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4), // 텍스트 주변 여백 조절
                              decoration: BoxDecoration(
                                color: Colors.red, // 배경색 설정
                                borderRadius:
                                    BorderRadius.circular(20), // 모서리 둥글게 설정
                              ),
                              child: Text(
                                '8건',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white, // 텍스트 색상을 배경과 대비되게 설정
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                top: 10.0,
              ),
              child: Text(
                '통화 내역',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white, // 배경색 설정
                            borderRadius:
                                BorderRadius.circular(10.0), // 모서리 둥글게 설정
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey, // 테두리 색상 설정
                                width: 1.0, // 테두리 두께 설정
                              ),
                            ),
                          ),
                          child: ListTile(
                            title: Row(
                              children: [
                                Icon(Icons.person), // 아이콘 추가
                                Text(
                                  '     ${contacts[index].name}        ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                  // 전화번호를 위한 Expanded 위젯
                                  child: Text(
                                    '${contacts[index].phonenum}',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(color: Color(0xFF444444)),
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Row(
                                children: [
                                  SizedBox(width: 20),
                                  if (contacts[index].call == "통화성공")
                                    Text(
                                      '       ${contacts[index].call}         ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                    ),
                                  if (contacts[index].call == "통화실패")
                                    Text(
                                      '       ${contacts[index].call}         ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                  Spacer(), // 이 위젯은 남은 공간을 모두 채워줍니다.
                                  Icon(Icons.schedule, color: Colors.grey),
                                  SizedBox(width: 4), // 아이콘과 텍스트 사이에 조금 간격 추가
                                  Text(
                                    '${contacts[index].time}',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {},
                          ),
                        ),
                        if (index !=
                            contacts.length - 1) // 마지막 항목이 아닌 경우에만 공간 추가
                          SizedBox(height: 15.0),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactRecord {
  final String name;
  final String time;
  final String call;
  final String phonenum;

  ContactRecord(
      {required this.name,
      required this.time,
      required this.call,
      required this.phonenum});
}
