import 'package:cube/reservation/reservation_screen.dart';
import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:provider/provider.dart';
import '../firstviewpage/home.dart';
import '../phone_number_list/phone_book.dart';
import '../report/report.dart';
import '../schedule/schedule.dart';
import 'package:cube/user/log_in.dart';
import 'app_bar.dart';
import 'bottom_navigation_bar_provider.dart';

// 각 탭에 대응하는 페이지 위젯들
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomeBanner(),
//     );
//   }
// }

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Scaffold(
          appBar: AppBar(
            title: Image.asset(
              'assets/images/logo.png',
              height: 100,
              width: 155,
            ),
            actions: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min, // 여기를 추가합니다.
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LoginPage()), // LoginPage로 이동합니다.
                      );
                    },
                    child: Text(
                      '로그인',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.notifications,
                      size: 20,
                    ),
                    onPressed: () {
                      print('알람 아이콘 클릭됨');
                    },
                    padding: EdgeInsets.zero, // 아이콘의 패딩을 제거합니다.
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.logout,
                      size: 20,
                    ),
                    onPressed: () {
                      print('로그아웃 아이콘 클릭됨');
                    },
                    padding: EdgeInsets.zero, // 아이콘의 패딩을 제거합니다.
                  ),
                ],
              ),
            ],
          ), // 앱 바 설정
          body: HomeBanner(),
        ),
      ),
    );
  }
}

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Scaffold(
          body: PhoneBook(),
        ),
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
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Scaffold(
        appBar: BaseAppBar(),
        body: Schedule(),
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
  // 페이지를 관리하는 Navigator 키
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    // Provider를 통해 현재 선택된 탭의 인덱스를 가져옵니다.
    final bottomNavigationBarProvider =
        Provider.of<BottomNavigationBarProvider>(context);

    return Scaffold(
      body: Navigator(
        key: navigatorKey,
        onGenerateRoute: (settings) {
          // Provider에서 가져온 인덱스를 사용하여 현재 페이지를 결정합니다.
          return MaterialPageRoute(
              builder: (context) =>
                  pages[bottomNavigationBarProvider.currentIndex]);
        },
      ),
      bottomNavigationBar: BottomBarFloating(
        items: items,
        backgroundColor: Colors.white,
        color: Colors.grey,
        colorSelected: Colors.orange,
        indexSelected: bottomNavigationBarProvider
            .currentIndex, // Provider를 통해 인덱스를 가져옵니다.
        paddingVertical: 20,
        iconSize: 30,
        onTap: (int index) {
          // 탭을 선택할 때 Provider를 통해 상태를 업데이트합니다.
          bottomNavigationBarProvider.currentIndex = index;
        },
      ),
    );
  }
}

final List<Widget> pages = [
  HomePage(),
  RegistrationPage(),
  ReservationScreen(),
  ReportPage(),
  SchedulePage(),
];
