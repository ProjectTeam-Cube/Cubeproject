import 'package:cube/user/auth_service.dart';
import 'package:cube/user/log_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firstviewpage/main_screen.dart';
import 'onboarding/onboarding.dart';

late SharedPreferences prefs;

void main() async {
  //Shared_preferences 인스턴스 생성
  WidgetsFlutterBinding.ensureInitialized(); //main함수에서 async 사용하기 위함

  prefs = await SharedPreferences.getInstance();

  await Firebase.initializeApp(); //firebase앱 시작

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
    bool isOnboarded = prefs.getBool("isOnboarded") ?? false;

    // MyApp에서 유저 조회
    final user = context.read<AuthService>().currentUser();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // user가 있는 경우 MainScreen으로 감, 아닌경우 로그인 페이지
      // home: user == null ? LoginPage() : MainScreen(),
      home: isOnboarded
          ? (user == null ? LoginPage() : MainScreen())
          : IntroScreenDefault(),
    );
  }
}
