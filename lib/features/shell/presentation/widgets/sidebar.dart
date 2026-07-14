import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/router/app_routes.dart';
import '../../../dashboard/domain/entities/dashboard_data.dart';
import '../../../dashboard/domain/entities/user_profile.dart';
import '../../../dashboard/presentation/providers/dashboard_providers.dart';
import 'app_logo.dart';
import 'sidebar_item.dart';
import 'sidebar_profile.dart';
import 'workspace_section.dart';

/// The primary navigation rail. Renders as a permanent panel on desktop, and
/// inside a [Drawer] on mobile. Set [collapsed] for the icon-only tablet rail.
class Sidebar extends ConsumerWidget {
  const Sidebar({
    super.key,
    required this.currentRoute,
    this.collapsed = false,
    this.onDestinationSelected,
  });

  final String currentRoute;
  final bool collapsed;

  /// Invoked after navigation — used to close the drawer on mobile.
  final VoidCallback? onDestinationSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserProfile? profile = ref.watch(
      dashboardDataProvider.select(
        (AsyncValue<DashboardData> value) => value.valueOrNull?.user,
      ),
    );

    final EdgeInsets padding = EdgeInsets.symmetric(
      horizontal: collapsed ? AppSpacing.sm : AppSpacing.lg,
      vertical: AppSpacing.lg,
    );

    return Material(
      color: context.colors.surface,
      child: SafeArea(
        child: Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: AppLogo(compact: collapsed),
              ),
              const SizedBox(height: AppSpacing.lg),
              if (!collapsed && profile != null) ...<Widget>[
                const Divider(),
                const SizedBox(height: AppSpacing.md),
                SidebarProfile(
                  name: profile.name,
                  role: profile.role,
                  avatarUrl: profile.avatarUrl,
                ),
                const SizedBox(height: AppSpacing.md),
                const Divider(),
                const SizedBox(height: AppSpacing.xs),
              ],
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      for (final NavDestination d in kPrimaryDestinations)
                        SidebarItem(
                          label: d.label,
                          icon: d.icon,
                          selectedIcon: d.selectedIcon,
                          selected: currentRoute == d.route,
                          collapsed: collapsed,
                          onTap: () => _go(context, d.route),
                        ),
                      if (!collapsed) ...<Widget>[
                        const SizedBox(height: AppSpacing.md),
                        const WorkspaceSection(),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              SidebarItem(
                label: 'Setting',
                icon: Icons.settings_outlined,
                selectedIcon: Icons.settings_rounded,
                selected: currentRoute == AppRoutes.settings,
                collapsed: collapsed,
                onTap: () => _go(context, AppRoutes.settings),
              ),
              SidebarItem(
                label: 'Logout',
                icon: Icons.logout_rounded,
                selectedIcon: Icons.logout_rounded,
                selected: false,
                collapsed: collapsed,
                onTap: () => _confirmLogout(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _go(BuildContext context, String route) {
    context.go(route);
    onDestinationSelected?.call();
  }

  void _confirmLogout(BuildContext context) {
    onDestinationSelected?.call();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Logout tapped (demo).')),
    );
  }
}
