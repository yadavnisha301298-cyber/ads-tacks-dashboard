import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/widgets/avatar_stack.dart';
import '../../../../core/widgets/dashboard_card.dart';
import '../../../../core/widgets/gradient_button.dart';
import '../../domain/entities/person.dart';

/// Shared presentation for the "Today Birthday" and "Anniversary" panels, which
/// are structurally identical: sparkled title, avatar row, total, and CTA.
///
/// Extracting one widget honours DRY — the two feature cards are thin wrappers.
class CelebrationCard extends StatelessWidget {
  const CelebrationCard({
    super.key,
    required this.group,
    required this.ctaLabel,
    this.onCtaPressed,
  });

  final CelebrationGroup group;
  final String ctaLabel;
  final VoidCallback? onCtaPressed;

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      color: context.dashboard.panel,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _TitleWithSparkles(title: group.title),
          const SizedBox(height: AppSpacing.lg),
          AvatarStack(
            names: group.people.map((Person p) => p.name).toList(),
            imageUrls: group.people.map((Person p) => p.avatarUrl).toList(),
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            children: <Widget>[
              Text(
                'Total',
                style: context.text.bodyMedium
                    ?.copyWith(color: context.dashboard.panelTextMuted),
              ),
              const SizedBox(width: AppSpacing.md),
              _CountBadge(count: group.total),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          GradientButton(
            label: ctaLabel,
            icon: Icons.send_rounded,
            expand: true,
            onPressed: onCtaPressed,
          ),
        ],
      ),
    );
  }
}

class _TitleWithSparkles extends StatelessWidget {
  const _TitleWithSparkles({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final Widget sparkle = Icon(
      Icons.auto_awesome_rounded,
      color: context.colors.secondary,
      size: 20,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        sparkle,
        const SizedBox(width: AppSpacing.xs),
        Flexible(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: context.text.titleMedium
                ?.copyWith(color: context.dashboard.panelText),
          ),
        ),
        const SizedBox(width: AppSpacing.xs),
        sparkle,
      ],
    );
  }
}

class _CountBadge extends StatelessWidget {
  const _CountBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final Color line = context.dashboard.panelTextMuted;
    return Row(
      children: <Widget>[
        Container(width: 1.5, height: 22, color: line),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: Text(
            '$count',
            style: context.text.titleLarge
                ?.copyWith(color: context.dashboard.panelText),
          ),
        ),
        Container(width: 1.5, height: 22, color: line),
      ],
    );
  }
}
