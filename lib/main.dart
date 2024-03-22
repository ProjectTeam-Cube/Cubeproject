import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MyFormBody.dart';
import 'app_bar.dart';
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
        appBar: BaseAppBar(), // 앱 바 설정
        body: SingleChildScrollView(
          // SingleChildScrollView를 사용하여 스크롤 가능하도록 설정
          child: MyFormBody(), // 입력란이 포함된 컨테이너
        ),
        bottomNavigationBar: BottomNavigationBarApp(),
      ),
    );
  }
}
