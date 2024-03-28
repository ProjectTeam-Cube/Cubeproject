import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:intro_slider/intro_slider.dart';

import '../firstviewpage/main_screen.dart';
import '../main.dart';

class IntroScreenDefault extends StatefulWidget {
  @override
  IntroScreenDefaultState createState() => IntroScreenDefaultState();
}

class IntroScreenDefaultState extends State<IntroScreenDefault> {
  List<ContentConfig> listContentConfig = [];

  @override
  void initState() {
    super.initState();

    listContentConfig.add(
      ContentConfig(
          widgetTitle: Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // 기본 색상
                ),
                children: <TextSpan>[
                  TextSpan(text: "부모님에게 \n"),
                  TextSpan(
                    text: "전화",
                    style: TextStyle(color: Color(0xffFF6F0F)),
                  ),
                  TextSpan(text: " 자주하시나요?"),
                ],
              ),
            ),
          ),
          widgetDescription: Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black, // 기본 색상
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "바쁘다는 핑계로 흘려보내고  있는 시간 \n",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: " 당신이 가족과 함께 할 수 있는 시간은 \n 생각보다 길지 않습니다.",
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          pathImage: "assets/images/onboarding.jpg",
          backgroundColor: Color(0xffffffff),
          widthImage: 410,
          heightImage: 350),
    );
    listContentConfig.add(
      ContentConfig(
          widgetTitle: Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // 기본 색상
                ),
                children: <TextSpan>[
                  TextSpan(text: "약속된"),
                  TextSpan(
                    text: " 업무 전화 \n",
                    style: TextStyle(color: Color(0xffFF6F0F)),
                  ),
                  TextSpan(text: "깜빡 하신적 있나요?"),
                ],
              ),
            ),
          ),
          widgetDescription: Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black, // 기본 색상
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "업무의 절반은 전화... \n",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: " 약속된 시간을 저장해 놨는데 \n 또 시간을 지나서야 전화를 걸었다.",
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          pathImage: "assets/images/onboarding2.png",
          backgroundColor: Color(0xffffffff),
          widthImage: 410,
          heightImage: 350),
    );
    listContentConfig.add(
      ContentConfig(
          widgetDescription: Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black, // 기본 색상
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "여보세요 ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xffFF6F0F)),
                  ),
                  TextSpan(
                    text: "통합적인 ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "전화 관리",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xffFF6F0F)),
                  ),
                  TextSpan(
                    text: "할수 있습니다.\n",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: " 부모님과의 전화, 업무 약속 전화 \n 저장한 때에 맞춰 전화를 겁니다.",
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          pathImage: "assets/images/onboarding3.png",
          backgroundColor: Color(0xffffffff),
          widthImage: 410,
          heightImage: 400),
    );
    listContentConfig.add(
      ContentConfig(
          widgetDescription: Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black, // 기본 색상
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "전화예약 ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xffFF6F0F)),
                  ),
                  TextSpan(
                    text: "하고, 예약 시간에 전화가 걸립니다.\n",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "전화를 예약해서 관리할 있고 \n전화하기 1분 전에 알람이 옵니다.",
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          pathImage: "assets/images/onboarding4.png",
          backgroundColor: Color(0xffffffff),
          widthImage: 410,
          heightImage: 400),
    );
    listContentConfig.add(
      ContentConfig(
          widgetDescription: Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black, // 기본 색상
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "전화 성공, 실패",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xffFF6F0F)),
                  ),
                  TextSpan(
                    text: "를 한눈에 볼 수 있습니다.\n",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "전화 성공, 실패여부 리포트로 제공해\n스케쥴을 한눈에 파악 할 수 있습니다.",
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          pathImage: "assets/images/onboarding5.png",
          backgroundColor: Color(0xffffffff),
          widthImage: 410,
          heightImage: 400),
    );
  }

  void onDonePress() {
    //prefs.setBool('isOnboarded', true);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MainScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      key: UniqueKey(),
      renderSkipBtn: renderSkipBtn(),
      renderNextBtn: renderNextBtn(),
      renderDoneBtn: renderDoneBtn(),
      listContentConfig: listContentConfig,
      onDonePress: onDonePress,
    );
  }
}

Widget renderSkipBtn() {
  return Text(
    'skip',
    style: TextStyle(fontSize: 18, color: Color(0xffFF6F0F)),
  );
}

Widget renderNextBtn() {
  return Text(
    'next',
    style: TextStyle(fontSize: 18, color: Color(0xffFF6F0F)),
  );
}

Widget renderDoneBtn() {
  return Text(
    'Done',
    style: TextStyle(fontSize: 18, color: Color(0xffFF6F0F)),
  );
}
