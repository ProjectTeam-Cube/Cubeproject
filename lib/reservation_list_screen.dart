import 'package:flutter/material.dart';
import 'reservation_info.dart';

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
