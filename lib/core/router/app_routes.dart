import 'package:flutter/material.dart';

/// Canonical route paths + names. Referencing these constants avoids typo-prone
/// string literals at every `context.go(...)` call site.
abstract final class AppRoutes {
  const AppRoutes._();

  static const String home = '/';
  static const String employees = '/employees';
  static const String attendance = '/attendance';
  static const String summary = '/summary';
  static const String information = '/information';
  static const String settings = '/settings';
}

/// A single primary navigation entry shown in the sidebar / drawer.
@immutable
class NavDestination {
  const NavDestination({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.route,
  });

  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final String route;
}

/// The primary destinations rendered in the sidebar, in display order.
const List<NavDestination> kPrimaryDestinations = <NavDestination>[
  NavDestination(
    label: 'Home',
    icon: Icons.home_outlined,
    selectedIcon: Icons.home_rounded,
    route: AppRoutes.home,
  ),
  NavDestination(
    label: 'Employees',
    icon: Icons.groups_outlined,
    selectedIcon: Icons.groups_rounded,
    route: AppRoutes.employees,
  ),
  NavDestination(
    label: 'Attendance',
    icon: Icons.checklist_rtl_outlined,
    selectedIcon: Icons.checklist_rtl_rounded,
    route: AppRoutes.attendance,
  ),
  NavDestination(
    label: 'Summary',
    icon: Icons.calendar_month_outlined,
    selectedIcon: Icons.calendar_month_rounded,
    route: AppRoutes.summary,
  ),
  NavDestination(
    label: 'Information',
    icon: Icons.info_outline_rounded,
    selectedIcon: Icons.info_rounded,
    route: AppRoutes.information,
  ),
];
