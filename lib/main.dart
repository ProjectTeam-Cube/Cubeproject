import 'package:cube/Login.dart';
import 'package:cube/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MyFormBody.dart';
import 'app_bar.dart';
import 'bottom_navigation_bar.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized(); //main함수에서 async 사용하기 위함
  await Firebase.initializeApp(); //firebase앱 시작

  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => AuthService()),
          ],
          child: const MyApp()
      ),
  );
}
// Provider를 통한 authService 사용
// authService 전역 변수
//final AuthService authService = AuthService();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MyApp에서 유저 조회
    final user = context.read<AuthService>().currentUser();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: BaseAppBar(), // 앱 바 설정
        // user가 있는 경우 home으로 감, 아닌경우 로그인 페이지
        body: user == null? LoginPage() : SingleChildScrollView(
          // SingleChildScrollView를 사용하여 스크롤 가능하도록 설정
          child: MyFormBody(), // 입력란이 포함된 컨테이너
        ),
          bottomNavigationBar: BottomNavigationBarApp(),
      ),
    );
  }
}
