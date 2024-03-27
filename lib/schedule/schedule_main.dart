import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

// Event 클래스 정의
class Event {
  final String title;
  final Color color;
  final DateTime date; // 이벤트별 색상 속성 추가
  bool isFavorite;
  bool isSuccess;

  Event(this.title, this.color, this.date,
      {this.isFavorite = false, this.isSuccess = false}); // 생성자에 색상 인자 추가

  @override
  String toString() => title;
}

// 간단한 이벤트 데이터
final Map<DateTime, List<Event>> kEvents = {
  DateTime.utc(2024, 3, 14): [
    Event("아빠한테 전화드리기", Color(0xFF8FCACA), DateTime.utc(2024, 3, 14)),
    Event("할머니랑 약속잡기", Color(0xFFC8BFE7), DateTime.utc(2024, 3, 14)),
  ],
  DateTime.utc(2024, 3, 15): [
    Event("거래처 연락하기", Color(0xFF97C1A9), DateTime.utc(2024, 3, 15)),
  ],
  // 이하 생략
};

// 날짜 범위 내 모든 날짜를 리스트로 반환하는 함수
List<DateTime> daysInRange(DateTime start, DateTime end) {
  List<DateTime> days = [];
  DateTime currentDay = start;
  while (currentDay.isBefore(end)) {
    days.add(currentDay);
    currentDay = currentDay.add(Duration(days: 1));
  }
  return days;
}

class ScheduleMain extends StatefulWidget {
  @override
  _ScheduleMainState createState() => _ScheduleMainState();
}

