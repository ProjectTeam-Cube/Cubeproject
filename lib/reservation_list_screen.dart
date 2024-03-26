// main.dart 실행 시 호출

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'repeat_notification_screen.dart';
import 'reservation_info.dart';

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

class ReservationListScreen extends StatefulWidget {
  final List<ReservationInfo> reservations;

  const ReservationListScreen({Key? key, required this.reservations})
      : super(key: key);

  @override
  _ReservationListScreenState createState() => _ReservationListScreenState();
}

class _ReservationListScreenState extends State<ReservationListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("예약 조회"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "예약 정보",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: widget.reservations.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 16); // 아이템과 아이템 사이의 간격
                },
                itemBuilder: (BuildContext context, int index) {
                  final reservation = widget.reservations[index];
                  return Card(
                    elevation: 3,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "예약 일시:",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "${reservation.dateTime.year}.${reservation.dateTime.month}.${reservation.dateTime.day} ${_formatTime(reservation.dateTime.hour)}:${_formatTime(reservation.dateTime.minute)}",
                          ),
                          SizedBox(height: 16),
                          Text(
                            "반복 요일:",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            reservation.weekdays.isNotEmpty
                                ? reservation.weekdays.join(", ")
                                : "없음",
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  _deleteReservation(index);
                                },
                                child: Text("삭제"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _deleteReservation(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("예약 삭제"),
          content: Text("이 예약을 삭제하시겠습니까?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("취소"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  widget.reservations.removeAt(index);
                });
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("예약이 삭제되었습니다."),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Text("삭제"),
            ),
          ],
        );
      },
    );
  }

  String _formatTime(int time) {
    return time < 10 ? '0$time' : '$time';
  }
}
