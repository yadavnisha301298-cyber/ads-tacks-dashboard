import 'calendar_info.dart';
import 'creator.dart';
import 'hero_project.dart';
import 'performance_point.dart';
import 'person.dart';
import 'project.dart';
import 'user_profile.dart';

/// Aggregate root that bundles every piece of data the dashboard needs.
///
/// Fetching it as one object keeps the presentation layer simple: a single
/// async provider yields everything the home screen renders.
class DashboardData {
  const DashboardData({
    required this.user,
    required this.hero,
    required this.projects,
    required this.creators,
    required this.performance,
    required this.calendar,
    required this.birthdays,
    required this.anniversaries,
  });

  final UserProfile user;
  final HeroProject hero;
  final List<Project> projects;
  final List<Creator> creators;
  final List<PerformancePoint> performance;
  final CalendarInfo calendar;
  final CelebrationGroup birthdays;
  final CelebrationGroup anniversaries;
}
