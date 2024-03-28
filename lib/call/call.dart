import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'modal.end.dart';

class Call extends StatelessWidget {
  const Call({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ModalMemo()),
          );
        },
        child: Image(image: AssetImage("assets/images/call.gif")),
      ),
    );
  }
}
