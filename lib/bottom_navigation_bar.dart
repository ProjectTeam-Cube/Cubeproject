import 'package:cube/schedule.dart';
import 'package:cube/search.dart';
import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';

import 'app_bar.dart';
import 'MyFormBody.dart';
import 'Login.dart';
import 'Agreement.dart';
import 'SignUp.dart';
import 'SignUp_finish.dart';

// 각 탭에 대응하는 페이지 위젯들
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //Text('로그인'),
          //SizedBox(height: 20), // 버튼과 텍스트 사이의 간격을 조금 두겠습니다.
          ElevatedButton(
            onPressed: () {
              // 로그인 버튼이 누르면 LoginPage로 이동
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginPage()), // LoginPage로 이동합니다.
              );
            },
            child: Text('로그인'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                //버튼 기능
                // 회원가입 버튼 누르면 SignUp 페이지로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Agreement()),
                );
              },
              child: Text('이용약관'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SingUp()),
              );
            },
            child: Text('회원가입'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SingUp_finish()),
              );
            },
            child: Text('회원가입 완료'),
          ),
        ],
      ),
    );
  }
}

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Scaffold(
          appBar: BaseAppBar(), // 앱 바 설정
          body: SingleChildScrollView(
            // SingleChildScrollView를 사용하여 스크롤 가능하도록 설정
            child: MyFormBody(), // 입력란이 포함된 컨테이너
          ),
        ),
      ),
    );
  }
}

class ReservationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Scaffold(
        appBar: BaseAppBar(),
        body: SearchbarAnimationExample(),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('리포트'));
  }
}

class SchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Scaffold(
        appBar: BaseAppBar(),
        body: CalendarScreen(),
      ),
    );
  }
}

const List<TabItem> items = [
  TabItem(icon: Icons.home, title: '홈'),
  TabItem(icon: Icons.group, title: '번호 등록/조회'),
  TabItem(icon: Icons.app_registration, title: '예약등록'),
  TabItem(icon: Icons.bar_chart, title: '리포트'),
  TabItem(icon: Icons.calendar_month, title: '일정관리'),
];

class BottomNavigationBarApp extends StatefulWidget {
  const BottomNavigationBarApp({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarAppState createState() => _BottomNavigationBarAppState();
}

class _BottomNavigationBarAppState extends State<BottomNavigationBarApp> {
  int visit = 0; // 현재 선택된 탭의 인덱스

  // 각 탭에 대응하는 페이지 위젯
  final List<Widget> pages = [
    HomePage(),
    RegistrationPage(),
    ReservationPage(),
    ReportPage(),
    SchedulePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[visit], // 현재 선택된 탭에 맞는 페이지를 표시
      bottomNavigationBar: BottomBarFloating(
        items: items,
        backgroundColor: Colors.white,
        color: Colors.grey,
        colorSelected: Colors.orange,
        indexSelected: visit,
        paddingVertical: 20,
        iconSize: 30,
        onTap: (int index) {
          setState(() {
            visit = index; // 탭을 선택할 때마다 인덱스 업데이트
          });
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: BottomNavigationBarApp()));
}
