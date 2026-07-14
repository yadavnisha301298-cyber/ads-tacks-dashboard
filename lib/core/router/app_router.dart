import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/shell/presentation/pages/app_shell.dart';
import '../constants/app_constants.dart';
import '../widgets/placeholder_page.dart';
import 'app_routes.dart';

/// Central [GoRouter] configuration.
///
/// A [ShellRoute] keeps the [AppShell] (sidebar + top bar) mounted while the
/// inner page changes, giving smooth, app-like navigation with custom
/// transitions on every route.
abstract final class AppRouter {
  const AppRouter._();

  static GoRouter create() {
    return GoRouter(
      initialLocation: AppRoutes.home,
      routes: <RouteBase>[
        ShellRoute(
          builder: (BuildContext context, GoRouterState state, Widget child) {
            return AppShell(
              currentRoute: state.matchedLocation,
              child: child,
            );
          },
          routes: <RouteBase>[
            _fade(AppRoutes.home, const DashboardPage()),
            _fade(
              AppRoutes.employees,
              const PlaceholderPage(
                title: 'Employees',
                icon: Icons.groups_rounded,
              ),
            ),
            _fade(
              AppRoutes.attendance,
              const PlaceholderPage(
                title: 'Attendance',
                icon: Icons.checklist_rtl_rounded,
              ),
            ),
            _fade(
              AppRoutes.summary,
              const PlaceholderPage(
                title: 'Summary',
                icon: Icons.calendar_month_rounded,
              ),
            ),
            _fade(
              AppRoutes.information,
              const PlaceholderPage(
                title: 'Information',
                icon: Icons.info_rounded,
              ),
            ),
            _fade(
              AppRoutes.settings,
              const PlaceholderPage(
                title: 'Setting',
                icon: Icons.settings_rounded,
              ),
            ),
          ],
        ),
      ],
      errorBuilder: (BuildContext context, GoRouterState state) =>
          const PlaceholderPage(
        title: 'Page not found',
        icon: Icons.error_outline_rounded,
        description: 'The page you are looking for does not exist.',
      ),
    );
  }

  /// Builds a route with a shared fade-through transition.
  static GoRoute _fade(String path, Widget child) {
    return GoRoute(
      path: path,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          transitionDuration: AppDurations.medium,
          child: child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeOut).animate(animation),
              child: child,
            );
          },
        );
      },
    );
  }
}
