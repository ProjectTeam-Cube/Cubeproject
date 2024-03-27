import 'package:cube/Login.dart';
import 'package:cube/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MyFormBody.dart';
import 'app_bar.dart';
import 'bottom_navigation_bar.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //main함수에서 async 사용하기 위함
  await Firebase.initializeApp(); //firebase앱 시작

  // 스플래시 화면의 시작부분에 widgetBinding 을 설정 함으로써,
  // 언제 스플래시 화면을 끌지 Controll 할수 있다
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // 스플래시 화면 보여줘라. (preserve)
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding); //splash

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
      ],
      child: const MyApp(),
    ),
  );

  // runApp() 함수 호출 이후에 스플래시 화면을 제거
  FlutterNativeSplash.remove();
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
