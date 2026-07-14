import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/utils/app_feedback.dart';
import '../../../../core/widgets/dashboard_card.dart';
import '../../../../core/widgets/section_title.dart';
import '../../domain/entities/project.dart';
import 'project_tile.dart';

/// The dark "All Projects" panel containing a scrollable list of [ProjectTile]s
/// with a staggered entrance animation.
class ProjectList extends StatelessWidget {
  const ProjectList({super.key, required this.projects});

  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      color: context.dashboard.panel,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SectionTitle('All Projects', color: context.dashboard.panelText),
          const SizedBox(height: AppSpacing.md),
          for (int index = 0; index < projects.length; index++) ...<Widget>[
            if (index > 0) const SizedBox(height: AppSpacing.sm),
            _AnimatedIn(
              index: index,
              child: ProjectTile(
                project: projects[index],
                onTap: () => AppFeedback.toast(
                  context,
                  'Opening "${projects[index].title}"',
                  icon: Icons.open_in_new_rounded,
                ),
                onEdit: () => AppFeedback.toast(
                  context,
                  'Edit ${projects[index].projectNumber} (demo)',
                  icon: Icons.edit_outlined,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Fades + slides a list item in, staggered by its [index].
class _AnimatedIn extends StatelessWidget {
  const _AnimatedIn({required this.index, required this.child});

  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: AppDurations.medium + Duration(milliseconds: 60 * index),
      curve: Curves.easeOut,
      tween: Tween<double>(begin: 0, end: 1),
      builder: (BuildContext context, double t, Widget? child) {
        return Opacity(
          opacity: t.clamp(0, 1),
          child: Transform.translate(
            offset: Offset(0, (1 - t) * 12),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
