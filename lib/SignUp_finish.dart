import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingUp_finish extends StatelessWidget {
  const SingUp_finish({super.key});

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
            child: Container(
                //height: 1000,
                decoration: BoxDecoration(
                //border: Border.all(color:Colors.deepPurpleAccent),
            ),
              child: Padding(
                padding: const EdgeInsets.only(top:30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // 텍스트를 세로 중앙 정렬
                    children: [
                      Text(
                        '회원가입 완료',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF393939)
                        ),
                      ),
                      SizedBox(height: 2), // 텍스트 사이에 간격을 줍니다
                      Text(
                        '이제 여보세요 서비스를 이용할 수 있습니다.',
                        style: TextStyle(
                            fontSize: 13,
                            //fontWeight: FontWeight.bold,
                            color: Color(0xFF404040)
                        ),
                      ),
                      SizedBox(height: 40),
                      // 이미지 추가
                      Image.asset(
                        'assets/images/signup.jpg', // 이미지의 경로 설정
                        //width: 400, // 이미지의 너비 설정
                        //height: 426, // 이미지의 높이 설정
                      ),
                      SizedBox(height: 100), // 간격을 조절합니다
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
                              '로그인',
                              style: TextStyle(
                                fontSize: 18, // 버튼 내 텍스트의 크기
                                color: Colors.white,
                                fontWeight: FontWeight.bold,// 버튼 내 텍스트의 색상
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]
                ),
              ),
          ),
          ),
        )
        );
  }
}
