import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: AppBar(
        title: Padding(
          padding: EdgeInsets.fromLTRB(1.0, 8.0, 8.0, 8.0),
          child: Text(
            '전화번호 등록',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // 하단 선의 높이 설정
          child: Divider(
            height: 0.5, // 선의 높이 설정
            color: Color(0xFFe1e1e1), // 선의 색상 설정
          ),
        ),
        leading: IconButton(
          icon: Icon(CupertinoIcons.chevron_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100);
}
