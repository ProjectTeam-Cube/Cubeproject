import 'package:cube/report.dart';
import 'package:cube/schedule.dart';
import 'package:cube/search.dart';
import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';

import 'app_bar.dart';
import 'home.dart';
import 'main.dart';

// 각 탭에 대응하는 페이지 위젯들
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0), // AppBar의 높이를 조정
        child: AppBar(
          title: Padding(
            padding: EdgeInsets.only(top: 30.0), // 로고의 상단 패딩 조정
            child: Image.asset(
              'assets/images/logo.png',
              height: 100,
              width: 150,
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15.0), // 아이콘의 상단 패딩 조정
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.notifications,
                      size: 35,
                    ),
                    onPressed: () {
                      print('알림 아이콘 클릭됨');
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 14.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.search,
                        size: 35,
                      ),
                      onPressed: () {
                        print('검색 아이콘 클릭됨');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: HomeBanner(),
    );
  }
}

// class RegistrationPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Padding(
//         padding: const EdgeInsets.only(top: 30.0),
//         child: Scaffold(
//           appBar: BaseAppBar(), // 앱 바 설정
//           body: SingleChildScrollView(
//             // SingleChildScrollView를 사용하여 스크롤 가능하도록 설정
//             child: MyFormBody(), // 입력란이 포함된 컨테이너
//           ),
//         ),
//       ),
//     );
//   }
// }

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Scaffold(
          body: SearchbarAnimationExample(),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyFormBody()),
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
      ),
    );
  }
}

class ReservationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('예약 등록 페이지')),
    );
  }
}

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact Record',
      debugShowCheckedModeBanner: false,
      home: ContactRecordScreen(),
    );
  }
}

class SchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Scaffold(
        appBar: BaseAppBar(),
        body: TableEventsExample(),
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
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false, home: BottomNavigationBarApp()));
}
