import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/app_feedback.dart';
import '../../../../core/widgets/responsive_layout.dart';
import '../../../../core/widgets/status_views.dart';
import '../../domain/entities/dashboard_data.dart';
import '../providers/dashboard_providers.dart';
import '../widgets/creator_table.dart';
import '../widgets/hero_card.dart';
import '../widgets/performance_chart.dart';
import '../widgets/project_list.dart';
import '../widgets/right_panel.dart';

/// The Home screen. It watches [dashboardDataProvider] and renders one of three
/// adaptive layouts (mobile / tablet / desktop) — never a single scaled tree.
class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<DashboardData> state = ref.watch(dashboardDataProvider);

    return state.when(
      loading: () => const LoadingView(message: 'Loading dashboard…'),
      error: (Object e, _) => ErrorView(
        message: e.toString(),
        onRetry: () => ref.invalidate(dashboardDataProvider),
      ),
      data: (DashboardData data) => _DashboardBody(data: data),
    );
  }
}

class _DashboardBody extends StatelessWidget {
  const _DashboardBody({required this.data});

  final DashboardData data;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: (_) => _MobileLayout(data: data),
      tablet: (_) => _TabletLayout(data: data),
      desktop: (_) => _DesktopLayout(data: data),
    );
  }
}

/// A vertically stacked section list shared by the smaller layouts.
class _MainSections extends StatelessWidget {
  const _MainSections({required this.data, this.twoColumnCards = false});

  final DashboardData data;
  final bool twoColumnCards;

  @override
  Widget build(BuildContext context) {
    final Widget projects = ProjectList(projects: data.projects);
    final Widget creators = CreatorTable(creators: data.creators);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        HeroCard(
          hero: data.hero,
          onCtaPressed: () => AppFeedback.toast(
            context,
            'Learn more about ${data.hero.title} (demo)',
            icon: Icons.rocket_launch_outlined,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        if (twoColumnCards)
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(child: projects),
                const SizedBox(width: AppSpacing.lg),
                Expanded(child: creators),
              ],
            ),
          )
        else ...<Widget>[
          projects,
          const SizedBox(height: AppSpacing.lg),
          creators,
        ],
        const SizedBox(height: AppSpacing.lg),
        PerformanceChart(points: data.performance),
      ],
    );
  }
}

/// Desktop: main content + a permanent right panel (3-column feel).
class _DesktopLayout extends StatelessWidget {
  const _DesktopLayout({required this.data});

  final DashboardData data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.xs,
        AppSpacing.lg,
        AppSpacing.lg,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: AppSizes.maxContentWidth),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(child: _MainSections(data: data, twoColumnCards: true)),
            const SizedBox(width: AppSpacing.lg),
            SizedBox(
              width: AppSizes.rightPanelWidth,
              child: RightPanel(data: data),
            ),
          ],
        ),
      ),
    );
  }
}

/// Tablet: 2-column cards, right panel flows underneath the main content.
class _TabletLayout extends StatelessWidget {
  const _TabletLayout({required this.data});

  final DashboardData data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.xs,
        AppSpacing.lg,
        AppSpacing.lg,
      ),
      child: Column(
        children: <Widget>[
          _MainSections(data: data, twoColumnCards: true),
          const SizedBox(height: AppSpacing.lg),
          RightPanel(data: data),
        ],
      ),
    );
  }
}

/// Mobile: everything in a single scrolling column.
class _MobileLayout extends StatelessWidget {
  const _MobileLayout({required this.data});

  final DashboardData data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        children: <Widget>[
          _MainSections(data: data),
          const SizedBox(height: AppSpacing.lg),
          RightPanel(data: data),
        ],
      ),
    );
  }
}
