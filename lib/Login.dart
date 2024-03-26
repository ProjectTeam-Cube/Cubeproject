import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_text_fields/material_text_fields.dart';
import 'package:material_text_fields/theme/material_text_field_theme.dart';
import 'package:material_text_fields/utils/form_validation.dart';

import 'Agreement.dart';
import 'SignUp.dart';
import 'CheckBox.dart';
import 'main.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cube/auth_service.dart';
import 'bottom_navigation_bar.dart';
import 'ButtonList.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Provider를 통한 AuthService 사용
    final AuthService authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '로그인',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 200,
                  height: 160,
                ),
              ),
            ),
            // SizedBox(height: 20),
            // const SizedBox(
            //   height: 16,
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 1.0, right: 25, left: 25),
              child: MaterialTextField(
                keyboardType: TextInputType.text,
                hint: '아이디',
                labelText: 'ID',
                textInputAction: TextInputAction.next,
                prefixIcon: const Icon(Icons.person),
                controller: emailController,
                validator: FormValidation.emailTextField,
                theme: FilledOrOutlinedTextTheme(
                  radius: 15,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  errorStyle:
                  const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFC8C8C8)
                  ),
                  fillColor: Colors.transparent,
                  prefixIconColor: Color(0xFFFF6F0F),
                  enabledColor: Color(0xFFC8C8C8),
                  focusedColor: Color(0xFFFF6F0F),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  floatingLabelStyle: const TextStyle(color: Color(0xFFFF6F0F)),
                  width: 1.5,
                  labelStyle: const TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, right: 25, left: 25),
              child: MaterialTextField(
                keyboardType: TextInputType.text,
                hint: '비밀번호호',
                labelText: 'Password',
                textInputAction: TextInputAction.next,
                prefixIcon: const Icon(Icons.password),
                controller: passwordController,
                obscureText: true,//비밀번호 숨기기
                validator: FormValidation.emailTextField,
                theme: FilledOrOutlinedTextTheme(
                  radius: 15,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  errorStyle:
                      const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFC8C8C8)
                      ),
                  fillColor: Colors.transparent,
                  prefixIconColor: Color(0xFFFF6F0F),
                  enabledColor: Color(0xFFC8C8C8),
                  focusedColor: Color(0xFFFF6F0F),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  floatingLabelStyle: const TextStyle(color: Color(0xFFFF6F0F)),
                  width: 1.5,
                  labelStyle: const TextStyle(
                      fontSize: 16,
                      color: const Color(0xFF393939)), // labelText 색상 지정
                  hintStyle: const TextStyle(
                      color: const Color(0xFFC8C8C8)), // hint 색상 지정
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14), // 왼쪽에 30의 패딩을 추가합니다
                  child: CheckBox(), // CheckBox 위젯 추가
                ),
                Text(
                  '로그인 상태 유지',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF919191),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 96),
                  child: Text(
                      '아이디/비밀번호 찾기',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF919191),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16), // 간격을 조절합니다
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(right: 16, left: 16),
                child: ElevatedButton(
                  onPressed: () {
                    // 로그인
                    authService.signIn(
                        email: emailController.text,
                        password: passwordController.text,
                        onSuccess: () {
                      // 로그인 성공
                      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //   content: Text("로그인 성공"),
                      // ));
                      //로그인 성공시 메인으로 이동
                      Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => HomePage()),
                      );
                    },
                    onError: (err){
                          //에러 발생
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(err),
                      ));
                    },
                    );
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
            SizedBox(height: 10), // 간격을 조절합니다
             Padding(
               padding: const EdgeInsets.only(left:62.0),
               child: Row(
                 children: [
                   Text('아직 여보세요 회원이 아니신가요?'),
                   TextButton(
                     onPressed: () {
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => Agreement()),
                       );
                     },
                     child: Text(
                         '회원가입',
                     style: TextStyle(
                       color:  const Color(0xFF26C100),
                       fontWeight: FontWeight.bold,// 버튼 내 텍스트의 색상
                     )
                     ),
                   )
                 ],
               ),
             )
          ],
        ),
      ),
    );
  }
}
