import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/utils/app_feedback.dart';
import '../../../../core/widgets/dashboard_card.dart';
import '../../../../core/widgets/profile_avatar.dart';
import '../../../../core/widgets/section_title.dart';
import '../../domain/entities/creator.dart';

/// The dark "Top Creators" panel: a lightweight table with an avatar+name
/// column, an artworks count and an animated rating bar.
class CreatorTable extends StatelessWidget {
  const CreatorTable({super.key, required this.creators});

  final List<Creator> creators;

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      color: context.dashboard.panel,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SectionTitle('Top Creators', color: context.dashboard.panelText),
          const SizedBox(height: AppSpacing.md),
          const _HeaderRow(),
          const SizedBox(height: AppSpacing.md),
          for (int i = 0; i < creators.length; i++) ...<Widget>[
            if (i > 0) const SizedBox(height: AppSpacing.md),
            _CreatorRow(creator: creators[i]),
          ],
        ],
      ),
    );
  }
}

class _HeaderRow extends StatelessWidget {
  const _HeaderRow();

  @override
  Widget build(BuildContext context) {
    final TextStyle? style = context.text.labelMedium
        ?.copyWith(color: context.dashboard.panelTextMuted);
    return Row(
      children: <Widget>[
        Expanded(flex: 5, child: Text('Name', style: style)),
        Expanded(flex: 2, child: Text('Artworks', style: style)),
        Expanded(
          flex: 3,
          child: Text('Rating', style: style, textAlign: TextAlign.end),
        ),
      ],
    );
  }
}

class _CreatorRow extends StatelessWidget {
  const _CreatorRow({required this.creator});

  final Creator creator;

  @override
  Widget build(BuildContext context) {
    final Color textColor = context.dashboard.panelText;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: AppRadius.brSm,
        onTap: () => AppFeedback.toast(
          context,
          'View ${creator.username}\'s profile (demo)',
          icon: Icons.person_outline_rounded,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxs),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Row(
                  children: <Widget>[
                    ProfileAvatar(
                      name: creator.username,
                      imageUrl: creator.avatarUrl,
                      radius: 16,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Flexible(
                      child: Text(
                        creator.username,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            context.text.bodyMedium?.copyWith(color: textColor),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  '${creator.artworks}',
                  style: context.text.bodyMedium?.copyWith(color: textColor),
                ),
              ),
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: _RatingBar(value: creator.rating),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// An animated horizontal progress bar representing a normalised rating.
class _RatingBar extends StatelessWidget {
  const _RatingBar({required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Rating',
      value: '${(value * 100).round()} percent',
      child: Container(
        width: 80,
        height: 8,
        decoration: BoxDecoration(
          color: context.dashboard.panelElevated,
          borderRadius: BorderRadius.circular(AppRadius.pill),
        ),
        alignment: Alignment.centerLeft,
        child: TweenAnimationBuilder<double>(
          duration: AppDurations.slow,
          curve: Curves.easeOutCubic,
          tween: Tween<double>(begin: 0, end: value.clamp(0, 1)),
          builder: (BuildContext context, double t, _) => FractionallySizedBox(
            widthFactor: t,
            child: Container(
              height: 8,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: context.dashboard.purpleButtonGradient,
                ),
                borderRadius: BorderRadius.circular(AppRadius.pill),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
