import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/utils/responsive.dart';
import '../widgets/sidebar.dart';
import '../widgets/top_bar.dart';

/// The persistent application chrome (sidebar + top bar) that wraps every
/// routed page. It is the single place responsive navigation is decided:
///
/// * desktop  → permanent expanded sidebar
/// * tablet   → permanent collapsed (icon-only) rail
/// * mobile   → hidden sidebar behind a [Drawer] + hamburger button
class AppShell extends ConsumerStatefulWidget {
  const AppShell({
    super.key,
    required this.child,
    required this.currentRoute,
  });

  /// The routed page content.
  final Widget child;
  final String currentRoute;

  @override
  ConsumerState<AppShell> createState() => _AppShellState();
}

class _AppShellState extends ConsumerState<AppShell> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String get _title {
    for (final NavDestination d in kPrimaryDestinations) {
      if (d.route == widget.currentRoute) return d.label;
    }
    if (widget.currentRoute == AppRoutes.settings) return 'Setting';
    return 'Home';
  }

  @override
  Widget build(BuildContext context) {
    final DeviceType device = context.deviceType;
    final bool isMobile = device == DeviceType.mobile;
    final bool isTablet = device == DeviceType.tablet;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: context.dashboard.canvas,
      drawer: isMobile
          ? Drawer(
              width: AppSizes.sidebarWidth,
              child: Sidebar(
                currentRoute: widget.currentRoute,
                onDestinationSelected: () => Navigator.of(context).maybePop(),
              ),
            )
          : null,
      body: SafeArea(
        child: Row(
          children: <Widget>[
            if (!isMobile)
              AnimatedContainer(
                duration: AppDurations.medium,
                curve: Curves.easeInOut,
                width: isTablet
                    ? AppSizes.sidebarCollapsedWidth
                    : AppSizes.sidebarWidth,
                child: Sidebar(
                  currentRoute: widget.currentRoute,
                  collapsed: isTablet,
                ),
              ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? AppSpacing.md : AppSpacing.lg,
                    ),
                    child: TopBar(
                      title: _title,
                      onMenuTap: isMobile
                          ? () => _scaffoldKey.currentState?.openDrawer()
                          : null,
                    ),
                  ),
                  Expanded(child: widget.child),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
