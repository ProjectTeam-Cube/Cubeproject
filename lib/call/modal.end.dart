import 'package:flutter/material.dart';

import '../alarm/notification.dart';
import '../firstviewpage/main_screen.dart';
import 'call.dart';
import 'memory.dart';

class ModalMemo extends StatefulWidget {
  const ModalMemo({Key? key}) : super(key: key);

  @override
  State<ModalMemo> createState() => _ModalMemoState();
}

class _ModalMemoState extends State<ModalMemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/modalstart.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                  ),
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/post.png',
                        width: 35,
                        height: 35,
                      ),
                      SizedBox(width: 10),
                      TextButton(
                        onPressed: () =>
                            FlutterLocalNotification.showNotification(),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero, // 버튼의 패딩을 제거하거나 조정
                          tapTargetSize: MaterialTapTargetSize
                              .shrinkWrap, // 버튼 영역을 내용물에 맞게 조정
                          minimumSize: Size.zero, // 최소 크기를 0으로 설정
                        ),
                        child: Text(
                          '안내',
                          style: TextStyle(
                            color: Color(0xff26C100),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                  ), // 여기에 배경색을 적용
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        '통화가 종료되었습니다.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 10),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: '오늘의',
                          style: TextStyle(
                              color: Color(0xFF777777),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          children: [
                            TextSpan(
                              text: ' 통화기록',
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            TextSpan(
                              text: '을 남겨 볼까요?',
                              style: TextStyle(
                                  color: Color(0xFF777777),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MainScreen()), // LoginPage로 이동합니다.
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.grey[200]), // 배경색 설정
                              minimumSize: MaterialStateProperty.all(
                                  Size(100, 50)), // 최소 크기 설정
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(8.0), // 둥근 모서리 설정
                                ),
                              ),
                            ),
                            child: Text(
                              '아니요',
                              style: TextStyle(
                                color: Colors.black, // 텍스트 색상 설정
                                fontSize: 16.0, // 텍스트 크기 설정
                                fontWeight: FontWeight.normal, // 텍스트 굵기 설정
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Memory()), // LoginPage로 이동합니다.
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.orange), // 배경색 설정
                              minimumSize: MaterialStateProperty.all(
                                  Size(100, 50)), // 최소 크기 설정
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(8.0), // 둥근 모서리 설정
                                ),
                              ),
                            ),
                            child: Text(
                              '네',
                              style: TextStyle(
                                color: Colors.white, // 텍스트 색상 설정
                                fontSize: 16.0, // 텍스트 크기 설정
                                fontWeight: FontWeight.normal, // 텍스트 굵기 설정
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20), // 모달 창 하단에 여백 추가
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
