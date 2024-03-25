import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class SearchbarAnimationExample extends StatefulWidget {
  const SearchbarAnimationExample({Key? key}) : super(key: key);

  @override
  _SearchbarAnimationExampleState createState() =>
      _SearchbarAnimationExampleState();
}

class ContactInfo {
  String name;
  String phoneNumber;
  String imagePath;

  ContactInfo(
      {required this.name,
      required this.phoneNumber,
      this.imagePath = 'assets/images/leedohyun.jpg'});

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phoneNumber,
        'imagePath': imagePath,
      };

  factory ContactInfo.fromJson(Map<String, dynamic> json) {
    return ContactInfo(
      name: json['name'],
      phoneNumber: json['phone'],
      imagePath: json['imagePath'] ?? 'assets/images/leedohyun.jpg',
    );
  }
}

class _SearchbarAnimationExampleState extends State<SearchbarAnimationExample> {
  String _name = '';
  String _phone = '';
  String _email = '';
  String? _imagePath;

  List<ContactInfo> _userList = [];

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  Future<void> _loadSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    final String? contactInfoListJson = prefs.getString('contactInfoList');
    if (contactInfoListJson != null) {
      print("Loaded data: $contactInfoListJson"); // 로그 출력
      Iterable decoded = json.decode(contactInfoListJson);
      setState(() {
        _userList = decoded.map((json) => ContactInfo.fromJson(json)).toList();
      });
    } else {
      print("No data found"); // 데이터가 없을 때 로그 출력
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildSearchbarAnimation(),
    );
  }

  Widget _buildSearchbarAnimation() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 1.0, left: 8.0, right: 8.0, bottom: 8.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(color: Colors.transparent), // 테두리를 투명하게
                    ),
                    enabledBorder: OutlineInputBorder(
                      // 기본 상태의 테두리도 투명하게
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      // 포커스 상태의 테두리도 투명하게
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  // 현재 인덱스에 해당하는 User 객체
                  User currentUser = users[index];

                  return Slidable(
                    key: ValueKey(currentUser.name),
                    startActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) => doNothing(context),
                          backgroundColor: Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                        SlidableAction(
                          onPressed: (context) => doNothing(context),
                          backgroundColor: Color(0xFF21B7CA),
                          foregroundColor: Colors.white,
                          icon: Icons.share,
                          label: 'Share',
                        ),
                      ],
                    ),
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) => doNothing(context),
                          backgroundColor: Color(0xFF7BC043),
                          foregroundColor: Colors.white,
                          icon: Icons.archive,
                          label: 'Archive',
                        ),
                        SlidableAction(
                          onPressed: (context) => doNothing(context),
                          backgroundColor: Color(0xFF0392CF),
                          foregroundColor: Colors.white,
                          icon: Icons.save,
                          label: 'Save',
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(currentUser.imagePath),
                      ),
                      title: Text(currentUser.name),
                      subtitle: Text(currentUser.phoneNumber),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Name: $_name'),
                    Text('Phone: $_phone'),
                    // 이미지 경로가 있으면 이미지를 표시하고, 없으면 기본 이미지 표시
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: _imagePath != null
                          ? FileImage(File(_imagePath!)) as ImageProvider
                          : AssetImage('assets/images/leedohyun.jpg'),
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

void doNothing(BuildContext context) {}

class User {
  String name;
  String phoneNumber;
  String imagePath;

  User(this.name, this.phoneNumber, this.imagePath);
}

// 메인 함수나 위젯 클래스 안에서 사용자 데이터 리스트 생성
final List<User> users = [
  User('이도현', '010-1234-5678', 'assets/images/leedohyun.jpg'),
  User('박은빈', '010-2345-6789', 'assets/images/enbin.jpg'),
  User('서현진', '010-3456-7890', 'assets/images/hyunjin.jpg'),
  User('김유정', '010-4567-8901', 'assets/images/ujung.jpg'),
  User('흰둥이', '010-5678-9012', 'assets/images/hyn.jpg'),
  User('짱구', '010-5678-9012', 'assets/images/jjang.jpg'),

  // 필요한 만큼 사용자를 추가할 수 있습니다.
];
