// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Contact Record',
//       home: ContactRecordScreen(),
//     );
//   }
// }
//
// class ContactRecordScreen extends StatelessWidget {
//   final List<ContactRecord> contacts = [
//     ContactRecord(
//         name: '이은재', call: '통화성공', time: '10:00 AM', phonenum: '010-0000-0000'),
//     ContactRecord(
//         name: '김이랑', call: '통화성공', time: '11:30 AM', phonenum: '010-0000-0000'),
//     ContactRecord(
//         name: '배정현', call: '통화실패', time: '2:15 PM', phonenum: '010-0000-0000'),
//     // Add more contact records as needed
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Report',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(bottom: 80),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 20),
//                 child: Row(
//                   children: [
//                     Icon(Icons.account_circle_rounded),
//                     Text(
//                       '   이강권님',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 25, left: 10, right: 10),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.orange[100],
//                   borderRadius:
//                   BorderRadius.circular(10.0), // 틀의 모퉁이를 10.0으로 설정
//                 ),
//                 padding: EdgeInsets.symmetric(vertical: 35.0, horizontal: 17.0),
//                 child: Row(
//                   children: [
//                     Text(
//                       '리포트                                              ',
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.deepOrange,
//                           fontSize: 20),
//                     ),
//                     Icon(
//                       Icons.ac_unit,
//                       size: 50,
//                       color: Colors.deepOrange,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.green[100],
//                       borderRadius:
//                       BorderRadius.circular(10.0), // 틀의 모퉁이를 10.0으로 설정
//                     ),
//                     padding: EdgeInsets.symmetric(
//                         vertical: 45.0, horizontal: 17.0), // 상하좌우 여백을 조절
//                     child: Text(
//                       '등록 건수  \n\n    20건',
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                           color: Colors.green),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.blue[100],
//                       borderRadius:
//                       BorderRadius.circular(10.0), // 틀의 모퉁이를 10.0으로 설정
//                     ),
//                     padding: EdgeInsets.symmetric(
//                         vertical: 45.0, horizontal: 17.0), // 상하좌우 여백을 조절
//                     child: Text(
//                       '통화 건수 \n\n    16건',
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                           color: Colors.blue),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.red[100],
//                       borderRadius:
//                       BorderRadius.circular(10.0), // 틀의 모퉁이를 10.0으로 설정
//                     ),
//                     padding: EdgeInsets.symmetric(
//                         vertical: 45.0, horizontal: 17.0), // 상하좌우 여백을 조절
//                     child: Text(
//                       '미룬 건수 \n\n     4건',
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                           color: Colors.red),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 25),
//                 child: ListView.builder(
//                   itemCount: contacts.length,
//                   itemBuilder: (context, index) {
//                     return Column(
//                       children: [
//                         Container(
//                           width: MediaQuery.of(context).size.width * 0.9,
//                           decoration: BoxDecoration(
//                             color: Colors.grey[300],
//                             borderRadius: BorderRadius.circular(
//                                 10.0), // 틀의 모퉁이를 10.0으로 설정
//                           ),
//                           child: ListTile(
//                             title: Row(
//                               children: [
//                                 Icon(Icons.person), // 아이콘 추가
//                                 SizedBox(width: 8), // 아이콘과 텍스트 사이에 간격 추가
//                                 Text(
//                                   '     ${contacts[index].name}        ',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Icon(Icons.phone),
//                                 Text(
//                                   '    ${contacts[index].phonenum}',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 )
//                               ],
//                             ),
//                             subtitle: Padding(
//                               padding: const EdgeInsets.only(top: 8),
//                               child: Row(
//                                 children: [
//                                   Icon(Icons.check_box),
//                                   if (contacts[index].call == "통화성공")
//                                     Text(
//                                       '       ${contacts[index].call}         ',
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.blue),
//                                     ),
//                                   if (contacts[index].call == "통화실패")
//                                     Text(
//                                       '       ${contacts[index].call}         ',
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.red),
//                                     ),
//                                   Icon(Icons.timelapse),
//                                   Text(
//                                     '   Contacted at ${contacts[index].time}',
//                                     style:
//                                     TextStyle(fontWeight: FontWeight.bold),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             onTap: () {},
//                           ),
//                         ),
//                         if (index !=
//                             contacts.length - 1) // 마지막 항목이 아닌 경우에만 공간 추가
//                           SizedBox(height: 15.0),
//                       ],
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ContactRecord {
//   final String name;
//   final String time;
//   final String call;
//   final String phonenum;
//
//   ContactRecord(
//       {required this.name,
//         required this.time,
//         required this.call,
//         required this.phonenum});
// }
