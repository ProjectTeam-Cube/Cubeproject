import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../alarm/aplication_alarm.dart';
import '../call/modal_dialog.dart';
import '../call/modal_start.dart';
import '../user/auth_service.dart';
import 'home.dart';
import '../phone_number_list/phone_book.dart';
import '../report/report.dart';
import '../schedule/schedule.dart';
import 'package:cube/user/log_in.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  @override
  void initState() {
    super.initState();
    // FirebaseAuth의 상태 변경을 리스닝합니다.
    _auth.authStateChanges().listen((User? user) {
      setState(() {
        _user = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/images/logo.png',
            height: 100,
            width: 155,
          ),
          actions: <Widget>[
            // 사용자가 로그인되지 않았다면 로그인 버튼을 표시합니다.
            if (_user == null)
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginPage()), // LoginPage로 이동합니다.
                  );
                },
                child: Text(
                  '로그인',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ModalReservation()),
                );
                print('알람 아이콘 클릭됨');
              },
              child: Container(
                color: Colors.transparent, // 터치 영역을 시각화하기 위해 임시 색상을 추가할 수 있습니다.
                padding:
                    EdgeInsets.symmetric(horizontal: 3.0), // 원하는 간격을 조절합니다.
                child: Icon(
                  Icons.notifications,
                  size: 20,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                //로그아웃 버튼 눌렀을 때 로그인 페이지로 이동
                context.read<AuthService>().signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Container(
                color: Colors.transparent, // 터치 영역을 시각화하기 위해 임시 색상을 추가할 수 있습니다.
                padding:
                    EdgeInsets.symmetric(horizontal: 14.0), // 원하는 간격을 조절합니다.
                child: Icon(
                  Icons.logout,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
        body: HomeBanner(),
      ),
    );
  }
}

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PhoneBook(),
      ),
    );
  }
}

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact Record',
      debugShowCheckedModeBanner: false,
      home: Report(),
    );
  }
}

class SchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '일정 관리',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF393939)),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // 하단 선의 높이 설정
          child: Divider(
            height: 0.5, // 선의 높이 설정
            color: Color(0xFFe1e1e1), // 선의 색상 설정
          ),
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
      body: Schedule(),
    );
  }
}
