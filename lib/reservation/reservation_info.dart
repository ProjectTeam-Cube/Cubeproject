class ReservationInfo {
  final DateTime dateTime;
  final List<String> weekdays;
  final String memo;

  ReservationInfo({
    required this.dateTime,
    required this.weekdays,
    required this.memo,
  });
}
