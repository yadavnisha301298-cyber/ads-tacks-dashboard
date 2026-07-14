import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/widgets/dashboard_card.dart';
import '../../domain/entities/performance_point.dart';

/// The "Over All Performance / The Years" interactive line chart.
///
/// Plots two smoothed series — "Pending Done" and "Project Done" — with a
/// legend, gridlines, year axis and touch tooltips. Resizes fluidly to its
/// parent via [LayoutBuilder]/[AspectRatio].
class PerformanceChart extends StatelessWidget {
  const PerformanceChart({super.key, required this.points});

  final List<PerformancePoint> points;

  double get _maxY {
    double max = 0;
    for (final PerformancePoint p in points) {
      max = <double>[max, p.pending, p.done].reduce((a, b) => a > b ? a : b);
    }
    return ((max / 10).ceil() * 10 + 10).toDouble();
  }

  @override
  Widget build(BuildContext context) {
    final Color pending = context.dashboard.chartPending;
    final Color done = context.dashboard.chartDone;

    return DashboardCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.start,
            runSpacing: AppSpacing.sm,
            spacing: AppSpacing.md,
            children: <Widget>[
              Text(
                'Over  All Performance\nThe Years',
                style: context.text.titleMedium,
              ),
              Wrap(
                spacing: AppSpacing.md,
                runSpacing: AppSpacing.xs,
                children: <Widget>[
                  _LegendDot(color: pending, label: 'Pending Done'),
                  _LegendDot(color: done, label: 'Project Done'),
                ],
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints c) {
              final double ratio = c.maxWidth > 520 ? 2.4 : 1.6;
              return AspectRatio(
                aspectRatio: ratio,
                child: RepaintBoundary(
                  child: LineChart(_buildData(context, pending, done)),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  LineChartData _buildData(BuildContext context, Color pending, Color done) {
    final Color grid = context.colors.outlineVariant;
    final Color axisText = context.colors.onSurfaceVariant;

    return LineChartData(
      minX: 0,
      maxX: (points.length - 1).toDouble(),
      minY: 0,
      maxY: _maxY,
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 10,
        getDrawingHorizontalLine: (double value) =>
            FlLine(color: grid, strokeWidth: 1, dashArray: <int>[6, 6]),
      ),
      titlesData: FlTitlesData(
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 10,
            reservedSize: 34,
            getTitlesWidget: (double value, TitleMeta meta) => Text(
              value.toInt().toString(),
              style: context.text.bodySmall?.copyWith(color: axisText),
            ),
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            reservedSize: 28,
            getTitlesWidget: (double value, TitleMeta meta) {
              final int i = value.toInt();
              if (i < 0 || i >= points.length) return const SizedBox.shrink();
              return Padding(
                padding: const EdgeInsets.only(top: AppSpacing.xs),
                child: Text(
                  '${points[i].year}',
                  style: context.text.bodySmall?.copyWith(color: axisText),
                ),
              );
            },
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (_) => context.colors.primary,
          tooltipRoundedRadius: AppRadius.md,
          getTooltipItems: (List<LineBarSpot> spots) => spots
              .map(
                (LineBarSpot s) => LineTooltipItem(
                  '${points[s.x.toInt()].year}\n${s.y.toInt()}',
                  context.text.labelMedium!.copyWith(color: Colors.white),
                ),
              )
              .toList(),
        ),
      ),
      lineBarsData: <LineChartBarData>[
        _series(pending, (PerformancePoint p) => p.pending, fill: false),
        _series(done, (PerformancePoint p) => p.done, fill: true),
      ],
    );
  }

  LineChartBarData _series(
    Color color,
    double Function(PerformancePoint) selector, {
    required bool fill,
  }) {
    return LineChartBarData(
      isCurved: true,
      curveSmoothness: 0.35,
      preventCurveOverShooting: true,
      color: color,
      barWidth: 3.5,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(
        show: fill,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            color.withValues(alpha: 0.25),
            color.withValues(alpha: 0.0),
          ],
        ),
      ),
      spots: <FlSpot>[
        for (int i = 0; i < points.length; i++)
          FlSpot(i.toDouble(), selector(points[i])),
      ],
    );
  }
}

class _LegendDot extends StatelessWidget {
  const _LegendDot({required this.color, required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: AppSpacing.xs),
        Text(label, style: context.text.bodySmall),
      ],
    );
  }
}
