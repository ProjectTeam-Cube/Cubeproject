import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../phone_number_add/phone_number_register.dart';

class PhoneBookMain extends StatefulWidget {
  const PhoneBookMain({Key? key}) : super(key: key);

  @override
  _PhoneBookMainState createState() => _PhoneBookMainState();
}

class _PhoneBookMainState extends State<PhoneBookMain> {
  List<ContactInfo> _userList = [];

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  Future<void> _loadSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    final String? contactInfoListJson = prefs.getString('phoneInfoList');
    if (contactInfoListJson != null) {
      Iterable decoded = json.decode(contactInfoListJson);
      setState(() {
        _userList = decoded.map((json) => ContactInfo.fromJson(json)).toList();
        // 로드된 데이터 출력
        for (var contact in _userList) {
          print('Success');
          // 'Name: ${contact.name}, Phone: ${contact.phoneNumber}, ImagePath: ${contact.imagePath}'
          // 불러오는 값들 확인하는 방법.
        }
      });
    } else {
      print("No data found");
    }
  }

  Future<void> _saveContactInfoList() async {
    final prefs = await SharedPreferences.getInstance();
    // _userList를 JSON으로 인코딩하여 저장합니다.
    String encodedData =
        json.encode(_userList.map((contact) => contact.toJson()).toList());
    await prefs.setString('phoneInfoList', encodedData);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            '전화번호 리스트',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF393939),
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
            icon: Icon(CupertinoIcons.chevron_back, color: Color(0xFF393939)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            // 우측 끝에 아이콘 버튼 추가
            IconButton(
              icon: Icon(
                Icons.search,
                color: Color(0xFF393939),
              ), // 첫 번째 아이콘
              onPressed: () {
                // 첫 번째 아이콘 버튼의 동작 정의
                print('검색 버튼이 클릭되었습니다.');
              },
            ),
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Color(0xFF393939),
              ), // 두 번째 아이콘
              onPressed: () {
                // 두 번째 아이콘 버튼의 동작 정의
                print('더보기 버튼이 클릭되었습니다.');
              },
            ),
          ],
        ),
        body: _buildSearchbarAnimation(),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'uniqueTag2',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PhoneNumberRegister()),
                );
              },
              tooltip: 'Increment',
              child: Icon(Icons.add, color: Colors.white),
              backgroundColor:
                  Color(0xFF26C100), // FloatingActionButton의 배경색 설정
              elevation: 1.0, // 그림자 크기 줄이기
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchbarAnimation() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 20.0, left: 8.0, right: 8.0, bottom: 8.0),
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
                itemCount: _userList.length, // 여기서 _userList의 길이를 사용합니다.
                itemBuilder: (context, index) {
                  // 현재 인덱스에 해당하는 ContactInfo 객체
                  ContactInfo currentContact = _userList[index];

                  ImageProvider imageProvider;
                  if (currentContact.imagePath.isNotEmpty &&
                      File(currentContact.imagePath).existsSync()) {
                    imageProvider = FileImage(File(currentContact.imagePath));
                  } else {
                    imageProvider = AssetImage('assets/images/leedohyun.jpg');
                  }

                  return Slidable(
                    key: ValueKey(currentContact.name),
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) async {
                            // 여기서 삭제 로직을 구현합니다.
                            _userList
                                .removeAt(index); // 해당 항목을 _userList에서 제거합니다.
                            await _saveContactInfoList(); // 변경된 _userList를 SharedPreferences에 저장합니다.
                            setState(() {}); // UI를 업데이트하기 위해 setState를 호출합니다.
                          },
                          backgroundColor: Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                        SlidableAction(
                          onPressed: (context) => doNothing(context),
                          backgroundColor: Color(0xFF26C100),
                          foregroundColor: Colors.white,
                          icon: Icons.edit,
                          label: 'Modify',
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: imageProvider,
                      ),
                      title: Text(currentContact.name),
                      subtitle: Text(currentContact.phoneNumber),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void doNothing(BuildContext context) {}

// 불러올 변수 초기화

class ContactInfo {
  String name;
  String phoneNumber;
  String imagePath;

  ContactInfo(
      {required this.name,
      required this.phoneNumber,
      this.imagePath = 'assets/images/basic.png'});

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phoneNumber,
        'imagePath': imagePath,
      };

  factory ContactInfo.fromJson(Map<String, dynamic> json) {
    return ContactInfo(
      name: json['name'],
      phoneNumber: json['phone'],
      imagePath: json['imagePath'] ?? 'assets/images/basic.png',
    );
  }
}
