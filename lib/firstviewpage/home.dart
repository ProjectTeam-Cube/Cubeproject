import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../appbarAndnavigatorbar/bottom_navigation_bar.dart';
import '../appbarAndnavigatorbar/bottom_navigation_bar_provider.dart';
import '../call/memory.dart';
import '../phone_number_add/phone_number_register.dart';
import '../phone_number_list/phone_book.dart';
import '../reservation/reservation_list_screen.dart';
import '../schedule/schedule.dart';

class HomeBanner extends StatefulWidget {
  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 2, bottom: 10.0),
              child: Container(
                height: 1.0,
                width: double.infinity,
                color: Colors.grey[300],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity, // 이미지의 너비를 꽉 차게 설정
                    height: 130.0, // 이미지의 높이
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage('assets/images/HomeBanner.jpg'),
                        fit: BoxFit.cover, // 이미지가 컨테이너 크기에 맞게 조정되도록 설정
                      ),
                    ),
                  ),
                  Positioned(
                    right: 24, // 우측 정렬
                    top: 10, // 하단 정렬
                    child: Padding(
                      padding: const EdgeInsets.all(10.0), // 텍스트의 패딩 설정
                      child: Text(
                        "부모님과의 대화를\n잊지는 않으셨나요?", // 원하는 텍스트 입력
                        style: TextStyle(
                          color: Colors.white, // 텍스트 색상을 하얀색으로 설정
                          fontSize: 16, // 텍스트 크기 설정
                          fontWeight: FontWeight.bold, // 텍스트 굵기 설정
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 20, left: 10, right: 10),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, // 컨테이너 사이에 공간 동일하게 배분
                children: [
                  Expanded(
                    // 첫 번째 컨테이너를 Expanded 위젯으로 감싼다.
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PhoneNumberRegister(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey[200], // 버튼 배경 색
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // 버튼 둥근 모서리
                        ),
                      ),
                      child: Container(
                        height: 105.0,
                        padding: EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 5.0),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topLeft, // 왼쪽 위 정렬
                              child: Text(
                                '번호 등록',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors
                                      .black, // TextButton의 기본 텍스트 색상을 덮어쓰기 위해 설정
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight, // 오른쪽 아래 정렬
                              child: Image.asset(
                                'assets/images/register.png', // 이미지 경로를 자신의 이미지 경로로 변경하세요.
                                width: 55, // 이미지의 너비
                                height: 55, // 이미지의 높이
                                fit: BoxFit.cover, // 이미지가 지정된 너비와 높이에 맞도록 조정
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20), // 두 컨테이너 사이의 공간
                  Expanded(
                    // 첫 번째 컨테이너를 Expanded 위젯으로 감싼다.
                    child: TextButton(
                      onPressed: () {
                        // Provider를 사용하여 현재 선택된 인덱스를 업데이트
                        final provider =
                            Provider.of<BottomNavigationBarProvider>(context,
                                listen: false);
                        provider.currentIndex =
                            1; // 예를 들어, RegistrationPage가 두 번째 탭에 있다고 가정

                        // 페이지 이동
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegistrationPage(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey[200], // 버튼 배경 색
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // 버튼 둥근 모서리
                        ),
                      ),
                      child: Container(
                        height: 105.0,
                        padding: EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 5.0),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topLeft, // 왼쪽 위 정렬
                              child: Text(
                                '전화번호 리스트',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors
                                      .black, // TextButton의 기본 텍스트 색상을 덮어쓰기 위해 설정
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight, // 오른쪽 아래 정렬
                              child: Image.asset(
                                'assets/images/phoneBook.png', // 이미지 경로를 자신의 이미지 경로로 변경하세요.
                                width: 55, // 이미지의 너비
                                height: 55, // 이미지의 높이
                                fit: BoxFit.cover, // 이미지가 지정된 너비와 높이에 맞도록 조정
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly, // 컨테이너 사이에 공간 동일하게 배분
                    children: [
                      Expanded(
                        // 첫 번째 컨테이너를 Expanded 위젯으로 감싼다.
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ReservationListScreen(reservations: []),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.grey[200], // 버튼 배경 색
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10.0), // 버튼 둥근 모서리
                            ),
                          ),
                          child: Container(
                            height: 105.0,
                            padding: EdgeInsets.symmetric(
                                vertical: 3.0, horizontal: 5.0),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft, // 왼쪽 위 정렬
                                  child: Text(
                                    '예약 리스트',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors
                                          .black, // TextButton의 기본 텍스트 색상을 덮어쓰기 위해 설정
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight, // 오른쪽 아래 정렬
                                  child: Image.asset(
                                    'assets/images/reservation.png', // 이미지 경로를 자신의 이미지 경로로 변경하세요.
                                    width: 55, // 이미지의 너비
                                    height: 55, // 이미지의 높이
                                    fit:
                                        BoxFit.cover, // 이미지가 지정된 너비와 높이에 맞도록 조정
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20), // 두 컨테이너 사이의 공간
                      Expanded(
                        // 첫 번째 컨테이너를 Expanded 위젯으로 감싼다.
                        child: TextButton(
                          onPressed: () {
                            // Provider를 사용하여 현재 선택된 인덱스를 업데이트
                            final provider =
                                Provider.of<BottomNavigationBarProvider>(
                                    context,
                                    listen: false);
                            provider.currentIndex =
                                4; // 예를 들어, RegistrationPage가 두 번째 탭에 있다고 가정

                            // 페이지 이동
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Schedule(),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.grey[200], // 버튼 배경 색
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10.0), // 버튼 둥근 모서리
                            ),
                          ),
                          child: Container(
                            height: 105.0,
                            padding: EdgeInsets.symmetric(
                                vertical: 3.0, horizontal: 5.0),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft, // 왼쪽 위 정렬
                                  child: Text(
                                    '스케쥴',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors
                                          .black, // TextButton의 기본 텍스트 색상을 덮어쓰기 위해 설정
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight, // 오른쪽 아래 정렬
                                  child: Image.asset(
                                    'assets/images/schedule.png', // 이미지 경로를 자신의 이미지 경로로 변경하세요.
                                    width: 55, // 이미지의 너비
                                    height: 55, // 이미지의 높이
                                    fit:
                                        BoxFit.cover, // 이미지가 지정된 너비와 높이에 맞도록 조정
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10), // 상단 박스와 하단 박스 사이의 공간
                  // 상단 박스와 동일한 구성의 박스를 추가
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // 첫 번째 컨테이너의 복사본
                      Expanded(
                        child: Container(
                            // 컨테이너 구성은 상단의 첫 번째 컨테이너와 동일
                            ),
                      ),
                      SizedBox(width: 20), // 두 컨테이너 사이의 공간
                      // 두 번째 컨테이너의 복사본
                      Expanded(
                        child: Container(
                            // 컨테이너 구성은 상단의 두 번째 컨테이너와 동일
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 1.0,
                width: double.infinity,
                color: Colors.grey[300],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 20),
              child: Row(children: <Widget>[
                Expanded(
                  child: Text(
                    '통화 메모를 기록해보세요 😍',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.edit, // 원하는 아이콘을 사용하세요
                    color: Colors.black, // 아이콘 색상 설정
                  ),
                  onPressed: () {
                    // 여기에 버튼을 눌렀을 때 실행될 코드를 작성하세요
                    // 예를 들어, 다른 화면으로 이동하고 싶다면 Navigator.push를 사용할 수 있습니다.
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Memory()),
                    );
                  },
                ),
              ]),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0), // 둥근 모서리의 반지름 설정
                    child: Image.asset(
                      'assets/images/a.jpg', // 이미지 경로
                      width: 130.0, // 이미지 너비
                      height: 90.0, // 이미지 높이
                      fit: BoxFit.cover, // 이미지를 채우는 방식
                    ),
                  ),
                  SizedBox(width: 10.0), // 이미지와 텍스트 사이의 간격
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // 텍스트를 왼쪽 정렬
                      children: <Widget>[
                        Text('퇴근하고 엄마 목소리 듣기!',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFFFF6F0F),
                                fontWeight: FontWeight.bold)),
                        Text('결혼하고 첫집에서 다음집으로 이사를 계획하면서 매매를 하게되었고..',
                            style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0), // 둥근 모서리의 반지름 설정
                    child: Image.asset(
                      'assets/images/b.jpg', // 이미지 경로
                      width: 130.0, // 이미지 너비
                      height: 90.0, // 이미지 높이
                      fit: BoxFit.cover, // 이미지를 채우는 방식
                    ),
                  ),
                  SizedBox(width: 10.0), // 이미지와 텍스트 사이의 간격
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // 텍스트를 왼쪽 정렬
                      children: <Widget>[
                        Text('할머니가 “열 부자가 안 부럽대요”',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFFFF6F0F),
                                fontWeight: FontWeight.bold)),
                        Text('결혼하고 첫집에서 다음집으로 이사를 계획하면서 매매를 하게되었고..',
                            style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
