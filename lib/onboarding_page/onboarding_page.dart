import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';

import '../firstviewpage/main_screen.dart';
import '../main.dart';

class OnboardingScreen extends StatelessWidget {
  final List<Introduction> list = [
    Introduction(
      imageUrl: 'assets/images/on1.jpg',
      title: '부모님에게 전화',
      titleTextStyle: TextStyle(
        color: Color(0xFFFF6F0F),
          fontSize: 30,
      ),
      subTitle: '바쁘다는 핑계로 흘려보내고 있는 시간 당신이 가족과 함께 할 수 있는 시간은 생각보다 길지 않습니다.',
      subTitleTextStyle: TextStyle(
        color: Color(0xFF404040),
        fontSize: 20,
      ),
    ),
    Introduction(
      title: '약속된 업무 전화 깜빡',
      subTitle: '개발자 ‘인턴’이라도 시작해보겠다는 마음가짐(일은 직접 부딪혀가며 배우는게 최고의 습득 방법이므로)',
      imageUrl: 'assets/images/on2.png',
    ),
    Introduction(
      title: '10년 후의 나',
      subTitle: '2034 자랑스러운 여성벤처인 표창 김이랑',
      imageUrl: 'assets/images/on3.png',
    ),
    Introduction(
      title: '10년 후의 나',
      subTitle: '2034 자랑스러운 여성벤처인 표창 김이랑',
      imageUrl: 'assets/images/on4.png',
    ),
    Introduction(
      title: '10년 후의 나',
      subTitle: '2034 자랑스러운 여성벤처인 표창 김이랑',
      imageUrl: 'assets/images/on5.png',
    )
  ];

  //{'isOnboarded': true}
  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      // 마지막 페이지, skip 하면  isOnboarded를 true로 바꿔줌
      // 5 버튼을 클릭했을 때, 파일에 강제 저장 set
      introductionList: list,
      onTapSkipButton: () {
        prefs.setBool('isOnboarded', true);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(),
          ),
        );
      },
    );
  }
}
