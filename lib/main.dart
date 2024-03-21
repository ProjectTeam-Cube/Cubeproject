// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ReservationScreen(),
//     );
//   }
// }
//
// class ReservationInfo {
//   final DateTime dateTime;
//   final List<String> weekdays;
//
//   ReservationInfo({required this.dateTime, required this.weekdays});
// }
//
// class ReservationScreen extends StatefulWidget {
//   const ReservationScreen({Key? key}) : super(key: key);
//
//   @override
//   _ReservationScreenState createState() => _ReservationScreenState();
// }
//
// class _ReservationScreenState extends State<ReservationScreen> {
//   DateTime? selectedDate;
//   DateTime selectedTime = DateTime.now();
//   List<bool> selectedWeekdays = List.filled(7, false);
//   bool repeatNotification = false;
//   TextEditingController memoController = TextEditingController();
//   List<ReservationInfo> reservations = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "예약 설정",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: Colors.white,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "시간 선택:",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                 ),
//               ),
//               SizedBox(height: 8),
//               Center(
//                 child: TimePickerSpinner(
//                   alignment: Alignment.center,
//                   spacing: 10,
//                   itemHeight: 60,
//                   isForce2Digits: true,
//                   isShowSeconds: false,
//                   is24HourMode: false,
//                   onTimeChange: (time) {
//                     setState(() {
//                       selectedTime = time;
//                     });
//                   },
//                 ),
//               ),
//               SizedBox(height: 16),
//               Center(
//                 child: TextButton(
//                   onPressed: _selectDate,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.calendar_today),
//                       SizedBox(width: 8),
//                       Text(
//                         selectedDate != null
//                             ? "${selectedDate!.year}년 ${selectedDate!.month}월 ${selectedDate!.day}일"
//                             : "날짜 선택",
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       // Navigate to RepeatNotificationScreen
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => RepeatNotificationScreen(),
//                         ),
//                       );
//                     },
//                     child: Text(
//                       '반복 알림 설정:',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 8),
//                   CupertinoSwitch(
//                     value: repeatNotification,
//                     onChanged: (value) {
//                       setState(() {
//                         repeatNotification = value;
//                       });
//                     },
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   for (int i = 0; i < 7; i++)
//                     GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           selectedWeekdays[i] = !selectedWeekdays[i];
//                         });
//                       },
//                       child: Container(
//                         margin: EdgeInsets.symmetric(horizontal: 8),
//                         padding: EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                           color: selectedWeekdays[i]
//                               ? Colors.blue
//                               : Colors.transparent,
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: Text(
//                           _getWeekdayName(i),
//                           style: TextStyle(
//                             color: selectedWeekdays[i]
//                                 ? Colors.white
//                                 : Colors.black,
//                           ),
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//               SizedBox(height: 16),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     _completeReservation(context); // 수정
//                   },
//                   child: Text("예약 완료"),
//                 ),
//               ),
//               SizedBox(height: 16),
//               TextFormField(
//                 controller: memoController,
//                 decoration: InputDecoration(
//                   hintText: '간단한 메모', // 텍스트 필드 내에 표시될 힌트 텍스트
//                   border: OutlineInputBorder(),
//                   contentPadding:
//                       EdgeInsets.symmetric(vertical: 30), // 텍스트 필드 내부 패딩 조정
//                 ),
//               ),
//               SizedBox(height: 16),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   String _getWeekdayName(int index) {
//     switch (index) {
//       case 0:
//         return "일";
//       case 1:
//         return "월";
//       case 2:
//         return "화";
//       case 3:
//         return "수";
//       case 4:
//         return "목";
//       case 5:
//         return "금";
//       case 6:
//         return "토";
//       default:
//         return "";
//     }
//   }
//
//   Future<void> _selectDate() async {
//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2100),
//     );
//     if (pickedDate != null && pickedDate != selectedDate) {
//       setState(() {
//         selectedDate = pickedDate;
//       });
//     }
//   }
//
//   void _completeReservation(BuildContext context) {
//     // 수정
//     setState(() {
//       reservations.add(
//         ReservationInfo(
//           dateTime: DateTime(
//             selectedDate!.year,
//             selectedDate!.month,
//             selectedDate!.day,
//             selectedTime.hour,
//             selectedTime.minute,
//           ),
//           weekdays: selectedWeekdays
//               .asMap()
//               .entries
//               .where((entry) => entry.value)
//               .map((entry) => _getWeekdayName(entry.key))
//               .toList(),
//         ),
//       );
//     });
//
//     // 예약 완료 후 예약 조회 화면으로 이동
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ReservationListScreen(reservations: reservations),
//       ),
//     );
//   }
// }
//
// class ReservationListScreen extends StatefulWidget {
//   final List<ReservationInfo> reservations;
//
//   const ReservationListScreen({Key? key, required this.reservations})
//       : super(key: key);
//
//   @override
//   _ReservationListScreenState createState() => _ReservationListScreenState();
// }
//
// class _ReservationListScreenState extends State<ReservationListScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("예약 조회"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "예약 정보",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//               ),
//             ),
//             SizedBox(height: 16),
//             Expanded(
//               child: ListView.separated(
//                 itemCount: widget.reservations.length,
//                 separatorBuilder: (BuildContext context, int index) {
//                   return SizedBox(height: 16); // 아이템과 아이템 사이의 간격
//                 },
//                 itemBuilder: (BuildContext context, int index) {
//                   final reservation = widget.reservations[index];
//                   return Card(
//                     elevation: 3,
//                     margin: EdgeInsets.symmetric(vertical: 8),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "예약 일시:",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                           Text(
//                             "${reservation.dateTime.year}.${reservation.dateTime.month}.${reservation.dateTime.day} ${reservation.dateTime.hour}:${reservation.dateTime.minute}",
//                           ),
//                           SizedBox(height: 16),
//                           Text(
//                             "반복 요일:",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                           Text(
//                             reservation.weekdays.isNotEmpty
//                                 ? reservation.weekdays.join(", ")
//                                 : "반복 없음",
//                           ),
//                           SizedBox(height: 16),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               ElevatedButton(
//                                 onPressed: () {
//                                   _deleteReservation(index);
//                                 },
//                                 child: Text("삭제"),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _deleteReservation(int index) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("예약 삭제"),
//           content: Text("이 예약을 삭제하시겠습니까?"),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text("취소"),
//             ),
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   widget.reservations.removeAt(index);
//                 });
//                 Navigator.of(context).pop();
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text("예약이 삭제되었습니다."),
//                     duration: Duration(seconds: 2),
//                   ),
//                 );
//               },
//               child: Text("삭제"),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
// class RepeatNotificationScreen extends StatefulWidget {
//   @override
//   _RepeatNotificationScreenState createState() =>
//       _RepeatNotificationScreenState();
// }
//
// class _RepeatNotificationScreenState extends State<RepeatNotificationScreen> {
//   int selectedInterval = 5;
//   int selectedRepeat = 3;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("반복 알림 설정"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 16),
//             Text(
//               "알림 간격 선택:",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//               ),
//             ),
//             SizedBox(height: 8),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.grey[200],
//               ),
//               child: Column(
//                 children: [
//                   for (int interval in [5, 10, 15, 20, 30])
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 4),
//                       child: Row(
//                         children: [
//                           Radio<int>(
//                             value: interval,
//                             groupValue: selectedInterval,
//                             onChanged: (value) {
//                               setState(() {
//                                 selectedInterval = value!;
//                               });
//                             },
//                           ),
//                           SizedBox(width: 8),
//                           Text("$interval분"),
//                         ],
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 16),
//             Text(
//               "반복 횟수 선택:",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//               ),
//             ),
//             SizedBox(height: 8),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.grey[200],
//               ),
//               child: Column(
//                 children: [
//                   for (int repeat in [3, 5, 10])
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 4),
//                       child: Row(
//                         children: [
//                           Radio<int>(
//                             value: repeat,
//                             groupValue: selectedRepeat,
//                             onChanged: (value) {
//                               setState(() {
//                                 selectedRepeat = value!;
//                               });
//                             },
//                           ),
//                           SizedBox(width: 8),
//                           Text("$repeat회"),
//                         ],
//                       ),
//                     ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 4),
//                     child: Row(
//                       children: [
//                         Radio<int>(
//                           value: -1, // Use a unique value for "Continuously"
//                           groupValue: selectedRepeat,
//                           onChanged: (value) {
//                             setState(() {
//                               selectedRepeat = value!;
//                             });
//                           },
//                         ),
//                         SizedBox(width: 8),
//                         Text("계속 반복"),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 16),
//           ],
//         ),
//       ),
//     );
//   }
// }

// main.dart

import 'package:flutter/material.dart';
import 'reservation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ReservationScreen(),
    );
  }
}
