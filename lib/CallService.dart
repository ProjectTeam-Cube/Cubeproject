// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const CallService());
// }
//
// class CallService extends StatelessWidget {
//   const CallService({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Row(
//             children: [
//               CircleAvatar(
//                 radius: 20, // 원의 반지름 설정
//                 backgroundImage: AssetImage('assets/images/짱구.png'),
//               ),
//               SizedBox(width: 8),
//               Text('이강권 010-xxxx-xxxx'),
//             ],
//           ),
//         ),
//         body: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(2.0),
//               child: Text(
//                 '연결 중...',
//                 style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Padding(padding: const EdgeInsets.all(0)),
//             Container(
//               height: 2,
//               color: Colors.grey,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(150.0),
//               child: Icon(
//                 Icons.phone,
//                 size: 100,
//                 color: Colors.green,
//               ),
//             ),
//             Padding(padding: const EdgeInsets.all(0)),
//             Container(
//               height: 2,
//               color: Colors.grey,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
