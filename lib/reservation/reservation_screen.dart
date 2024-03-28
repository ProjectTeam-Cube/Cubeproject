import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'repeat_notification_screen.dart';
import 'reservation_info.dart';
import 'reservation_list_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  void initState() {
    super.initState();
    _loadReservations();
  }

  Future<void> _loadReservations() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonReservations = prefs.getString('reservations');
    if (jsonReservations != null) {
      List<dynamic> decoded = jsonDecode(jsonReservations);
      setState(() {
        reservations = decoded.map((e) => ReservationInfo.fromJson(e)).toList();
      });
    } else {
      setState(() {
        reservations = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "예약 설정",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "시간 선택:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
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
              SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: _selectDate,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.calendar_today),
                      SizedBox(width: 8),
                      Text(
                        selectedDate != null
                            ? "${selectedDate!.year}년 ${selectedDate!.month}월 ${selectedDate!.day}일"
                            : "날짜 선택",
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      // 연락처 불러오기 기능 구현
                      // 여기에 연락처 불러오기 기능을 구현합니다.
                    },
                    child: Text(
                      '연락처 불러오기',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black, // 원하는 색상으로 설정하세요.
                      ),
                    ),
                  ),
                ],
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
                    child: Text(
                      '반복 알림 설정:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
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
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _completeReservation(context); // 수정
                  },
                  child: Text("예약 완료"),
                ),
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
              SizedBox(height: 16),
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

  void _completeReservation(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
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

      // SharedPreferences에 저장
      await prefs.setString('reservations', jsonEncode(reservations));

      // 예약 완료 후 예약 조회 화면으로 이동
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ReservationListScreen(),
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

      // SharedPreferences에 저장
      await prefs.setString('reservations', jsonEncode(reservations));

      // 예약 완료 후 예약 조회 화면으로 이동
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ReservationListScreen(),
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
