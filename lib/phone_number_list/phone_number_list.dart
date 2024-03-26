import 'package:cube/phone_number_list/phone_book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../appbarAndnavigatorbar/bottom_navigation_bar.dart';

class PhoneNumberList extends StatefulWidget {
  const PhoneNumberList({super.key});

  @override
  State<PhoneNumberList> createState() => _PhoneNumberListState();
}

class _PhoneNumberListState extends State<PhoneNumberList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '전화번호 리스트',
          style: TextStyle(color: Colors.orange),
        ),
      ),
      body: PhoneBook(),
      bottomNavigationBar: BottomNavigationBarApp(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
