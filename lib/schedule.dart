import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';

import 'bottom_navigation_bar.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('일정 관리'),
      ),
      body: Center(
        child: Text('여기는 일정 관리 페이지입니다.'),
      ),
    );
  }
}

class CalendarScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalendarScreenState();
  }
}

class _CalendarScreenState extends State<CalendarScreen> {
  bool showEvents = true;

  List<NeatCleanCalendarEvent> _todaysEvents = [
    NeatCleanCalendarEvent(
      'Event A',
      startTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 10, 0),
      endTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 12, 0),
      description: 'A special event',
      color: Colors.blue[700],
    ),
  ];

  final List<NeatCleanCalendarEvent> _eventList = [
    NeatCleanCalendarEvent(
      'MultiDay Event A',
      startTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 10, 0),
      endTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day + 2, 12, 0),
      color: Colors.orange,
      isMultiDay: true,
    ),
    NeatCleanCalendarEvent('Event X',
        startTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 10, 30),
        endTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 11, 30),
        color: Colors.lightGreen,
        isAllDay: false,
        isDone: true,
        // icon: 'assets/event1.jpg',
        wide: false),
    NeatCleanCalendarEvent('Allday Event B',
        startTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day - 2, 14, 30),
        endTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 2, 17, 0),
        color: Colors.pink,
        isAllDay: true,
        wide: false),
  ];

  @override
  void initState() {
    super.initState();
    // Force selection of today on first load, so that the list of today's events gets shown.
    _handleNewDate(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Calendar(
          startOnMonday: true,
          weekDays: ['Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa', 'So'],
          eventsList: _eventList,
          isExpandable: true,
          eventDoneColor: Colors.deepPurple,
          selectedColor: Colors.blue,
          selectedTodayColor: Colors.green,
          todayColor: Colors.teal,
          eventColor: null,
          locale: 'de_DE',
          todayButtonText: 'Heute',
          allDayEventText: 'Ganztägig',
          multiDayEndText: 'Ende',
          isExpanded: true,
          expandableDateFormat: 'EEEE, dd. MMMM yyyy',
          onEventSelected: (value) {
            print('Event selected ${value.summary}');
          },
          onEventLongPressed: (value) {
            print('Event long pressed ${value.summary}');
          },
          // onMonthChanged: (value) {
          //   print('Month changed $value');
          // },
          onDateSelected: (value) {
            print('Date selected $value');
          },
          onRangeSelected: (value) {
            print('Range selected ${value.from} - ${value.to}');
          },
          datePickerType: DatePickerType.date,
          dayOfWeekStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w800, fontSize: 11),
          showEvents: showEvents,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showEvents = !showEvents;
          });
        },
        child: Icon(showEvents ? Icons.visibility_off : Icons.visibility),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _handleNewDate(date) {
    print('Date selected: $date');
  }
}
