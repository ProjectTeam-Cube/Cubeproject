import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_text_fields/material_text_fields.dart';
import 'package:material_text_fields/theme/material_text_field_theme.dart';
import 'package:material_text_fields/utils/form_validation.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.fromLTRB(1.0, 8.0, 8.0, 8.0),
          child: Text(
            '회원가입',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Center(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 1000,
            decoration: BoxDecoration(
              border: Border.all(color:Colors.deepPurpleAccent),
              //color: Colors.grey[200], // 배경색 설정
              //borderRadius: BorderRadius.circular(10), // 테두리 모양 설정
            ),
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
                  SizedBox(height: 20), // 텍스트 사이에 간격을 줍니다
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
                      //controller: _nameController,
                      validator: FormValidation.emailTextField,
                      theme: FilledOrOutlinedTextTheme(
                        radius: 15,
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        errorStyle:
                        const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                        fillColor: Colors.transparent,
                        prefixIconColor: Color(0xFFFF6F0F),
                        enabledColor: Colors.grey,
                        focusedColor: Color(0xFFFF6F0F),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        floatingLabelStyle: const TextStyle(color: Color(0xFFFF6F0F)),
                        width: 1.5,
                        labelStyle: const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 14), // 텍스트 사이에 간격을 줍니다
                  Padding(
                    padding: const EdgeInsets.only(top: 1.0, right: 25, left: 25),
                    child: MaterialTextField(
                      keyboardType: TextInputType.text,
                      hint: '비밀번호',
                      labelText: 'password',
                      textInputAction: TextInputAction.next,
                      prefixIcon: const Icon(Icons.person),
                      //controller: _nameController,
                      validator: FormValidation.emailTextField,
                      theme: FilledOrOutlinedTextTheme(
                        radius: 12,
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        errorStyle:
                        const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                        fillColor: Colors.transparent,
                        prefixIconColor: Color(0xFFFF6F0F),
                        enabledColor: Colors.grey,
                        focusedColor: Color(0xFFFF6F0F),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        floatingLabelStyle: const TextStyle(color: Color(0xFFFF6F0F)),
                        width: 1.5,
                        labelStyle: const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 14), // 텍스트 사이에 간격을 줍니다
                  Padding(
                    padding: const EdgeInsets.only(top: 1.0, right: 25, left: 25),
                    child: MaterialTextField(
                      keyboardType: TextInputType.text,
                      hint: '비밀번호 확인',
                      labelText: 'password check',
                      textInputAction: TextInputAction.next,
                      prefixIcon: const Icon(Icons.person),
                      //controller: _nameController,
                      validator: FormValidation.emailTextField,
                      theme: FilledOrOutlinedTextTheme(
                        radius: 15,
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        errorStyle:
                        const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                        fillColor: Colors.transparent,
                        prefixIconColor: Color(0xFFFF6F0F),
                        enabledColor: Colors.grey,
                        focusedColor: Color(0xFFFF6F0F),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        floatingLabelStyle: const TextStyle(color: Color(0xFFFF6F0F)),
                        width: 1.5,
                        labelStyle: const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 450.0, right: 16, left: 16),
                      child: ElevatedButton(
                        onPressed: () {
                          // 버튼을 눌렀을 때 수행할 동작을 여기에 추가하세요.
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, // 버튼 내 텍스트의 색상
                          backgroundColor: const Color(0xFFFF6F0F), // 버튼 배경색
                          padding: const EdgeInsets.symmetric(
                              horizontal: 200, vertical: 26), // 버튼의 내부 패딩
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
                            color: Colors.white, // 버튼 내 텍스트의 색상
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ),
          ),
        ),
      );
  }
}
