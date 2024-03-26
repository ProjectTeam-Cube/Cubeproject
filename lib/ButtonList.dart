import 'package:cube/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Agreement.dart';
import 'CheckBox.dart';
import 'Login.dart';
import 'SignUp.dart';
import 'SignUp_finish.dart';

class ButtonList extends StatefulWidget {
  const ButtonList({super.key});

  @override
  State<ButtonList> createState() => _ButtonListState();
}

class _ButtonListState extends State<ButtonList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '회원가입 기능 체크',
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
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: SingleChildScrollView(
          child:  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Text('로그인'),
                //SizedBox(height: 20), // 버튼과 텍스트 사이의 간격을 조금 두겠습니다.
                ElevatedButton(
                  onPressed: () {
                    // 로그인 버튼이 누르면 LoginPage로 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginPage()), // LoginPage로 이동합니다.
                    );
                  },
                  child: Text('로그인'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    //버튼 기능
                    // 회원가입 버튼 누르면 SignUp 페이지로 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Agreement()),
                    );
                  },
                  child: Text('이용약관'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignUp()),
                    );
                  },
                  child: Text('회원가입'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SingUp_finish()),
                    );
                  },
                  child: Text('회원가입 완료'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    //로그아웃 버튼 눌렀을 때 로그인 페이지 이동
                    context.read<AuthService>().signOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text('로그아웃'),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
