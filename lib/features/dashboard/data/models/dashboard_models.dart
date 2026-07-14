import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_models.freezed.dart';
part 'dashboard_models.g.dart';

/// Data-transfer objects for the dashboard feature.
///
/// These are immutable Freezed classes with `json_serializable` `fromJson`
/// factories. They live in the data layer and are mapped to pure domain
/// entities by `model_mappers.dart`, so the domain never depends on JSON shape.

@freezed
class UserProfileModel with _$UserProfileModel {
  const factory UserProfileModel({
    required String name,
    required String role,
    @JsonKey(name: 'avatar_url') @Default('') String avatarUrl,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);
}

@freezed
class HeroProjectModel with _$HeroProjectModel {
  const factory HeroProjectModel({
    required String tag,
    required String title,
    required String description,
    @JsonKey(name: 'cta_label') @Default('Learn More.') String ctaLabel,
  }) = _HeroProjectModel;

  factory HeroProjectModel.fromJson(Map<String, dynamic> json) =>
      _$HeroProjectModelFromJson(json);
}

@freezed
class ProjectModel with _$ProjectModel {
  const factory ProjectModel({
    required String id,
    required String title,
    @JsonKey(name: 'project_number') required String projectNumber,
    required String subtitle,
    @JsonKey(name: 'thumbnail_url') @Default('') String thumbnailUrl,
    @JsonKey(name: 'is_featured') @Default(false) bool isFeatured,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);
}

@freezed
class CreatorModel with _$CreatorModel {
  const factory CreatorModel({
    required String id,
    required String username,
    @JsonKey(name: 'avatar_url') @Default('') String avatarUrl,
    required int artworks,
    required double rating,
  }) = _CreatorModel;

  factory CreatorModel.fromJson(Map<String, dynamic> json) =>
      _$CreatorModelFromJson(json);
}

@freezed
class PerformancePointModel with _$PerformancePointModel {
  const factory PerformancePointModel({
    required int year,
    required double pending,
    required double done,
  }) = _PerformancePointModel;

  factory PerformancePointModel.fromJson(Map<String, dynamic> json) =>
      _$PerformancePointModelFromJson(json);
}

@freezed
class PersonModel with _$PersonModel {
  const factory PersonModel({
    required String id,
    required String name,
    @JsonKey(name: 'avatar_url') @Default('') String avatarUrl,
  }) = _PersonModel;

  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);
}

@freezed
class CelebrationGroupModel with _$CelebrationGroupModel {
  const factory CelebrationGroupModel({
    required String title,
    @Default(<PersonModel>[]) List<PersonModel> people,
  }) = _CelebrationGroupModel;

  factory CelebrationGroupModel.fromJson(Map<String, dynamic> json) =>
      _$CelebrationGroupModelFromJson(json);
}

@freezed
class CalendarInfoModel with _$CalendarInfoModel {
  const factory CalendarInfoModel({
    required int year,
    required int month,
    required int today,
    @JsonKey(name: 'highlighted_days')
    @Default(<int>[])
    List<int> highlightedDays,
    @JsonKey(name: 'schedule_label') @Default('') String scheduleLabel,
  }) = _CalendarInfoModel;

  factory CalendarInfoModel.fromJson(Map<String, dynamic> json) =>
      _$CalendarInfoModelFromJson(json);
}

@freezed
class DashboardResponseModel with _$DashboardResponseModel {
  const factory DashboardResponseModel({
    required UserProfileModel user,
    required HeroProjectModel hero,
    @Default(<ProjectModel>[]) List<ProjectModel> projects,
    @Default(<CreatorModel>[]) List<CreatorModel> creators,
    @Default(<PerformancePointModel>[]) List<PerformancePointModel> performance,
    required CalendarInfoModel calendar,
    required CelebrationGroupModel birthdays,
    required CelebrationGroupModel anniversaries,
  }) = _DashboardResponseModel;

  factory DashboardResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardResponseModelFromJson(json);
}
