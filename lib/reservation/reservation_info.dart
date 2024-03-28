import 'package:flutter/material.dart';

class ReservationInfo {
  final DateTime dateTime;
  final List<String> weekdays;
  final String memo;

  ReservationInfo({
    required this.dateTime,
    required this.weekdays,
    required this.memo,
  });

  ReservationInfo.fromJson(Map<String, dynamic> json)
      : dateTime = DateTime.parse(json['dateTime']),
        weekdays = List<String>.from(json['weekdays']),
        memo = json['memo'];

  Map<String, dynamic> toJson() => {
        'dateTime': dateTime.toIso8601String(),
        'weekdays': weekdays,
        'memo': memo,
      };
}
