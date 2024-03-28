// 모달 창 출력 페이지

import 'package:flutter/material.dart';

class ModalStart extends StatefulWidget {
  const ModalStart({Key? key}) : super(key: key);

  @override
  State<ModalStart> createState() => _ModalStartState();
}

class _ModalStartState extends State<ModalStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modal Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  contentPadding: EdgeInsets.zero,
                  content: Container(
                    constraints: BoxConstraints(minWidth: 700, minHeight: 250),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0),
                            ),
                          ),
                          padding: const EdgeInsets.all(20.0),
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
                        const SizedBox(height: 20),
                        const Text(
                          '예약된 시간입니다.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 10),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: '전화',
                            style: const TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                            children: [
                              TextSpan(
                                text: '를 실행해 볼까요?',
                                style: const TextStyle(
                                    color: Color(0xFF777777),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                // 버튼 클릭 시 수행될 동작
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.grey[300]), // 배경색 설정
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
                              child: const Text(
                                '아니요',
                                style: TextStyle(
                                  color: Colors.black, // 텍스트 색상 설정
                                  fontSize: 16.0, // 텍스트 크기 설정
                                  fontWeight: FontWeight.normal, // 텍스트 굵기 설정
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            TextButton(
                              onPressed: () {
                                // 버튼 클릭 시 수행될 동작
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
                              child: const Text(
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
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: const Text('Show Modal'),
        ),
      ),
    );
  }
}
