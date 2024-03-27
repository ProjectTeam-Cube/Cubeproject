import 'package:cube/user/auth_service.dart';
import 'package:cube/user/log_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firstviewpage/main_screen.dart';
import 'onboarding_page/onboarding_page.dart';

// SharedPreferences 인스턴스를 어디서든 접근 가능 하도록 전역 변수로 선언
// 1 전역변수
late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //main함수에서 async 사용하기 위함
  await Firebase.initializeApp(); //firebase앱 시작

  // Shared_preferences 인스턴스 생성
  // 2 getInstance읽어와서 prefs 저장 -> 리스트
  prefs = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => AuthService()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SharedPreferences 에서 온보딩 완료 여부 조회
    // isOnboarded 해당하는 값에서 null을 반환하는 경우 false를 기본값으로 지정
    // 3 변수 선언,  isOnboarded 값
    // 파일 isOnboarded 있고, 변수 isOnboarded 있는 것 구분
    bool isOnboarded = prefs.getBool("isOnboarded") ?? false;
    // MyApp에서 유저 조회
    final user = context.read<AuthService>().currentUser();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // 홈 화면을 isOnboarded와 user의 상태에 따라 다르게 설정
      // isOnboarded ture(온보딩 완료):
      // ture
      // user가 null이면(user없으면): LoginPage()를 반환합니다.
      // user 로그인이면 : MainScreen()을 반환합니다.
      // false
      // isOnboarded false(온보딩 완료X): OnboardingScreen()을 반환
      //home: isOnboarded ? (user == null ? LoginPage() : MainScreen()) : OnboardingScreen(),
      home: isOnboarded ?  OnboardingScreen() :(user == null ? LoginPage() : MainScreen()),
    );
  }
}
