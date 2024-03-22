import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_text_fields/material_text_fields.dart';
import 'package:material_text_fields/theme/material_text_field_theme.dart';
import 'package:material_text_fields/utils/form_validation.dart';

import 'bottom_navigation_bar.dart';

class MyFormBody extends StatefulWidget {
  const MyFormBody({Key? key}) : super(key: key);

  @override
  _MyFormBodyState createState() => _MyFormBodyState();
}

class _MyFormBodyState extends State<MyFormBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController =
      TextEditingController(); // 전화번호 입력 컨트롤러 추가

  bool _showMore = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          CircleAvatar(
            radius: 80, // 아이콘 크기 설정
            backgroundImage:
                AssetImage('assets/images/leedohyun.jpg'), // 이미지 소스 설정
          ),
          SizedBox(height: 20),
          const SizedBox(
            height: 16,
          ),
          MaterialTextField(
            keyboardType: TextInputType.text,
            hint: '이름',
            labelText: 'Name',
            textInputAction: TextInputAction.next,
            prefixIcon: const Icon(Icons.person),
            controller: _nameController,
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
          const SizedBox(
            height: 16,
          ),
          MaterialTextField(
            keyboardType: TextInputType.phone,
            hint: '전화번호',
            labelText: 'Phone',
            textInputAction: TextInputAction.next,
            prefixIcon: const Icon(Icons.call),
            controller: _phoneController, // 전화번호 입력 컨트롤러 연결
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
          const SizedBox(
            height: 16,
          ),
          MaterialTextField(
            keyboardType: TextInputType.emailAddress,
            hint: '이메일',
            labelText: 'Email',
            textInputAction: TextInputAction.next,
            prefixIcon: const Icon(Icons.email_outlined),
            controller: _emailController,
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
          if (!_showMore) // _showMore가 false일 때만 버튼을 표시합니다.
            TextButton(
              onPressed: () {
                setState(() {
                  _showMore = !_showMore; // 버튼 클릭 시 _showMore 상태를 토글합니다.
                });
              },
              child: Text(_showMore
                  ? '∧ 항목 숨기기'
                  : '∨ 항목 더보기'), // _showMore 값에 따라 버튼 텍스트를 동적으로 변경합니다.
            ),

          const SizedBox(
            height: 16,
          ),

          //숨겨진 폼
          if (_showMore) ...[
            MaterialTextField(
              keyboardType: TextInputType.emailAddress,
              hint: '관계',
              labelText: 'Relationship',
              textInputAction: TextInputAction.next,
              prefixIcon: const Icon(Icons.handshake),
              controller: _emailController,
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
            // 필요한 만큼 MaterialTextField 추가

            const SizedBox(
              height: 16,
            ),

            MaterialTextField(
              keyboardType: TextInputType.emailAddress,
              hint: '주소',
              labelText: 'Address',
              textInputAction: TextInputAction.next,
              prefixIcon: const Icon(Icons.location_on),
              controller: _emailController,
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

            const SizedBox(
              height: 16,
            ),

            MaterialTextField(
              keyboardType: TextInputType.emailAddress,
              hint: '메모',
              labelText: 'Memo',
              textInputAction: TextInputAction.next,
              prefixIcon: const Icon(Icons.note_alt),
              controller: _emailController,
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

            const SizedBox(
              height: 16,
            ),

            TextButton(
              onPressed: () {
                setState(() {
                  _showMore = !_showMore; // 버튼 클릭 시 _showMore 상태를 토글합니다.
                });
              },
              child: Text(_showMore
                  ? '∧ 항목 숨기기'
                  : '∨ 항목 더보기'), // _showMore 값에 따라 버튼 텍스트를 동적으로 변경합니다.
            ),
          ], //숨겨진 폼
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly, // 버튼 사이에 공간을 균등하게 배분
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.43, // 화면 너비의 50%에서 조금 빼서 버튼 사이에 공간을 만듦
                  height: 45,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        // backgroundColor: MaterialStateProperty.all(Colors.white), // 버튼 배경색을 하얀색으로 설정
                        // foregroundColor: MaterialStateProperty.all(Colors.black), // 버튼 텍스트 색상을 검은색으로 설정
                        ),
                    child: Text(
                      "취소하기",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.43, // 화면 너비의 50%에서 조금 빼서 버튼 사이에 공간을 만듦
                  height: 45,
                  child: ElevatedButton(
                    child: Text(
                      "저장하기",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReservationPage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
