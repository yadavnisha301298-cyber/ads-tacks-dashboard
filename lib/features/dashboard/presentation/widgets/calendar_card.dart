import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/utils/app_feedback.dart';
import '../../../../core/widgets/dashboard_card.dart';
import '../../domain/entities/calendar_info.dart';

/// Monthly calendar in the right panel with a schedule header, month/year
/// selectors, weekday labels and a day grid that highlights "today".
class CalendarCard extends StatelessWidget {
  const CalendarCard({super.key, required this.info});

  final CalendarInfo info;

  static const List<String> _weekdays = <String>[
    'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su',
  ];
  static const List<String> _months = <String>[
    'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN',
    'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC',
  ];

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      color: context.dashboard.panel,
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            info.scheduleLabel,
            style: context.text.labelLarge?.copyWith(
              color: context.dashboard.panelText,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          _CalendarBody(info: info, months: _months, weekdays: _weekdays),
        ],
      ),
    );
  }
}

class _CalendarBody extends StatelessWidget {
  const _CalendarBody({
    required this.info,
    required this.months,
    required this.weekdays,
  });

  final CalendarInfo info;
  final List<String> months;
  final List<String> weekdays;

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      color: context.colors.surface,
      withShadow: false,
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        children: <Widget>[
          _MonthSelector(label: months[info.month - 1], year: info.year),
          const SizedBox(height: AppSpacing.md),
          _WeekdayHeader(weekdays: weekdays),
          const SizedBox(height: AppSpacing.xs),
          _DayGrid(info: info),
        ],
      ),
    );
  }
}

class _MonthSelector extends StatelessWidget {
  const _MonthSelector({required this.label, required this.year});

  final String label;
  final int year;

  @override
  Widget build(BuildContext context) {
    Widget chip(String text) => Material(
          color: context.colors.primary.withValues(alpha: 0.12),
          borderRadius: AppRadius.brSm,
          child: InkWell(
            borderRadius: AppRadius.brSm,
            onTap: () => AppFeedback.toast(
              context,
              'Change $text (demo)',
              icon: Icons.calendar_month_outlined,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xxs,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    text,
                    style: context.text.labelLarge?.copyWith(
                      color: context.colors.primary,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 18,
                    color: context.colors.primary,
                  ),
                ],
              ),
            ),
          ),
        );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[chip(label), chip('$year')],
    );
  }
}

class _WeekdayHeader extends StatelessWidget {
  const _WeekdayHeader({required this.weekdays});

  final List<String> weekdays;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        for (final String d in weekdays)
          Expanded(
            child: Text(
              d,
              textAlign: TextAlign.center,
              style: context.text.labelSmall?.copyWith(
                color: context.colors.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }
}

class _DayGrid extends StatelessWidget {
  const _DayGrid({required this.info});

  final CalendarInfo info;

  @override
  Widget build(BuildContext context) {
    final DateTime first = DateTime(info.year, info.month, 1);
    // DateTime.weekday: Mon=1..Sun=7; we render weeks starting Monday.
    final int leadingBlanks = first.weekday - 1;
    final int daysInMonth = DateTime(info.year, info.month + 1, 0).day;
    final int prevMonthDays = DateTime(info.year, info.month, 0).day;

    final List<_DayCell> cells = <_DayCell>[];
    // Trailing days of previous month.
    for (int i = leadingBlanks - 1; i >= 0; i--) {
      cells.add(_DayCell(prevMonthDays - i, muted: true));
    }
    // Current month.
    for (int d = 1; d <= daysInMonth; d++) {
      cells.add(_DayCell(
        d,
        isToday: d == info.today,
        highlighted: info.highlightedDays.contains(d),
      ));
    }
    // Leading days of next month to complete the last row.
    int nextDay = 1;
    while (cells.length % 7 != 0) {
      cells.add(_DayCell(nextDay++, muted: true));
    }

    return GridView.count(
      crossAxisCount: 7,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1,
      children: cells.map((_DayCell c) => c.build(context)).toList(),
    );
  }
}

/// Value object describing how a single day should render.
class _DayCell {
  const _DayCell(
    this.day, {
    this.isToday = false,
    this.highlighted = false,
    this.muted = false,
  });

  final int day;
  final bool isToday;
  final bool highlighted;
  final bool muted;

  Widget build(BuildContext context) {
    Color textColor = context.colors.onSurface;
    Color? bg;
    if (muted) {
      textColor = context.colors.onSurfaceVariant.withValues(alpha: 0.5);
    }
    if (highlighted && !isToday) {
      textColor = context.colors.primary;
    }
    if (isToday) {
      bg = context.colors.primary;
      textColor = Colors.white;
    }

    return Center(
      child: AnimatedContainer(
        duration: AppDurations.fast,
        width: 30,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bg,
          shape: BoxShape.circle,
          border: highlighted && !isToday
              ? Border.all(color: context.colors.primary)
              : null,
        ),
        child: Text(
          '$day',
          style: context.text.bodySmall?.copyWith(
            color: textColor,
            fontWeight: isToday ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
