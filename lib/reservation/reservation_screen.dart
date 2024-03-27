import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import '../phone_number_list/phone_number_list.dart';
import 'repeat_notification_screen.dart';
import 'reservation_info.dart';
import 'reservation_list_screen.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  DateTime? selectedDate;
  DateTime selectedTime = DateTime.now();
  List<bool> selectedWeekdays = List.filled(7, false);
  bool repeatNotification = false;
  TextEditingController memoController = TextEditingController();
  List<ReservationInfo> reservations = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '예약 등록',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF393939)),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // 하단 선의 높이 설정
          child: Divider(
            height: 0.5, // 선의 높이 설정
            color: Color(0xFFe1e1e1), // 선의 색상 설정
          ),
        ),
        actions: <Widget>[
          // 우측 끝에 아이콘 버튼 추가
          IconButton(
            icon: Icon(
              Icons.search,
              color: Color(0xFF393939),
            ), // 첫 번째 아이콘
            onPressed: () {
              // 첫 번째 아이콘 버튼의 동작 정의
              print('검색 버튼이 클릭되었습니다.');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Color(0xFF393939),
            ), // 두 번째 아이콘
            onPressed: () {
              // 두 번째 아이콘 버튼의 동작 정의
              print('더보기 버튼이 클릭되었습니다.');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min, // 필요한 만큼의 공간만 사용
                  children: <Widget>[
                    Icon(
                      Icons.access_time, // 원하는 아이콘 선택
                      color: Color(0xFF26C100),
                    ),
                    SizedBox(width: 8.0), // 아이콘과 텍스트 사이의 간격 조절
                    Text(
                      "시간 선택",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Center(
                child: TimePickerSpinner(
                  alignment: Alignment.center,
                  spacing: 10,
                  itemHeight: 60,
                  isForce2Digits: true,
                  isShowSeconds: false,
                  is24HourMode: false,
                  onTimeChange: (time) {
                    setState(() {
                      selectedTime = time;
                    });
                  },
                ),
              ),
              Divider(
                height: 1, // 선의 높이 설정
                color: Colors.grey[300], // 선의 색상 설정
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min, // 필요한 만큼의 공간만 사용
                  children: <Widget>[
                    Icon(
                      Icons.calendar_month, // 원하는 아이콘 선택
                      color: Color(0xFF26C100),
                    ),
                    SizedBox(width: 10.0), // 아이콘과 텍스트 사이의 간격 조절
                    Text(
                      "요일 선택",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 7; i++)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedWeekdays[i] = !selectedWeekdays[i];
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: selectedWeekdays[i]
                              ? Colors.blue
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          _getWeekdayName(i),
                          style: TextStyle(
                            color: selectedWeekdays[i]
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 16),
              Divider(
                height: 1, // 선의 높이 설정
                color: Colors.grey[300], // 선의 색상 설정
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: _selectDate,
                child: Row(
                  children: [
                    Icon(
                      Icons.event,
                      color: Color(0xFF26C100),
                    ),
                    SizedBox(width: 10),
                    Text(
                      selectedDate != null
                          ? "날짜 선택 : ${selectedDate!.year}년 ${selectedDate!.month}월 ${selectedDate!.day}일"
                          : "특정일 지정",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black87),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Divider(
                height: 1, // 선의 높이 설정
                color: Colors.grey[300], // 선의 색상 설정
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      // 연락처 불러오기 기능 구현
                      // 여기에 연락처 불러오기 기능을 구현합니다.
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PhoneNumberList()));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // 필요한 만큼의 공간만 사용
                      children: <Widget>[
                        Icon(
                          Icons.auto_stories, // 원하는 아이콘 선택
                          color: Color(0xFF26C100), // 아이콘 크기 조절
                        ),
                        SizedBox(width: 10.0), // 아이콘과 텍스트 사이의 간격 조절
                        Text(
                          "연락처 불러오기",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Divider(
                height: 1, // 선의 높이 설정
                color: Colors.grey[300], // 선의 색상 설정
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigate to RepeatNotificationScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RepeatNotificationScreen(),
                        ),
                      );
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.alarm, // 원하는 아이콘 선택
                          color: Color(0xFF26C100), // 아이콘 크기 조절
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          '반복 알림 설정',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 140),
                  CupertinoSwitch(
                    value: repeatNotification,
                    onChanged: (value) {
                      setState(() {
                        repeatNotification = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: memoController,
                decoration: InputDecoration(
                  hintText: '간단한 메모', // 텍스트 필드 내에 표시될 힌트 텍스트
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 30), // 텍스트 필드 내부 패딩 조정
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, // 버튼 사이에 공간을 균등하게 배분
                children: <Widget>[
                  SizedBox(
                    width: 165,
                    height: 55,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        // backgroundColor: MaterialStateProperty.all(Colors.white), // 버튼 배경색을 하얀색으로 설정
                        // foregroundColor: MaterialStateProperty.all(Colors.black), // 버튼 텍스트 색상을 검은색으로 설정
                        foregroundColor: MaterialStateProperty.all(
                            Colors.black), // 버튼 텍스트 색상을 검은색으로 설정
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // 살짝 각진 모서리를 위해 설정
                          ),
                        ),
                      ),
                      child: Text(
                        "취소하기",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 165, // 화면 너비의 50%에서 조금 빼서 버튼 사이에 공간을 만듦
                    height: 55,
                    child: ElevatedButton(
                      child: Text(
                        "등록하기",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFF6F0F), // 버튼 배경색을 설정
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10), // 살짝 각진 모서리를 위해 설정
                        ),
                      ),
                      onPressed: () {
                        _completeReservation(context); // 수정
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getWeekdayName(int index) {
    switch (index) {
      case 0:
        return "일";
      case 1:
        return "월";
      case 2:
        return "화";
      case 3:
        return "수";
      case 4:
        return "목";
      case 5:
        return "금";
      case 6:
        return "토";
      default:
        return "";
    }
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void _completeReservation(BuildContext context) {
    if (selectedDate != null && selectedWeekdays.every((element) => !element)) {
      // 날짜만 선택한 경우
      setState(() {
        reservations.add(
          ReservationInfo(
            dateTime: DateTime(
              selectedDate!.year,
              selectedDate!.month,
              selectedDate!.day,
              selectedTime.hour,
              selectedTime.minute,
            ),
            weekdays: [],
            memo: memoController.text,
          ),
        );
      });

      // 예약 완료 후 예약 조회 화면으로 이동
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ReservationListScreen(reservations: reservations),
        ),
      );
    } else if (selectedWeekdays.any((element) => element) &&
        selectedDate == null) {
      // 요일만 선택한 경우
      setState(() {
        reservations.add(
          ReservationInfo(
            dateTime: DateTime.now(),
            weekdays: selectedWeekdays
                .asMap()
                .entries
                .where((entry) => entry.value)
                .map((entry) => _getWeekdayName(entry.key))
                .toList(),
            memo: memoController.text,
          ),
        );
      });

      // 예약 완료 후 예약 조회 화면으로 이동
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ReservationListScreen(reservations: reservations),
        ),
      );
    } else {
      // 날짜와 요일 모두 선택한 경우 (잘못된 경우)
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("예약 설정 오류"),
            content: Text("날짜와 요일을 모두 선택할 수 없습니다."),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("확인"),
              ),
            ],
          );
        },
      );
    }
  }
}
