// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileModelImpl _$$UserProfileModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProfileModelImpl(
      name: json['name'] as String,
      role: json['role'] as String,
      avatarUrl: json['avatar_url'] as String? ?? '',
    );

Map<String, dynamic> _$$UserProfileModelImplToJson(
        _$UserProfileModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'role': instance.role,
      'avatar_url': instance.avatarUrl,
    };

_$HeroProjectModelImpl _$$HeroProjectModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HeroProjectModelImpl(
      tag: json['tag'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      ctaLabel: json['cta_label'] as String? ?? 'Learn More.',
    );

Map<String, dynamic> _$$HeroProjectModelImplToJson(
        _$HeroProjectModelImpl instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'title': instance.title,
      'description': instance.description,
      'cta_label': instance.ctaLabel,
    };

_$ProjectModelImpl _$$ProjectModelImplFromJson(Map<String, dynamic> json) =>
    _$ProjectModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      projectNumber: json['project_number'] as String,
      subtitle: json['subtitle'] as String,
      thumbnailUrl: json['thumbnail_url'] as String? ?? '',
      isFeatured: json['is_featured'] as bool? ?? false,
    );

Map<String, dynamic> _$$ProjectModelImplToJson(_$ProjectModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'project_number': instance.projectNumber,
      'subtitle': instance.subtitle,
      'thumbnail_url': instance.thumbnailUrl,
      'is_featured': instance.isFeatured,
    };

_$CreatorModelImpl _$$CreatorModelImplFromJson(Map<String, dynamic> json) =>
    _$CreatorModelImpl(
      id: json['id'] as String,
      username: json['username'] as String,
      avatarUrl: json['avatar_url'] as String? ?? '',
      artworks: (json['artworks'] as num).toInt(),
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$$CreatorModelImplToJson(_$CreatorModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'avatar_url': instance.avatarUrl,
      'artworks': instance.artworks,
      'rating': instance.rating,
    };

_$PerformancePointModelImpl _$$PerformancePointModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PerformancePointModelImpl(
      year: (json['year'] as num).toInt(),
      pending: (json['pending'] as num).toDouble(),
      done: (json['done'] as num).toDouble(),
    );

Map<String, dynamic> _$$PerformancePointModelImplToJson(
        _$PerformancePointModelImpl instance) =>
    <String, dynamic>{
      'year': instance.year,
      'pending': instance.pending,
      'done': instance.done,
    };

_$PersonModelImpl _$$PersonModelImplFromJson(Map<String, dynamic> json) =>
    _$PersonModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      avatarUrl: json['avatar_url'] as String? ?? '',
    );

Map<String, dynamic> _$$PersonModelImplToJson(_$PersonModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar_url': instance.avatarUrl,
    };

_$CelebrationGroupModelImpl _$$CelebrationGroupModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CelebrationGroupModelImpl(
      title: json['title'] as String,
      people: (json['people'] as List<dynamic>?)
              ?.map((e) => PersonModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PersonModel>[],
    );

Map<String, dynamic> _$$CelebrationGroupModelImplToJson(
        _$CelebrationGroupModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'people': instance.people,
    };

_$CalendarInfoModelImpl _$$CalendarInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CalendarInfoModelImpl(
      year: (json['year'] as num).toInt(),
      month: (json['month'] as num).toInt(),
      today: (json['today'] as num).toInt(),
      highlightedDays: (json['highlighted_days'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const <int>[],
      scheduleLabel: json['schedule_label'] as String? ?? '',
    );

Map<String, dynamic> _$$CalendarInfoModelImplToJson(
        _$CalendarInfoModelImpl instance) =>
    <String, dynamic>{
      'year': instance.year,
      'month': instance.month,
      'today': instance.today,
      'highlighted_days': instance.highlightedDays,
      'schedule_label': instance.scheduleLabel,
    };

_$DashboardResponseModelImpl _$$DashboardResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardResponseModelImpl(
      user: UserProfileModel.fromJson(json['user'] as Map<String, dynamic>),
      hero: HeroProjectModel.fromJson(json['hero'] as Map<String, dynamic>),
      projects: (json['projects'] as List<dynamic>?)
              ?.map((e) => ProjectModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProjectModel>[],
      creators: (json['creators'] as List<dynamic>?)
              ?.map((e) => CreatorModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <CreatorModel>[],
      performance: (json['performance'] as List<dynamic>?)
              ?.map((e) =>
                  PerformancePointModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PerformancePointModel>[],
      calendar:
          CalendarInfoModel.fromJson(json['calendar'] as Map<String, dynamic>),
      birthdays: CelebrationGroupModel.fromJson(
          json['birthdays'] as Map<String, dynamic>),
      anniversaries: CelebrationGroupModel.fromJson(
          json['anniversaries'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DashboardResponseModelImplToJson(
        _$DashboardResponseModelImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'hero': instance.hero,
      'projects': instance.projects,
      'creators': instance.creators,
      'performance': instance.performance,
      'calendar': instance.calendar,
      'birthdays': instance.birthdays,
      'anniversaries': instance.anniversaries,
    };
