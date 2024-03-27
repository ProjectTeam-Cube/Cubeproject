import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'main_screen_page.dart';
import '../reservation/reservation_screen.dart';

const List<TabItem> items = [
  TabItem(icon: Icons.home, title: '홈'),
  TabItem(icon: Icons.group, title: '번호 등록/조회'),
  TabItem(icon: Icons.app_registration, title: '예약등록'),
  TabItem(icon: Icons.bar_chart, title: '리포트'),
  TabItem(icon: Icons.calendar_month, title: '일정관리'),
];

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0; // 현재 선택된 탭의 인덱스

  final List<Widget> _pages = [
    HomePage(),
    RegistrationPage(),
    ReservationScreen(),
    ReportPage(),
    SchedulePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        // IndexedStack을 사용하여 페이지 상태를 유지합니다.
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: BottomBarFloating(
          // 여기서 BottomNavigationBar 스타일을 적용합니다.
          items: items,
          backgroundColor: Colors.white,
          color: Colors.grey,
          colorSelected: Colors.orange,
          indexSelected: _currentIndex,
          paddingVertical: 20,
          iconSize: 30,
          onTap: (index) {
            setState(() {
              _currentIndex = index; // 탭 선택 시 인덱스 업데이트
            });
          },
        ),
      ),
    );
  }
}
