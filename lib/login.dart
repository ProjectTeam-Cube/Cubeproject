import 'package:flutter/material.dart';
import 'package:material_text_fields/material_text_fields.dart';
import 'package:material_text_fields/theme/material_text_field_theme.dart';
import 'package:material_text_fields/utils/form_validation.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
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
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 25, left: 25),
            child: MaterialTextField(
              keyboardType: TextInputType.text,
              hint: '비밀번호',
              labelText: 'Password',
              textInputAction: TextInputAction.next,
              prefixIcon: const Icon(Icons.password),
              //controller: _nameController,
              validator: FormValidation.emailTextField,
              theme: FilledOrOutlinedTextTheme(
                radius: 15,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                errorStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                fillColor: Colors.transparent,
                prefixIconColor: Color(0xFFFF6F0F),
                enabledColor: Colors.grey,
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
            child: ElevatedButton(
              onPressed: () {
                // 버튼을 눌렀을 때 수행할 동작을 여기에 추가하세요.
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, // 버튼 내 텍스트의 색상
                backgroundColor: const Color(0xFFFF6F0F), // 버튼 배경색
                padding: const EdgeInsets.symmetric(
                    horizontal: 40, vertical: 20), // 버튼의 내부 패딩
                shape: RoundedRectangleBorder(
                  // 버튼의 모양 설정
                  borderRadius: BorderRadius.circular(13.0),
                ),
                minimumSize: Size(400, 50), // 버튼의 최소 크기 지정
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
        ],
      ),
    );
  }
}
