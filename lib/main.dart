import 'package:cube/search.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_text_fields/material_text_fields.dart';
import 'package:material_text_fields/theme/material_text_field_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'bottom_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyFormBody(), // 입력란이 포함된 컨테이너
        bottomNavigationBar: BottomNavigationBarApp(),
      ),
    );
  }
}

class FormValidation {
  static String? nameTextField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name cannot be empty';
    }
    return null; // No error
  }

  static String? phoneTextField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number cannot be empty';
    }
    // 추가적인 전화번호 형식 검증 로직을 여기에 구현할 수 있습니다.
    return null; // No error
  }

  static String? emailTextField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    // 이메일 형식 검증 로직을 유지합니다.
    return null; // No error
  }
}


class MyFormBody extends StatefulWidget {
  const MyFormBody({Key? key}) : super(key: key);

  @override
  _MyFormBodyState createState() => _MyFormBodyState();
}

class _MyFormBodyState extends State<MyFormBody> {

  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> getImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController =
  TextEditingController(); // 전화번호 입력 컨트롤러 추가

  bool _showMore = false;

  void _saveData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', _nameController.text);
      await prefs.setString('phone', _phoneController.text);
      await prefs.setString('email', _emailController.text);
    } catch (e) {
      print("저장 중 오류 발생: $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('전화번호 등록'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  getImage(); // 갤러리에서 이미지를 선택하기 위해 getImage 메서드 호출
                },
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: _image != null
                      ? FileImage(_image!) as ImageProvider<Object>
                      : AssetImage('assets/images/leedohyun.jpg') as ImageProvider<Object>,
                  // 선택된 이미지가 없으면 기본 이미지 표시
                ),
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
                validator: FormValidation.nameTextField,
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
                validator: FormValidation.phoneTextField,
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
                        onPressed: () {
                          Navigator.pop(context);
                        },
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
                          _saveData();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchbarAnimationExample(),
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
        ),
      ),
    );
  }
}
