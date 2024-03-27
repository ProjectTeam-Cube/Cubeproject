import 'package:cube/user/auth_service.dart';
import 'package:cube/user/log_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firstviewpage/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //main함수에서 async 사용하기 위함
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
    // MyApp에서 유저 조회
    final user = context.read<AuthService>().currentUser();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // user가 있는 경우 MainScreen으로 감, 아닌경우 로그인 페이지
      home: user == null ? LoginPage() : MainScreen(),
    );
  }
}
