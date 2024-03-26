// 반복 알림 설정 클릭 시 이동되는 페이지

import 'package:flutter/material.dart';

class RepeatNotificationScreen extends StatefulWidget {
  @override
  _RepeatNotificationScreenState createState() =>
      _RepeatNotificationScreenState();
}

class _RepeatNotificationScreenState extends State<RepeatNotificationScreen> {
  int selectedInterval = 5;
  int selectedRepeat = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("반복 알림 설정"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              "알림 간격 선택:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: Column(
                children: [
                  for (int interval in [5, 10, 15, 20, 30])
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          Radio<int>(
                            value: interval,
                            groupValue: selectedInterval,
                            onChanged: (value) {
                              setState(() {
                                selectedInterval = value!;
                              });
                            },
                          ),
                          SizedBox(width: 8),
                          Text("$interval분"),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              "반복 횟수 선택:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: Column(
                children: [
                  for (int repeat in [3, 5, 10])
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          Radio<int>(
                            value: repeat,
                            groupValue: selectedRepeat,
                            onChanged: (value) {
                              setState(() {
                                selectedRepeat = value!;
                              });
                            },
                          ),
                          SizedBox(width: 8),
                          Text("$repeat회"),
                        ],
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        Radio<int>(
                          value: -1, // Use a unique value for "Continuously"
                          groupValue: selectedRepeat,
                          onChanged: (value) {
                            setState(() {
                              selectedRepeat = value!;
                            });
                          },
                        ),
                        SizedBox(width: 8),
                        Text("계속 반복"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
