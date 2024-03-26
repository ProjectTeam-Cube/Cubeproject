import 'package:cube/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_text_fields/material_text_fields.dart';
import 'package:material_text_fields/theme/material_text_field_theme.dart';
import 'package:material_text_fields/utils/form_validation.dart';
import 'package:provider/provider.dart';

import 'Login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordCheckController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   passwordCheckController.addListener(validatePassword); // passwordCheckController에 대한 변화를 감지하도록 설정
  // }
  //
  // void validatePassword() {
  //   if (passwordCheckController.text != passwordController.text) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('비밀번호가 일치하지 않습니다.'),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, authService, child){
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
                    //border: Border.all(color:Colors.deepPurpleAccent),
                    //color: Colors.grey[200], // 배경색 설정
                    //borderRadius: BorderRadius.circular(10), // 테두리 모양 설정
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top:30.0),
                    child: Column( // 여러 텍스트를 추가하기 위해 Column을 사용합니다
                        mainAxisAlignment: MainAxisAlignment.center, // 텍스트를 세로 중앙 정렬
                        children: [
                          Text(
                            '회원가입',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF393939)
                            ),
                          ),
                          SizedBox(height: 6), // 텍스트 사이에 간격을 줍니다
                          Text(
                            '아이디/ 비밀번호를 입력해주세요.',
                            style: TextStyle(
                                fontSize: 13,
                                //fontWeight: FontWeight.bold,
                                color: Color(0xFF404040)
                            ),
                          ),
                          SizedBox(height: 40), // 텍스트 사이에 간격을 줍니다
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
                              hint: '문자열 숫자포함 6글자 이상',
                              labelText: 'Password',
                              textInputAction: TextInputAction.next,
                              prefixIcon: const Icon(Icons.password),
                              controller: passwordController,
                              //obscureText: true,//비밀번호 숨기기
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
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0, right: 25, left: 25),
                            child: MaterialTextField(
                              keyboardType: TextInputType.text,
                              hint: '문자열 숫자포함 6글자 이상',
                              labelText: 'Password check',
                              //obscureText: true,//비밀번호 숨기기
                              textInputAction: TextInputAction.next,
                              prefixIcon: const Icon(Icons.password),
                              controller: passwordCheckController,
                              //validator: FormValidation.emailTextField,
                              validator: (value) {
                                if (value != passwordController.text) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('비밀번호가 일치하지 않습니다.'),
                                    ),
                                  );
                                  return '비밀번호가 일치하지 않습니다.';
                                }
                                return null;
                              },
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
                          SizedBox(height: 300), // 간격을 조절합니다
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 14, left: 14),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (passwordCheckController.text != passwordController.text) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('비밀번호가 일치하지 않습니다.'),
                                      ),
                                    );
                                  } else {
                                    authService.signUp(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      onSuccess: () {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text('회원가입 성공'),
                                          ),
                                        );
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (_) => LoginPage()),
                                        );
                                      },
                                      onError: (err) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(err),
                                          ),
                                        );
                                      },
                                    );
                                  }
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
                                  minimumSize: Size(280, 50), // 버튼의 최소 크기 지정
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
                      ),
                  )
                  ),
                ),
              ),
          ),
          );
      }
    );
  }
}
