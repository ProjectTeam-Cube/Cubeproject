import 'package:flutter/material.dart';

import '../firstviewpage/main_screen.dart';
import 'call.dart';

class ModalReservation extends StatefulWidget {
  const ModalReservation({Key? key}) : super(key: key);

  @override
  State<ModalReservation> createState() => _ModalReservationState();
}

class _ModalReservationState extends State<ModalReservation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/modalend.jpg"),
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
                        'assets/images/reservation.png',
                        width: 35,
                        height: 35,
                      ),
                      SizedBox(width: 10),
                      Text(
                        '안내',
                        style: TextStyle(
                          color: Color(0xff26C100),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
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
                        '예약된 시간입니다.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 10),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: '전화',
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          children: [
                            TextSpan(
                              text: '를 실행해 볼까요?',
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
                                        Call()), // LoginPage로 이동합니다.
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
