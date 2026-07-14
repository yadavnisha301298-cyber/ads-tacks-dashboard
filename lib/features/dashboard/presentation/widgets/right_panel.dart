import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/app_feedback.dart';
import '../../domain/entities/dashboard_data.dart';
import 'anniversary_card.dart';
import 'birthday_card.dart';
import 'calendar_card.dart';

/// The right-hand column: calendar, today's birthdays and anniversaries.
///
/// Rendered as a fixed-width sidebar on desktop and inlined into the scrolling
/// content on smaller screens (decided by the parent layout).
class RightPanel extends StatelessWidget {
  const RightPanel({super.key, required this.data});

  final DashboardData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        CalendarCard(info: data.calendar),
        const SizedBox(height: AppSpacing.lg),
        BirthdayCard(
          group: data.birthdays,
          onWish: () => AppFeedback.toast(
            context,
            'Birthday wishes sent to ${data.birthdays.total} colleagues 🎉',
            icon: Icons.cake_outlined,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        AnniversaryCard(
          group: data.anniversaries,
          onWish: () => AppFeedback.toast(
            context,
            'Anniversary wishes sent to ${data.anniversaries.total} colleagues 🎊',
            icon: Icons.celebration_outlined,
          ),
        ),
      ],
    );
  }
}
