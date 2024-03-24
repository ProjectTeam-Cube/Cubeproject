import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  const CheckBox({Key? key}) : super(key: key);

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
      fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        // 체크박스의 색상을 상태에 따라 지정합니다
        if (states.contains(MaterialState.selected)) {
          // 선택되었을 때의 배경색
          return Color(0xFF26C100);
        }
        // 선택되지 않았을 때의 배경색
        return Colors.transparent;
      }),
    );
  }
}
