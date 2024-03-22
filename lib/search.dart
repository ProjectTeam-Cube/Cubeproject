import 'package:flutter/material.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SearchbarAnimationExample extends StatefulWidget {
  const SearchbarAnimationExample({Key? key}) : super(key: key);

  @override
  _SearchbarAnimationExampleState createState() =>
      _SearchbarAnimationExampleState();
}

class _SearchbarAnimationExampleState extends State<SearchbarAnimationExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildSearchbarAnimation(),
    );
  }

  Widget _buildSearchbarAnimation() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 1.0, left: 8.0, right: 8.0, bottom: 8.0),
          child: Column(
            children: <Widget>[
              Padding(
                // SearchBarAnimation 위젯은 이전 코드를 그대로 사용합니다.
                padding: const EdgeInsets.all(15.0),
                child: SearchBarAnimation(
                  textEditingController: TextEditingController(),
                  isOriginalAnimation: true,
                  enableKeyboardFocus: true,
                  onExpansionComplete: () {
                    debugPrint('do something just after searchbox is opened.');
                  },
                  onCollapseComplete: () {
                    debugPrint('do something just after searchbox is closed.');
                  },
                  onPressButton: (isSearchBarOpens) {
                    debugPrint(
                        'do something before animation started. It\'s the ${isSearchBarOpens ? 'opening' : 'closing'} animation');
                  },
                  trailingWidget: const Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.grey,
                  ),
                  secondaryButtonWidget: const Icon(
                    Icons.close,
                    size: 20,
                    color: Colors.grey,
                  ),
                  buttonWidget: const Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  // 현재 인덱스에 해당하는 User 객체
                  User currentUser = users[index];

                  return Slidable(
                    key: ValueKey(currentUser.name),
                    startActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) => doNothing(context),
                          backgroundColor: Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                        SlidableAction(
                          onPressed: (context) => doNothing(context),
                          backgroundColor: Color(0xFF21B7CA),
                          foregroundColor: Colors.white,
                          icon: Icons.share,
                          label: 'Share',
                        ),
                      ],
                    ),
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) => doNothing(context),
                          backgroundColor: Color(0xFF7BC043),
                          foregroundColor: Colors.white,
                          icon: Icons.archive,
                          label: 'Archive',
                        ),
                        SlidableAction(
                          onPressed: (context) => doNothing(context),
                          backgroundColor: Color(0xFF0392CF),
                          foregroundColor: Colors.white,
                          icon: Icons.save,
                          label: 'Save',
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(currentUser.imagePath),
                      ),
                      title: Text(currentUser.name),
                      subtitle: Text(currentUser.phoneNumber),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void doNothing(BuildContext context) {}

class User {
  String name;
  String phoneNumber;
  String imagePath;

  User(this.name, this.phoneNumber, this.imagePath);
}

// 메인 함수나 위젯 클래스 안에서 사용자 데이터 리스트 생성
final List<User> users = [
  User('이도현', '010-1234-5678', 'assets/images/leedohyun.jpg'),
  User('박은빈', '010-2345-6789', 'assets/images/enbin.jpg'),
  User('서현진', '010-3456-7890', 'assets/images/hyunjin.jpg'),
  User('김유정', '010-4567-8901', 'assets/images/ujung.jpg'),
  User('흰둥이', '010-5678-9012', 'assets/images/hyn.jpg'),
  User('짱구', '010-5678-9012', 'assets/images/jjang.jpg'),

  // 필요한 만큼 사용자를 추가할 수 있습니다.
];
