import '../../domain/entities/calendar_info.dart';
import '../../domain/entities/creator.dart';
import '../../domain/entities/dashboard_data.dart';
import '../../domain/entities/hero_project.dart';
import '../../domain/entities/performance_point.dart';
import '../../domain/entities/person.dart';
import '../../domain/entities/project.dart';
import '../../domain/entities/user_profile.dart';
import 'dashboard_models.dart';

/// Mapping extensions that convert data-layer models into pure domain entities.
///
/// Isolating the translation here keeps both the models (JSON-aware) and the
/// entities (framework-free) focused on their single responsibility.
extension UserProfileMapper on UserProfileModel {
  UserProfile toEntity() =>
      UserProfile(name: name, role: role, avatarUrl: avatarUrl);
}

extension HeroProjectMapper on HeroProjectModel {
  HeroProject toEntity() => HeroProject(
        tag: tag,
        title: title,
        description: description,
        ctaLabel: ctaLabel,
      );
}

extension ProjectMapper on ProjectModel {
  Project toEntity() => Project(
        id: id,
        title: title,
        projectNumber: projectNumber,
        subtitle: subtitle,
        thumbnailUrl: thumbnailUrl,
        isFeatured: isFeatured,
      );
}

extension CreatorMapper on CreatorModel {
  Creator toEntity() => Creator(
        id: id,
        username: username,
        avatarUrl: avatarUrl,
        artworks: artworks,
        rating: rating.clamp(0.0, 1.0),
      );
}

extension PerformancePointMapper on PerformancePointModel {
  PerformancePoint toEntity() =>
      PerformancePoint(year: year, pending: pending, done: done);
}

extension PersonMapper on PersonModel {
  Person toEntity() => Person(id: id, name: name, avatarUrl: avatarUrl);
}

extension CelebrationGroupMapper on CelebrationGroupModel {
  CelebrationGroup toEntity() => CelebrationGroup(
        title: title,
        people: people.map((PersonModel p) => p.toEntity()).toList(),
      );
}

extension CalendarInfoMapper on CalendarInfoModel {
  CalendarInfo toEntity() => CalendarInfo(
        year: year,
        month: month,
        today: today,
        highlightedDays: highlightedDays,
        scheduleLabel: scheduleLabel,
      );
}

extension DashboardResponseMapper on DashboardResponseModel {
  DashboardData toEntity() => DashboardData(
        user: user.toEntity(),
        hero: hero.toEntity(),
        projects: projects.map((ProjectModel p) => p.toEntity()).toList(),
        creators: creators.map((CreatorModel c) => c.toEntity()).toList(),
        performance: performance
            .map((PerformancePointModel p) => p.toEntity())
            .toList(),
        calendar: calendar.toEntity(),
        birthdays: birthdays.toEntity(),
        anniversaries: anniversaries.toEntity(),
      );
}
