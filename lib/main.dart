import 'dart:convert';

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
      debugShowCheckedModeBanner: false,
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
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  //정보 입력 컨트롤러
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _showMore = false;

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
                  radius: 62,
                  backgroundImage: _image != null
                      ? FileImage(_image!) as ImageProvider<Object>
                      : AssetImage('assets/images/basic.png')
                          as ImageProvider<Object>,
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
                  errorStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700),
                  fillColor: Colors.transparent,
                  prefixIconColor: Color(0xFFFF6F0F),
                  enabledColor: Colors.grey,
                  focusedColor: Color(0xFFFF6F0F),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  floatingLabelStyle: const TextStyle(color: Color(0xFFFF6F0F)),
                  width: 1.5,
                  labelStyle:
                      const TextStyle(fontSize: 16, color: Colors.black),
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
                  errorStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700),
                  fillColor: Colors.transparent,
                  prefixIconColor: Color(0xFFFF6F0F),
                  enabledColor: Colors.grey,
                  focusedColor: Color(0xFFFF6F0F),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  floatingLabelStyle: const TextStyle(color: Color(0xFFFF6F0F)),
                  width: 1.5,
                  labelStyle:
                      const TextStyle(fontSize: 16, color: Colors.black),
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
                  errorStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700),
                  fillColor: Colors.transparent,
                  prefixIconColor: Color(0xFFFF6F0F),
                  enabledColor: Colors.grey,
                  focusedColor: Color(0xFFFF6F0F),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  floatingLabelStyle: const TextStyle(color: Color(0xFFFF6F0F)),
                  width: 1.5,
                  labelStyle:
                      const TextStyle(fontSize: 16, color: Colors.black),
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
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    errorStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700),
                    fillColor: Colors.transparent,
                    prefixIconColor: Color(0xFFFF6F0F),
                    enabledColor: Colors.grey,
                    focusedColor: Color(0xFFFF6F0F),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    floatingLabelStyle:
                        const TextStyle(color: Color(0xFFFF6F0F)),
                    width: 1.5,
                    labelStyle:
                        const TextStyle(fontSize: 16, color: Colors.black),
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
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    errorStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700),
                    fillColor: Colors.transparent,
                    prefixIconColor: Color(0xFFFF6F0F),
                    enabledColor: Colors.grey,
                    focusedColor: Color(0xFFFF6F0F),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    floatingLabelStyle:
                        const TextStyle(color: Color(0xFFFF6F0F)),
                    width: 1.5,
                    labelStyle:
                        const TextStyle(fontSize: 16, color: Colors.black),
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
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    errorStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700),
                    fillColor: Colors.transparent,
                    prefixIconColor: Color(0xFFFF6F0F),
                    enabledColor: Colors.grey,
                    focusedColor: Color(0xFFFF6F0F),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    floatingLabelStyle:
                        const TextStyle(color: Color(0xFFFF6F0F)),
                    width: 1.5,
                    labelStyle:
                        const TextStyle(fontSize: 16, color: Colors.black),
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
                padding: const EdgeInsets.only(top: 120.0),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly, // 버튼 사이에 공간을 균등하게 배분
                  children: <Widget>[
                    SizedBox(
                      width: 165,
                      height: 55,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          // backgroundColor: MaterialStateProperty.all(Colors.white), // 버튼 배경색을 하얀색으로 설정
                          // foregroundColor: MaterialStateProperty.all(Colors.black), // 버튼 텍스트 색상을 검은색으로 설정
                          foregroundColor: MaterialStateProperty.all(
                              Colors.black), // 버튼 텍스트 색상을 검은색으로 설정
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), // 살짝 각진 모서리를 위해 설정
                            ),
                          ),
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
                      width: 165, // 화면 너비의 50%에서 조금 빼서 버튼 사이에 공간을 만듦
                      height: 55,
                      child: ElevatedButton(
                        child: Text(
                          "저장하기",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF6F0F), // 버튼 배경색을 설정
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // 살짝 각진 모서리를 위해 설정
                          ),
                        ),
                        onPressed: () async {
                          // PhoneInfo 객체 생성 시, _image.path를 imagePath로 설정
                          PhoneInfo newInfo = PhoneInfo(
                            name: _nameController.text,
                            phone: _phoneController.text,
                            email: _emailController.text,
                            imagePath: _image?.path ?? '', // 이미지 경로 추가
                          );

                          // 새로운 PhoneInfo 객체를 리스트에 추가하고 저장
                          await _savePhoneInfoList(newInfo);

                          // 다음 페이지로 이동
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SearchbarAnimationExample()),
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

class PhoneInfo {
  String name;
  String phone;
  String email;
  String imagePath; // 이미지 경로 필드 추가

  PhoneInfo({
    required this.name,
    required this.phone,
    required this.email,
    this.imagePath = '', // 기본값으로 빈 문자열 설정
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'email': email,
        'imagePath': imagePath, // JSON 변환 시 imagePath도 포함
      };

  factory PhoneInfo.fromJson(Map<String, dynamic> json) {
    return PhoneInfo(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      imagePath: json['imagePath'] ?? '', // imagePath가 없는 경우 기본값으로 빈 문자열 설정
    );
  }
}

Future<void> _savePhoneInfoList(PhoneInfo info) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final String? phoneInfoListJson = prefs.getString('phoneInfoList');
    List<PhoneInfo> phoneInfoList = phoneInfoListJson != null
        ? (json.decode(phoneInfoListJson) as List)
            .map((item) => PhoneInfo.fromJson(item))
            .toList()
        : [];
    phoneInfoList.add(info);
    // 데이터를 JSON 문자열로 변환하여 저장
    await prefs.setString('phoneInfoList',
        json.encode(phoneInfoList.map((item) => item.toJson()).toList()));

    // 저장 후 바로 데이터를 불러와 로그로 출력하여 확인
    final String? savedData = prefs.getString('phoneInfoList');
    print("Saved data: $savedData");

    // 불러온 데이터를 로그로 출력
    if (savedData != null) {
      List<dynamic> decodedList = json.decode(savedData);
      List<PhoneInfo> loadedList =
          decodedList.map((json) => PhoneInfo.fromJson(json)).toList();
      print("Loaded list:");

      loadedList.forEach((phoneInfo) {
        print(
            "Name: ${phoneInfo.name}, Phone: ${phoneInfo.phone}, Email: ${phoneInfo.email}, image: ${phoneInfo.imagePath}");
      });
    }
  } catch (e) {
    print("Error saving data: $e");
  }
}