class _ScheduleMainState extends State<ScheduleMain> {
  void _showAddEventDialog() {
    final TextEditingController _titleController = TextEditingController();
    Color _selectedColor = Colors.blue; // 기본 색상 설정
    String _selectedColorName = 'Blue'; // Dropdown에서 사용할 색상 이름

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          // StatefulBuilder 추가
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text('일정'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(labelText: '메모 내용'),
                  ),
                  DropdownButton<String>(
                    value: _selectedColorName,
                    items: <String>['Red', 'Green', 'Yellow', 'Blue', 'Orange']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedColorName = value!;
                        switch (value) {
                          case 'Red':
                            _selectedColor = Color(0xFFff464d);
                            break;
                          case 'Green':
                            _selectedColor = Color(0xFF97C1A9);
                            break;
                          case 'Yellow':
                            _selectedColor = Color(0xFFFFFFB5);
                            break;
                          case 'Blue':
                            _selectedColor = Color(0xFF8FCACA);
                          case 'Orange':
                            _selectedColor = Color(0xFFFFC8A2);
                            break;
                        }
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // 취소 버튼 클릭 시 모달창 닫기
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    if (_titleController.text.isNotEmpty &&
                        _selectedDay != null) {
                      // _selectedDay가 null이 아닌지 확인하고, Event 객체에 날짜 정보를 추가
                      final Event newEvent = Event(
                          _titleController.text,
                          _selectedColor,
                          _selectedDay!, // 선택된 날짜를 Event 생성자에 전달
                          isFavorite: false,
                          isSuccess: false // isSuccess 초기값도 제공 (필요한 경우)
                          );

                      final selectedDayEvents = kEvents[_selectedDay] ?? [];
                      selectedDayEvents.add(newEvent);
                      kEvents[_selectedDay!] = selectedDayEvents;

                      _selectedEvents.value = _getEventsForDay(_selectedDay!);
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Add'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '일정 관리',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF393939)),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // 하단 선의 높이 설정
          child: Divider(
            height: 0.5, // 선의 높이 설정
            color: Color(0xFFe1e1e1), // 선의 색상 설정
          ),
        ),
        actions: <Widget>[
          // 우측 끝에 아이콘 버튼 추가
          IconButton(
            icon: Icon(
              Icons.search,
              color: Color(0xFF393939),
            ), // 첫 번째 아이콘
            onPressed: () {
              // 첫 번째 아이콘 버튼의 동작 정의
              print('검색 버튼이 클릭되었습니다.');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Color(0xFF393939),
            ), // 두 번째 아이콘
            onPressed: () {
              // 두 번째 아이콘 버튼의 동작 정의
              print('더보기 버튼이 클릭되었습니다.');
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: 395,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/calendar.jpg'), // 배경 이미지 경로
                fit: BoxFit.cover, // 이미지를 화면에 맞게 조정
              ),
            ),
            child: Opacity(
              opacity: 0.2,
              child: Container(
                color: Colors.white,
              ),
            ),
          ),
          Column(
            children: [
              TableCalendar<Event>(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                rangeStartDay: _rangeStart,
                rangeEndDay: _rangeEnd,
                calendarFormat: _calendarFormat,
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format; // 사용자가 선택한 새 포맷으로 상태 업데이트
                  });
                },
                rangeSelectionMode: _rangeSelectionMode,
                eventLoader: _getEventsForDay,
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                    _rangeStart = null; // Important to clean these
                    _rangeEnd = null;
                    _rangeSelectionMode = RangeSelectionMode.toggledOff;
                  });
                  _selectedEvents.value = _getEventsForDay(selectedDay);
                },
                onRangeSelected: (start, end, focusedDay) {
                  // Implementation
                },
                calendarBuilders: CalendarBuilders(
                  markerBuilder: (context, date, events) {
                    final weekday = date.weekday;

                    TextStyle textStyle;
                    if (weekday == DateTime.saturday) {
                      textStyle = TextStyle(color: Colors.blue); // 토요일은 파란색
                    } else if (weekday == DateTime.sunday) {
                      textStyle = TextStyle(color: Colors.red); // 일요일은 빨간색
                    } else {
                      textStyle =
                          TextStyle(color: Colors.black); // 나머지 요일은 기본 색상
                    }

                    if (events.isNotEmpty) {
                      List<Widget> icons = [];

                      // 즐겨찾기 아이콘이 있으면 추가
                      if (events.any((event) => event.isFavorite)) {
                        icons.add(
                            Icon(Icons.close, color: Colors.red, size: 22));
                      }

                      // 성공 아이콘이 있으면 추가, 아이콘 사이에 간격을 위한 SizedBox 추가
                      if (events.any((event) => event.isSuccess)) {
                        // 아이콘 사이에 공간을 주기 위해 icons가 비어있지 않으면 SizedBox를 추가
                        if (icons.isNotEmpty) {
                          icons.add(SizedBox(width: 4));
                        }
                        icons.add(
                            Icon(Icons.check, color: Colors.green, size: 22));
                      }

                      // 색상 바 리스트
                      List<Widget> colorBars = events
                          .map((event) => Container(
                                width: 40.0,
                                height: 4.0,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 1.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: event.color,
                                ),
                              ))
                          .toList();

                      // 색상 바를 달력 셀의 하단에 배치하려면, 우선 아이콘들의 높이를 고려해야 합니다.
                      // 예를 들어, 아이콘들의 높이가 20.0이라고 가정하면, 색상 바의 위치를 아이콘들보다 20.0만큼 아래에 위치시켜 겹치지 않도록 할 수 있습니다.
                      double spacerHeight = icons.isNotEmpty ? 18 : 40;
                      return Positioned(
                        top: 0, // 아이콘들의 우측 상단 정렬을 위한 top 위치
                        right: 2, // 아이콘들의 우측 상단 정렬을 위한 right 위치
                        child: Column(
                          children: [
                            if (icons.isNotEmpty)
                              Row(children: icons), // 아이콘 표시
                            SizedBox(
                                height: spacerHeight), // 아이콘과 colorBars 사이 간격
                            ...colorBars, // colorBars 표시
                          ],
                        ),
                      );
                    }
                    return null; // 이벤트가 없는 경우에는 아무것도 표시하지 않음
                  },
                ),
                calendarStyle: CalendarStyle(
                  // 이 부분에서 선택된 날짜의 스타일을 지정합니다.
                  selectedDecoration: BoxDecoration(
                    color: Color(0xFFffc29a)
                        .withOpacity(0.5), // 여기서 원하는 색상으로 변경하세요.
                    shape: BoxShape.circle,
                  ),
                  // 선택되지 않은 날짜의 스타일도 여기에서 지정할 수 있습니다.
                  defaultDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: Color(0xFFffc29a), // 오늘 날짜의 배경색을 지정
                    shape: BoxShape.circle,
                  ),
                  defaultTextStyle: TextStyle(
                    fontSize: 18, // 글씨 크기
                    color: Colors.black, // 글씨 색상
                  ),
                  // 주말 날짜 글씨 스타일
                  weekendTextStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.red, // 주말 날짜 색상을 다르게 설정
                  ),
                  todayTextStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.white, // 오늘 날짜 글씨 색상
                    fontWeight: FontWeight.bold, // 글씨 두께
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ValueListenableBuilder<List<Event>>(
                    valueListenable: _selectedEvents,
                    builder: (context, value, _) {
                      return ListView.builder(
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          DateTime eventDate =
                              value[index].date; // 가정: 각 Event에 date 속성이 있다고 가정
                          bool isPastOrToday = eventDate.isBefore(today) ||
                              eventDate.isAtSameMomentAs(today);

                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 4.0),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                border: Border.all(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 15.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: value[index].color,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12.0),
                                        bottomLeft: Radius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text(value[index].title),
                                      onTap: () => print('${value[index]}'),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "실패",
                                            style: TextStyle(
                                              fontSize:
                                                  12, // 여기서 텍스트 크기를 조절합니다.
                                              color: Colors
                                                  .black, // 필요하다면 색상도 조절할 수 있습니다.
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              value[index].isFavorite
                                                  ? Icons.close
                                                  : Icons
                                                      .check_box_outline_blank,
                                              color: value[index].isFavorite
                                                  ? Colors.red
                                                  : Colors.red,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                value[index].isFavorite =
                                                    !value[index].isFavorite;
                                              });
                                            },
                                          ),
                                          // 성공 상태 토글 버튼
                                          if (isPastOrToday)
                                            Text(
                                              "성공",
                                              style: TextStyle(
                                                fontSize:
                                                    12, // 여기서 텍스트 크기를 조절합니다.
                                                color: Colors
                                                    .black, // 필요하다면 색상도 조절할 수 있습니다.
                                              ),
                                            ),
                                          IconButton(
                                            icon: Icon(
                                              value[index].isSuccess
                                                  ? Icons.check
                                                  : Icons
                                                      .check_box_outline_blank,
                                              color: value[index].isSuccess
                                                  ? Colors.green
                                                  : Colors.green,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                value[index].isSuccess =
                                                    !value[index].isSuccess;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'uniqueTagFor3',
        onPressed: _showAddEventDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: ScheduleMain()));
}
