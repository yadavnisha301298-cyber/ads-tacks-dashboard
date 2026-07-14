/// Drives the monthly calendar widget in the right-hand panel.
class CalendarInfo {
  const CalendarInfo({
    required this.year,
    required this.month,
    required this.today,
    required this.highlightedDays,
    required this.scheduleLabel,
  });

  final int year;

  /// 1-based month (1 = January).
  final int month;

  /// Day-of-month that should be shown as "today".
  final int today;

  /// Additional days to accent (e.g. events).
  final List<int> highlightedDays;

  /// The "GENERAL 10:00 AM TO 7:00 PM" style header label.
  final String scheduleLabel;
}
