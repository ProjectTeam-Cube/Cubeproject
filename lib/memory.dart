import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Memory extends StatefulWidget {
  const Memory({super.key});

  @override
  State<Memory> createState() => _MemoryState();
}

class _MemoryState extends State<Memory> {
  final TextEditingController _controller = TextEditingController();
  // 글자 수를 상태로 관리하기 위한 변수를 추가합니다.
  String _counterText = '0/5000';
  Image? _image;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller.addListener(_updateCounter);
  //   // 예시 이미지를 표시합니다. 실제 앱에서는 사용자가 사진을 선택하면 해당 이미지로 대체됩니다.
  //   _image = Image.network(
  //     'https://via.placeholder.com/150', // 예시 이미지 URL입니다.
  //     fit: BoxFit.cover,
  //   );
  // }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateCounter);
    // 로컬 에셋에서 이미지를 로드합니다.
    _image = Image.asset(
      'assets/images/a.jpg', // 에셋 이미지의 경로를 명시합니다.
      fit: BoxFit.cover,
    );
  }

  void _updateCounter() {
    // 현재 텍스트 길이를 사용하여 카운터 텍스트를 업데이트합니다.
    setState(() {
      _counterText = '${_controller.text.length}/5000';
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_updateCounter);
    _controller.dispose();
    super.dispose();
  }

  void _onAddPhotoPressed() {
    // 여기에 실제 사진 불러오는 로직을 구현하게 됩니다.
    // 예를 들어, 이미지 피커 라이브러리를 사용하여 사용자가 선택한 이미지로 _image를 업데이트합니다.
    setState(() {
      // _image = 사용자가 선택한 이미지로 설정;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('후기작성'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '오늘은 어떤 추억이 있나요?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Stack(
              children: <Widget>[
                TextField(
                  controller: _controller,
                  maxLines: 6,
                  decoration: InputDecoration(
                    hintText: '여기에 추억을 담아 주세요.',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  // buildCounter와 counterText를 제거합니다.
                ),
                Positioned(
                  right: 8,
                  bottom: 8,
                  child: Text(
                    _counterText, // 상태로 관리되는 카운터 텍스트를 사용합니다.
                    style: TextStyle(
                      color: Colors.grey[850],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30), // 버튼과 텍스트 필드 사이의 간격을 주기 위해 추가합니다.

            ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                width: double.infinity, // 버튼의 너비를 텍스트 필드와 일치시킵니다.
                height: 60, // 버튼의 높이를 설정합니다.
              ),
              child: ElevatedButton.icon(
                icon: Icon(Icons.photo_camera), // 사진 추가 아이콘을 설정합니다.
                label: Text('사진 첨부하기',
                  style: TextStyle(fontWeight: FontWeight.bold),), // 버튼의 라벨을 설정합니다.
                onPressed: (){}, // 버튼 클릭 시 호출될 메소드를 연결합니다.
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, // 버튼의 텍스트 색상을 설정합니다.
                  shape: RoundedRectangleBorder( // 테두리의 모양을 설정합니다.
                    borderRadius: BorderRadius.circular(6), // 각진 모서리를 위해 적당한 값을 설정합니다.
                  ),
                ),
              ),
            ),

            SizedBox(height: 20), // 버튼과 이미지 사이의 간격

            // 이미지 표시
            // 사진이 표시될 Container
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                width: 180.0, // 틀의 너비를 지정
                height: 180.0, // 틀의 높이를 지정
                decoration: BoxDecoration(
                  // BoxDecoration을 사용하여 Container에 추가적인 스타일을 적용
                  border: Border.all(color: Colors.grey), // 테두리 색상 설정
                ),
                child: ClipRRect(
                  child: _image != null ? _image! : Text('사진이 없습니다.'),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 버튼 사이에 공간을 균등하게 배분
                children: <Widget>[
                  SizedBox(
                    width: 165,
                    height: 55,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Colors.black), // 버튼 텍스트 색상을 검은색으로 설정
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // 살짝 각진 모서리를 위해 설정
                          ),
                        ),
                      ),
                      child: Text(
                        "취소",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    width: 165,
                    height: 55,
                    child: ElevatedButton(
                      child: Text(
                        "등록",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFF6F0F), // 버튼 배경색을 설정
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // 살짝 각진 모서리를 위해 설정
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}








