/// One data point on the "Over All Performance" line chart.
class PerformancePoint {
  const PerformancePoint({
    required this.year,
    required this.pending,
    required this.done,
  });

  final int year;

  /// "Pending Done" series value.
  final double pending;

  /// "Project Done" series value.
  final double done;
}
