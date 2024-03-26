import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

// Event 클래스 정의
class Event {
  final String title;
  final Color color; // 이벤트별 색상 속성 추가
  bool isFavorite;

  Event(this.title, this.color, {this.isFavorite = false}); // 생성자에 색상 인자 추가

  @override
  String toString() => title;
}

// 간단한 이벤트 데이터
final Map<DateTime, List<Event>> kEvents = {
  DateTime.utc(2024, 3, 14): [
    Event("Conference", Colors.blue),
    Event("Meeting", Colors.red),
  ],
  DateTime.utc(2024, 3, 15): [
    Event("Workshop", Colors.green),
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

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
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
                            _selectedColor = Colors.red;
                            break;
                          case 'Green':
                            _selectedColor = Colors.green;
                            break;
                          case 'Yellow':
                            _selectedColor = Colors.yellow;
                            break;
                          case 'Blue':
                            _selectedColor = Colors.blue;
                          case 'Orange':
                            _selectedColor = Colors.orange;
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
                      // _selectedDay가 null이 아닌지 확인
                      final Event newEvent = Event(
                          _titleController.text, _selectedColor,
                          isFavorite: false); // 생성자에 isFavorite 추가
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

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    final days = daysInRange(start, end);
    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
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
                if (events.isNotEmpty) {
                  // 즐겨찾기된 이벤트가 있는지 확인
                  bool hasFavorite = events.any((event) => event.isFavorite);
                  if (hasFavorite) {
                    // 즐겨찾기된 이벤트가 있으면 노란색 별 표시
                    return Positioned(
                      right: 1,
                      top: 1,
                      child: Icon(Icons.star, color: Colors.yellow, size: 16),
                    );
                  } else {
                    // 즐겨찾기된 이벤트가 없으면 다른 마커 표시 (예: 색상 바)
                    return Positioned(
                      right: 1,
                      bottom: 1,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: events
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
                            .toList(),
                      ),
                    );
                  }
                }
                return null; // 이벤트가 없는 경우에는 아무것도 표시하지 않음
              },
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          border: Border.all(),
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
                                trailing: IconButton(
                                  icon: Icon(
                                    value[index].isFavorite
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: value[index].isFavorite
                                        ? Colors.yellow
                                        : null,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      // 즐겨찾기 상태 토글
                                      value[index].isFavorite =
                                          !value[index].isFavorite;
                                    });
                                  },
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddEventDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: Schedule()));
}
