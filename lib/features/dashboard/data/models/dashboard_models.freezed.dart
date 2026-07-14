// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) {
  return _UserProfileModel.fromJson(json);
}

/// @nodoc
mixin _$UserProfileModel {
  String get name => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String get avatarUrl => throw _privateConstructorUsedError;

  /// Serializes this UserProfileModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileModelCopyWith<UserProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileModelCopyWith<$Res> {
  factory $UserProfileModelCopyWith(
          UserProfileModel value, $Res Function(UserProfileModel) then) =
      _$UserProfileModelCopyWithImpl<$Res, UserProfileModel>;
  @useResult
  $Res call(
      {String name,
      String role,
      @JsonKey(name: 'avatar_url') String avatarUrl});
}

/// @nodoc
class _$UserProfileModelCopyWithImpl<$Res, $Val extends UserProfileModel>
    implements $UserProfileModelCopyWith<$Res> {
  _$UserProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? role = null,
    Object? avatarUrl = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfileModelImplCopyWith<$Res>
    implements $UserProfileModelCopyWith<$Res> {
  factory _$$UserProfileModelImplCopyWith(_$UserProfileModelImpl value,
          $Res Function(_$UserProfileModelImpl) then) =
      __$$UserProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String role,
      @JsonKey(name: 'avatar_url') String avatarUrl});
}

/// @nodoc
class __$$UserProfileModelImplCopyWithImpl<$Res>
    extends _$UserProfileModelCopyWithImpl<$Res, _$UserProfileModelImpl>
    implements _$$UserProfileModelImplCopyWith<$Res> {
  __$$UserProfileModelImplCopyWithImpl(_$UserProfileModelImpl _value,
      $Res Function(_$UserProfileModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? role = null,
    Object? avatarUrl = null,
  }) {
    return _then(_$UserProfileModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileModelImpl implements _UserProfileModel {
  const _$UserProfileModelImpl(
      {required this.name,
      required this.role,
      @JsonKey(name: 'avatar_url') this.avatarUrl = ''});

  factory _$UserProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileModelImplFromJson(json);

  @override
  final String name;
  @override
  final String role;
  @override
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;

  @override
  String toString() {
    return 'UserProfileModel(name: $name, role: $role, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, role, avatarUrl);

  /// Create a copy of UserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileModelImplCopyWith<_$UserProfileModelImpl> get copyWith =>
      __$$UserProfileModelImplCopyWithImpl<_$UserProfileModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileModelImplToJson(
      this,
    );
  }
}

abstract class _UserProfileModel implements UserProfileModel {
  const factory _UserProfileModel(
          {required final String name,
          required final String role,
          @JsonKey(name: 'avatar_url') final String avatarUrl}) =
      _$UserProfileModelImpl;

  factory _UserProfileModel.fromJson(Map<String, dynamic> json) =
      _$UserProfileModelImpl.fromJson;

  @override
  String get name;
  @override
  String get role;
  @override
  @JsonKey(name: 'avatar_url')
  String get avatarUrl;

  /// Create a copy of UserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileModelImplCopyWith<_$UserProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HeroProjectModel _$HeroProjectModelFromJson(Map<String, dynamic> json) {
  return _HeroProjectModel.fromJson(json);
}

/// @nodoc
mixin _$HeroProjectModel {
  String get tag => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'cta_label')
  String get ctaLabel => throw _privateConstructorUsedError;

  /// Serializes this HeroProjectModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HeroProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HeroProjectModelCopyWith<HeroProjectModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeroProjectModelCopyWith<$Res> {
  factory $HeroProjectModelCopyWith(
          HeroProjectModel value, $Res Function(HeroProjectModel) then) =
      _$HeroProjectModelCopyWithImpl<$Res, HeroProjectModel>;
  @useResult
  $Res call(
      {String tag,
      String title,
      String description,
      @JsonKey(name: 'cta_label') String ctaLabel});
}

/// @nodoc
class _$HeroProjectModelCopyWithImpl<$Res, $Val extends HeroProjectModel>
    implements $HeroProjectModelCopyWith<$Res> {
  _$HeroProjectModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HeroProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = null,
    Object? title = null,
    Object? description = null,
    Object? ctaLabel = null,
  }) {
    return _then(_value.copyWith(
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ctaLabel: null == ctaLabel
          ? _value.ctaLabel
          : ctaLabel // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HeroProjectModelImplCopyWith<$Res>
    implements $HeroProjectModelCopyWith<$Res> {
  factory _$$HeroProjectModelImplCopyWith(_$HeroProjectModelImpl value,
          $Res Function(_$HeroProjectModelImpl) then) =
      __$$HeroProjectModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String tag,
      String title,
      String description,
      @JsonKey(name: 'cta_label') String ctaLabel});
}

/// @nodoc
class __$$HeroProjectModelImplCopyWithImpl<$Res>
    extends _$HeroProjectModelCopyWithImpl<$Res, _$HeroProjectModelImpl>
    implements _$$HeroProjectModelImplCopyWith<$Res> {
  __$$HeroProjectModelImplCopyWithImpl(_$HeroProjectModelImpl _value,
      $Res Function(_$HeroProjectModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of HeroProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = null,
    Object? title = null,
    Object? description = null,
    Object? ctaLabel = null,
  }) {
    return _then(_$HeroProjectModelImpl(
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ctaLabel: null == ctaLabel
          ? _value.ctaLabel
          : ctaLabel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HeroProjectModelImpl implements _HeroProjectModel {
  const _$HeroProjectModelImpl(
      {required this.tag,
      required this.title,
      required this.description,
      @JsonKey(name: 'cta_label') this.ctaLabel = 'Learn More.'});

  factory _$HeroProjectModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HeroProjectModelImplFromJson(json);

  @override
  final String tag;
  @override
  final String title;
  @override
  final String description;
  @override
  @JsonKey(name: 'cta_label')
  final String ctaLabel;

  @override
  String toString() {
    return 'HeroProjectModel(tag: $tag, title: $title, description: $description, ctaLabel: $ctaLabel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeroProjectModelImpl &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.ctaLabel, ctaLabel) ||
                other.ctaLabel == ctaLabel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, tag, title, description, ctaLabel);

  /// Create a copy of HeroProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HeroProjectModelImplCopyWith<_$HeroProjectModelImpl> get copyWith =>
      __$$HeroProjectModelImplCopyWithImpl<_$HeroProjectModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HeroProjectModelImplToJson(
      this,
    );
  }
}

abstract class _HeroProjectModel implements HeroProjectModel {
  const factory _HeroProjectModel(
          {required final String tag,
          required final String title,
          required final String description,
          @JsonKey(name: 'cta_label') final String ctaLabel}) =
      _$HeroProjectModelImpl;

  factory _HeroProjectModel.fromJson(Map<String, dynamic> json) =
      _$HeroProjectModelImpl.fromJson;

  @override
  String get tag;
  @override
  String get title;
  @override
  String get description;
  @override
  @JsonKey(name: 'cta_label')
  String get ctaLabel;

  /// Create a copy of HeroProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HeroProjectModelImplCopyWith<_$HeroProjectModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) {
  return _ProjectModel.fromJson(json);
}

/// @nodoc
mixin _$ProjectModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'project_number')
  String get projectNumber => throw _privateConstructorUsedError;
  String get subtitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbnail_url')
  String get thumbnailUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_featured')
  bool get isFeatured => throw _privateConstructorUsedError;

  /// Serializes this ProjectModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectModelCopyWith<ProjectModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectModelCopyWith<$Res> {
  factory $ProjectModelCopyWith(
          ProjectModel value, $Res Function(ProjectModel) then) =
      _$ProjectModelCopyWithImpl<$Res, ProjectModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      @JsonKey(name: 'project_number') String projectNumber,
      String subtitle,
      @JsonKey(name: 'thumbnail_url') String thumbnailUrl,
      @JsonKey(name: 'is_featured') bool isFeatured});
}

/// @nodoc
class _$ProjectModelCopyWithImpl<$Res, $Val extends ProjectModel>
    implements $ProjectModelCopyWith<$Res> {
  _$ProjectModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? projectNumber = null,
    Object? subtitle = null,
    Object? thumbnailUrl = null,
    Object? isFeatured = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      projectNumber: null == projectNumber
          ? _value.projectNumber
          : projectNumber // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectModelImplCopyWith<$Res>
    implements $ProjectModelCopyWith<$Res> {
  factory _$$ProjectModelImplCopyWith(
          _$ProjectModelImpl value, $Res Function(_$ProjectModelImpl) then) =
      __$$ProjectModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      @JsonKey(name: 'project_number') String projectNumber,
      String subtitle,
      @JsonKey(name: 'thumbnail_url') String thumbnailUrl,
      @JsonKey(name: 'is_featured') bool isFeatured});
}

/// @nodoc
class __$$ProjectModelImplCopyWithImpl<$Res>
    extends _$ProjectModelCopyWithImpl<$Res, _$ProjectModelImpl>
    implements _$$ProjectModelImplCopyWith<$Res> {
  __$$ProjectModelImplCopyWithImpl(
      _$ProjectModelImpl _value, $Res Function(_$ProjectModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? projectNumber = null,
    Object? subtitle = null,
    Object? thumbnailUrl = null,
    Object? isFeatured = null,
  }) {
    return _then(_$ProjectModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      projectNumber: null == projectNumber
          ? _value.projectNumber
          : projectNumber // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectModelImpl implements _ProjectModel {
  const _$ProjectModelImpl(
      {required this.id,
      required this.title,
      @JsonKey(name: 'project_number') required this.projectNumber,
      required this.subtitle,
      @JsonKey(name: 'thumbnail_url') this.thumbnailUrl = '',
      @JsonKey(name: 'is_featured') this.isFeatured = false});

  factory _$ProjectModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  @JsonKey(name: 'project_number')
  final String projectNumber;
  @override
  final String subtitle;
  @override
  @JsonKey(name: 'thumbnail_url')
  final String thumbnailUrl;
  @override
  @JsonKey(name: 'is_featured')
  final bool isFeatured;

  @override
  String toString() {
    return 'ProjectModel(id: $id, title: $title, projectNumber: $projectNumber, subtitle: $subtitle, thumbnailUrl: $thumbnailUrl, isFeatured: $isFeatured)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.projectNumber, projectNumber) ||
                other.projectNumber == projectNumber) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, projectNumber,
      subtitle, thumbnailUrl, isFeatured);

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectModelImplCopyWith<_$ProjectModelImpl> get copyWith =>
      __$$ProjectModelImplCopyWithImpl<_$ProjectModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectModelImplToJson(
      this,
    );
  }
}

abstract class _ProjectModel implements ProjectModel {
  const factory _ProjectModel(
          {required final String id,
          required final String title,
          @JsonKey(name: 'project_number') required final String projectNumber,
          required final String subtitle,
          @JsonKey(name: 'thumbnail_url') final String thumbnailUrl,
          @JsonKey(name: 'is_featured') final bool isFeatured}) =
      _$ProjectModelImpl;

  factory _ProjectModel.fromJson(Map<String, dynamic> json) =
      _$ProjectModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  @JsonKey(name: 'project_number')
  String get projectNumber;
  @override
  String get subtitle;
  @override
  @JsonKey(name: 'thumbnail_url')
  String get thumbnailUrl;
  @override
  @JsonKey(name: 'is_featured')
  bool get isFeatured;

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectModelImplCopyWith<_$ProjectModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreatorModel _$CreatorModelFromJson(Map<String, dynamic> json) {
  return _CreatorModel.fromJson(json);
}

/// @nodoc
mixin _$CreatorModel {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String get avatarUrl => throw _privateConstructorUsedError;
  int get artworks => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;

  /// Serializes this CreatorModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreatorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreatorModelCopyWith<CreatorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatorModelCopyWith<$Res> {
  factory $CreatorModelCopyWith(
          CreatorModel value, $Res Function(CreatorModel) then) =
      _$CreatorModelCopyWithImpl<$Res, CreatorModel>;
  @useResult
  $Res call(
      {String id,
      String username,
      @JsonKey(name: 'avatar_url') String avatarUrl,
      int artworks,
      double rating});
}

/// @nodoc
class _$CreatorModelCopyWithImpl<$Res, $Val extends CreatorModel>
    implements $CreatorModelCopyWith<$Res> {
  _$CreatorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreatorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? avatarUrl = null,
    Object? artworks = null,
    Object? rating = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      artworks: null == artworks
          ? _value.artworks
          : artworks // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreatorModelImplCopyWith<$Res>
    implements $CreatorModelCopyWith<$Res> {
  factory _$$CreatorModelImplCopyWith(
          _$CreatorModelImpl value, $Res Function(_$CreatorModelImpl) then) =
      __$$CreatorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String username,
      @JsonKey(name: 'avatar_url') String avatarUrl,
      int artworks,
      double rating});
}

/// @nodoc
class __$$CreatorModelImplCopyWithImpl<$Res>
    extends _$CreatorModelCopyWithImpl<$Res, _$CreatorModelImpl>
    implements _$$CreatorModelImplCopyWith<$Res> {
  __$$CreatorModelImplCopyWithImpl(
      _$CreatorModelImpl _value, $Res Function(_$CreatorModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreatorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? avatarUrl = null,
    Object? artworks = null,
    Object? rating = null,
  }) {
    return _then(_$CreatorModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      artworks: null == artworks
          ? _value.artworks
          : artworks // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatorModelImpl implements _CreatorModel {
  const _$CreatorModelImpl(
      {required this.id,
      required this.username,
      @JsonKey(name: 'avatar_url') this.avatarUrl = '',
      required this.artworks,
      required this.rating});

  factory _$CreatorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatorModelImplFromJson(json);

  @override
  final String id;
  @override
  final String username;
  @override
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;
  @override
  final int artworks;
  @override
  final double rating;

  @override
  String toString() {
    return 'CreatorModel(id: $id, username: $username, avatarUrl: $avatarUrl, artworks: $artworks, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatorModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.artworks, artworks) ||
                other.artworks == artworks) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, username, avatarUrl, artworks, rating);

  /// Create a copy of CreatorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatorModelImplCopyWith<_$CreatorModelImpl> get copyWith =>
      __$$CreatorModelImplCopyWithImpl<_$CreatorModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatorModelImplToJson(
      this,
    );
  }
}

abstract class _CreatorModel implements CreatorModel {
  const factory _CreatorModel(
      {required final String id,
      required final String username,
      @JsonKey(name: 'avatar_url') final String avatarUrl,
      required final int artworks,
      required final double rating}) = _$CreatorModelImpl;

  factory _CreatorModel.fromJson(Map<String, dynamic> json) =
      _$CreatorModelImpl.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  @JsonKey(name: 'avatar_url')
  String get avatarUrl;
  @override
  int get artworks;
  @override
  double get rating;

  /// Create a copy of CreatorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatorModelImplCopyWith<_$CreatorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PerformancePointModel _$PerformancePointModelFromJson(
    Map<String, dynamic> json) {
  return _PerformancePointModel.fromJson(json);
}

/// @nodoc
mixin _$PerformancePointModel {
  int get year => throw _privateConstructorUsedError;
  double get pending => throw _privateConstructorUsedError;
  double get done => throw _privateConstructorUsedError;

  /// Serializes this PerformancePointModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PerformancePointModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PerformancePointModelCopyWith<PerformancePointModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerformancePointModelCopyWith<$Res> {
  factory $PerformancePointModelCopyWith(PerformancePointModel value,
          $Res Function(PerformancePointModel) then) =
      _$PerformancePointModelCopyWithImpl<$Res, PerformancePointModel>;
  @useResult
  $Res call({int year, double pending, double done});
}

/// @nodoc
class _$PerformancePointModelCopyWithImpl<$Res,
        $Val extends PerformancePointModel>
    implements $PerformancePointModelCopyWith<$Res> {
  _$PerformancePointModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PerformancePointModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? pending = null,
    Object? done = null,
  }) {
    return _then(_value.copyWith(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      pending: null == pending
          ? _value.pending
          : pending // ignore: cast_nullable_to_non_nullable
              as double,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PerformancePointModelImplCopyWith<$Res>
    implements $PerformancePointModelCopyWith<$Res> {
  factory _$$PerformancePointModelImplCopyWith(
          _$PerformancePointModelImpl value,
          $Res Function(_$PerformancePointModelImpl) then) =
      __$$PerformancePointModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int year, double pending, double done});
}

/// @nodoc
class __$$PerformancePointModelImplCopyWithImpl<$Res>
    extends _$PerformancePointModelCopyWithImpl<$Res,
        _$PerformancePointModelImpl>
    implements _$$PerformancePointModelImplCopyWith<$Res> {
  __$$PerformancePointModelImplCopyWithImpl(_$PerformancePointModelImpl _value,
      $Res Function(_$PerformancePointModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PerformancePointModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? pending = null,
    Object? done = null,
  }) {
    return _then(_$PerformancePointModelImpl(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      pending: null == pending
          ? _value.pending
          : pending // ignore: cast_nullable_to_non_nullable
              as double,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PerformancePointModelImpl implements _PerformancePointModel {
  const _$PerformancePointModelImpl(
      {required this.year, required this.pending, required this.done});

  factory _$PerformancePointModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PerformancePointModelImplFromJson(json);

  @override
  final int year;
  @override
  final double pending;
  @override
  final double done;

  @override
  String toString() {
    return 'PerformancePointModel(year: $year, pending: $pending, done: $done)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformancePointModelImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.pending, pending) || other.pending == pending) &&
            (identical(other.done, done) || other.done == done));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, year, pending, done);

  /// Create a copy of PerformancePointModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PerformancePointModelImplCopyWith<_$PerformancePointModelImpl>
      get copyWith => __$$PerformancePointModelImplCopyWithImpl<
          _$PerformancePointModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PerformancePointModelImplToJson(
      this,
    );
  }
}

abstract class _PerformancePointModel implements PerformancePointModel {
  const factory _PerformancePointModel(
      {required final int year,
      required final double pending,
      required final double done}) = _$PerformancePointModelImpl;

  factory _PerformancePointModel.fromJson(Map<String, dynamic> json) =
      _$PerformancePointModelImpl.fromJson;

  @override
  int get year;
  @override
  double get pending;
  @override
  double get done;

  /// Create a copy of PerformancePointModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PerformancePointModelImplCopyWith<_$PerformancePointModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PersonModel _$PersonModelFromJson(Map<String, dynamic> json) {
  return _PersonModel.fromJson(json);
}

/// @nodoc
mixin _$PersonModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String get avatarUrl => throw _privateConstructorUsedError;

  /// Serializes this PersonModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PersonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonModelCopyWith<PersonModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonModelCopyWith<$Res> {
  factory $PersonModelCopyWith(
          PersonModel value, $Res Function(PersonModel) then) =
      _$PersonModelCopyWithImpl<$Res, PersonModel>;
  @useResult
  $Res call(
      {String id, String name, @JsonKey(name: 'avatar_url') String avatarUrl});
}

/// @nodoc
class _$PersonModelCopyWithImpl<$Res, $Val extends PersonModel>
    implements $PersonModelCopyWith<$Res> {
  _$PersonModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PersonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatarUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonModelImplCopyWith<$Res>
    implements $PersonModelCopyWith<$Res> {
  factory _$$PersonModelImplCopyWith(
          _$PersonModelImpl value, $Res Function(_$PersonModelImpl) then) =
      __$$PersonModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, @JsonKey(name: 'avatar_url') String avatarUrl});
}

/// @nodoc
class __$$PersonModelImplCopyWithImpl<$Res>
    extends _$PersonModelCopyWithImpl<$Res, _$PersonModelImpl>
    implements _$$PersonModelImplCopyWith<$Res> {
  __$$PersonModelImplCopyWithImpl(
      _$PersonModelImpl _value, $Res Function(_$PersonModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PersonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatarUrl = null,
  }) {
    return _then(_$PersonModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonModelImpl implements _PersonModel {
  const _$PersonModelImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'avatar_url') this.avatarUrl = ''});

  factory _$PersonModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;

  @override
  String toString() {
    return 'PersonModel(id: $id, name: $name, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, avatarUrl);

  /// Create a copy of PersonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonModelImplCopyWith<_$PersonModelImpl> get copyWith =>
      __$$PersonModelImplCopyWithImpl<_$PersonModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonModelImplToJson(
      this,
    );
  }
}

abstract class _PersonModel implements PersonModel {
  const factory _PersonModel(
      {required final String id,
      required final String name,
      @JsonKey(name: 'avatar_url') final String avatarUrl}) = _$PersonModelImpl;

  factory _PersonModel.fromJson(Map<String, dynamic> json) =
      _$PersonModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'avatar_url')
  String get avatarUrl;

  /// Create a copy of PersonModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonModelImplCopyWith<_$PersonModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CelebrationGroupModel _$CelebrationGroupModelFromJson(
    Map<String, dynamic> json) {
  return _CelebrationGroupModel.fromJson(json);
}

/// @nodoc
mixin _$CelebrationGroupModel {
  String get title => throw _privateConstructorUsedError;
  List<PersonModel> get people => throw _privateConstructorUsedError;

  /// Serializes this CelebrationGroupModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CelebrationGroupModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CelebrationGroupModelCopyWith<CelebrationGroupModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CelebrationGroupModelCopyWith<$Res> {
  factory $CelebrationGroupModelCopyWith(CelebrationGroupModel value,
          $Res Function(CelebrationGroupModel) then) =
      _$CelebrationGroupModelCopyWithImpl<$Res, CelebrationGroupModel>;
  @useResult
  $Res call({String title, List<PersonModel> people});
}

/// @nodoc
class _$CelebrationGroupModelCopyWithImpl<$Res,
        $Val extends CelebrationGroupModel>
    implements $CelebrationGroupModelCopyWith<$Res> {
  _$CelebrationGroupModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CelebrationGroupModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? people = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      people: null == people
          ? _value.people
          : people // ignore: cast_nullable_to_non_nullable
              as List<PersonModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CelebrationGroupModelImplCopyWith<$Res>
    implements $CelebrationGroupModelCopyWith<$Res> {
  factory _$$CelebrationGroupModelImplCopyWith(
          _$CelebrationGroupModelImpl value,
          $Res Function(_$CelebrationGroupModelImpl) then) =
      __$$CelebrationGroupModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, List<PersonModel> people});
}

/// @nodoc
class __$$CelebrationGroupModelImplCopyWithImpl<$Res>
    extends _$CelebrationGroupModelCopyWithImpl<$Res,
        _$CelebrationGroupModelImpl>
    implements _$$CelebrationGroupModelImplCopyWith<$Res> {
  __$$CelebrationGroupModelImplCopyWithImpl(_$CelebrationGroupModelImpl _value,
      $Res Function(_$CelebrationGroupModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CelebrationGroupModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? people = null,
  }) {
    return _then(_$CelebrationGroupModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      people: null == people
          ? _value._people
          : people // ignore: cast_nullable_to_non_nullable
              as List<PersonModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CelebrationGroupModelImpl implements _CelebrationGroupModel {
  const _$CelebrationGroupModelImpl(
      {required this.title,
      final List<PersonModel> people = const <PersonModel>[]})
      : _people = people;

  factory _$CelebrationGroupModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CelebrationGroupModelImplFromJson(json);

  @override
  final String title;
  final List<PersonModel> _people;
  @override
  @JsonKey()
  List<PersonModel> get people {
    if (_people is EqualUnmodifiableListView) return _people;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_people);
  }

  @override
  String toString() {
    return 'CelebrationGroupModel(title: $title, people: $people)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CelebrationGroupModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._people, _people));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, const DeepCollectionEquality().hash(_people));

  /// Create a copy of CelebrationGroupModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CelebrationGroupModelImplCopyWith<_$CelebrationGroupModelImpl>
      get copyWith => __$$CelebrationGroupModelImplCopyWithImpl<
          _$CelebrationGroupModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CelebrationGroupModelImplToJson(
      this,
    );
  }
}

abstract class _CelebrationGroupModel implements CelebrationGroupModel {
  const factory _CelebrationGroupModel(
      {required final String title,
      final List<PersonModel> people}) = _$CelebrationGroupModelImpl;

  factory _CelebrationGroupModel.fromJson(Map<String, dynamic> json) =
      _$CelebrationGroupModelImpl.fromJson;

  @override
  String get title;
  @override
  List<PersonModel> get people;

  /// Create a copy of CelebrationGroupModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CelebrationGroupModelImplCopyWith<_$CelebrationGroupModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CalendarInfoModel _$CalendarInfoModelFromJson(Map<String, dynamic> json) {
  return _CalendarInfoModel.fromJson(json);
}

/// @nodoc
mixin _$CalendarInfoModel {
  int get year => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  int get today => throw _privateConstructorUsedError;
  @JsonKey(name: 'highlighted_days')
  List<int> get highlightedDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'schedule_label')
  String get scheduleLabel => throw _privateConstructorUsedError;

  /// Serializes this CalendarInfoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CalendarInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CalendarInfoModelCopyWith<CalendarInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarInfoModelCopyWith<$Res> {
  factory $CalendarInfoModelCopyWith(
          CalendarInfoModel value, $Res Function(CalendarInfoModel) then) =
      _$CalendarInfoModelCopyWithImpl<$Res, CalendarInfoModel>;
  @useResult
  $Res call(
      {int year,
      int month,
      int today,
      @JsonKey(name: 'highlighted_days') List<int> highlightedDays,
      @JsonKey(name: 'schedule_label') String scheduleLabel});
}

/// @nodoc
class _$CalendarInfoModelCopyWithImpl<$Res, $Val extends CalendarInfoModel>
    implements $CalendarInfoModelCopyWith<$Res> {
  _$CalendarInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalendarInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? month = null,
    Object? today = null,
    Object? highlightedDays = null,
    Object? scheduleLabel = null,
  }) {
    return _then(_value.copyWith(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      today: null == today
          ? _value.today
          : today // ignore: cast_nullable_to_non_nullable
              as int,
      highlightedDays: null == highlightedDays
          ? _value.highlightedDays
          : highlightedDays // ignore: cast_nullable_to_non_nullable
              as List<int>,
      scheduleLabel: null == scheduleLabel
          ? _value.scheduleLabel
          : scheduleLabel // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalendarInfoModelImplCopyWith<$Res>
    implements $CalendarInfoModelCopyWith<$Res> {
  factory _$$CalendarInfoModelImplCopyWith(_$CalendarInfoModelImpl value,
          $Res Function(_$CalendarInfoModelImpl) then) =
      __$$CalendarInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int year,
      int month,
      int today,
      @JsonKey(name: 'highlighted_days') List<int> highlightedDays,
      @JsonKey(name: 'schedule_label') String scheduleLabel});
}

/// @nodoc
class __$$CalendarInfoModelImplCopyWithImpl<$Res>
    extends _$CalendarInfoModelCopyWithImpl<$Res, _$CalendarInfoModelImpl>
    implements _$$CalendarInfoModelImplCopyWith<$Res> {
  __$$CalendarInfoModelImplCopyWithImpl(_$CalendarInfoModelImpl _value,
      $Res Function(_$CalendarInfoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CalendarInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? month = null,
    Object? today = null,
    Object? highlightedDays = null,
    Object? scheduleLabel = null,
  }) {
    return _then(_$CalendarInfoModelImpl(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      today: null == today
          ? _value.today
          : today // ignore: cast_nullable_to_non_nullable
              as int,
      highlightedDays: null == highlightedDays
          ? _value._highlightedDays
          : highlightedDays // ignore: cast_nullable_to_non_nullable
              as List<int>,
      scheduleLabel: null == scheduleLabel
          ? _value.scheduleLabel
          : scheduleLabel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CalendarInfoModelImpl implements _CalendarInfoModel {
  const _$CalendarInfoModelImpl(
      {required this.year,
      required this.month,
      required this.today,
      @JsonKey(name: 'highlighted_days')
      final List<int> highlightedDays = const <int>[],
      @JsonKey(name: 'schedule_label') this.scheduleLabel = ''})
      : _highlightedDays = highlightedDays;

  factory _$CalendarInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalendarInfoModelImplFromJson(json);

  @override
  final int year;
  @override
  final int month;
  @override
  final int today;
  final List<int> _highlightedDays;
  @override
  @JsonKey(name: 'highlighted_days')
  List<int> get highlightedDays {
    if (_highlightedDays is EqualUnmodifiableListView) return _highlightedDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_highlightedDays);
  }

  @override
  @JsonKey(name: 'schedule_label')
  final String scheduleLabel;

  @override
  String toString() {
    return 'CalendarInfoModel(year: $year, month: $month, today: $today, highlightedDays: $highlightedDays, scheduleLabel: $scheduleLabel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarInfoModelImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.today, today) || other.today == today) &&
            const DeepCollectionEquality()
                .equals(other._highlightedDays, _highlightedDays) &&
            (identical(other.scheduleLabel, scheduleLabel) ||
                other.scheduleLabel == scheduleLabel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, year, month, today,
      const DeepCollectionEquality().hash(_highlightedDays), scheduleLabel);

  /// Create a copy of CalendarInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarInfoModelImplCopyWith<_$CalendarInfoModelImpl> get copyWith =>
      __$$CalendarInfoModelImplCopyWithImpl<_$CalendarInfoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalendarInfoModelImplToJson(
      this,
    );
  }
}

abstract class _CalendarInfoModel implements CalendarInfoModel {
  const factory _CalendarInfoModel(
          {required final int year,
          required final int month,
          required final int today,
          @JsonKey(name: 'highlighted_days') final List<int> highlightedDays,
          @JsonKey(name: 'schedule_label') final String scheduleLabel}) =
      _$CalendarInfoModelImpl;

  factory _CalendarInfoModel.fromJson(Map<String, dynamic> json) =
      _$CalendarInfoModelImpl.fromJson;

  @override
  int get year;
  @override
  int get month;
  @override
  int get today;
  @override
  @JsonKey(name: 'highlighted_days')
  List<int> get highlightedDays;
  @override
  @JsonKey(name: 'schedule_label')
  String get scheduleLabel;

  /// Create a copy of CalendarInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalendarInfoModelImplCopyWith<_$CalendarInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DashboardResponseModel _$DashboardResponseModelFromJson(
    Map<String, dynamic> json) {
  return _DashboardResponseModel.fromJson(json);
}

/// @nodoc
mixin _$DashboardResponseModel {
  UserProfileModel get user => throw _privateConstructorUsedError;
  HeroProjectModel get hero => throw _privateConstructorUsedError;
  List<ProjectModel> get projects => throw _privateConstructorUsedError;
  List<CreatorModel> get creators => throw _privateConstructorUsedError;
  List<PerformancePointModel> get performance =>
      throw _privateConstructorUsedError;
  CalendarInfoModel get calendar => throw _privateConstructorUsedError;
  CelebrationGroupModel get birthdays => throw _privateConstructorUsedError;
  CelebrationGroupModel get anniversaries => throw _privateConstructorUsedError;

  /// Serializes this DashboardResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardResponseModelCopyWith<DashboardResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardResponseModelCopyWith<$Res> {
  factory $DashboardResponseModelCopyWith(DashboardResponseModel value,
          $Res Function(DashboardResponseModel) then) =
      _$DashboardResponseModelCopyWithImpl<$Res, DashboardResponseModel>;
  @useResult
  $Res call(
      {UserProfileModel user,
      HeroProjectModel hero,
      List<ProjectModel> projects,
      List<CreatorModel> creators,
      List<PerformancePointModel> performance,
      CalendarInfoModel calendar,
      CelebrationGroupModel birthdays,
      CelebrationGroupModel anniversaries});

  $UserProfileModelCopyWith<$Res> get user;
  $HeroProjectModelCopyWith<$Res> get hero;
  $CalendarInfoModelCopyWith<$Res> get calendar;
  $CelebrationGroupModelCopyWith<$Res> get birthdays;
  $CelebrationGroupModelCopyWith<$Res> get anniversaries;
}

/// @nodoc
class _$DashboardResponseModelCopyWithImpl<$Res,
        $Val extends DashboardResponseModel>
    implements $DashboardResponseModelCopyWith<$Res> {
  _$DashboardResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? hero = null,
    Object? projects = null,
    Object? creators = null,
    Object? performance = null,
    Object? calendar = null,
    Object? birthdays = null,
    Object? anniversaries = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserProfileModel,
      hero: null == hero
          ? _value.hero
          : hero // ignore: cast_nullable_to_non_nullable
              as HeroProjectModel,
      projects: null == projects
          ? _value.projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<ProjectModel>,
      creators: null == creators
          ? _value.creators
          : creators // ignore: cast_nullable_to_non_nullable
              as List<CreatorModel>,
      performance: null == performance
          ? _value.performance
          : performance // ignore: cast_nullable_to_non_nullable
              as List<PerformancePointModel>,
      calendar: null == calendar
          ? _value.calendar
          : calendar // ignore: cast_nullable_to_non_nullable
              as CalendarInfoModel,
      birthdays: null == birthdays
          ? _value.birthdays
          : birthdays // ignore: cast_nullable_to_non_nullable
              as CelebrationGroupModel,
      anniversaries: null == anniversaries
          ? _value.anniversaries
          : anniversaries // ignore: cast_nullable_to_non_nullable
              as CelebrationGroupModel,
    ) as $Val);
  }

  /// Create a copy of DashboardResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileModelCopyWith<$Res> get user {
    return $UserProfileModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of DashboardResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HeroProjectModelCopyWith<$Res> get hero {
    return $HeroProjectModelCopyWith<$Res>(_value.hero, (value) {
      return _then(_value.copyWith(hero: value) as $Val);
    });
  }

  /// Create a copy of DashboardResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CalendarInfoModelCopyWith<$Res> get calendar {
    return $CalendarInfoModelCopyWith<$Res>(_value.calendar, (value) {
      return _then(_value.copyWith(calendar: value) as $Val);
    });
  }

  /// Create a copy of DashboardResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CelebrationGroupModelCopyWith<$Res> get birthdays {
    return $CelebrationGroupModelCopyWith<$Res>(_value.birthdays, (value) {
      return _then(_value.copyWith(birthdays: value) as $Val);
    });
  }

  /// Create a copy of DashboardResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CelebrationGroupModelCopyWith<$Res> get anniversaries {
    return $CelebrationGroupModelCopyWith<$Res>(_value.anniversaries, (value) {
      return _then(_value.copyWith(anniversaries: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardResponseModelImplCopyWith<$Res>
    implements $DashboardResponseModelCopyWith<$Res> {
  factory _$$DashboardResponseModelImplCopyWith(
          _$DashboardResponseModelImpl value,
          $Res Function(_$DashboardResponseModelImpl) then) =
      __$$DashboardResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserProfileModel user,
      HeroProjectModel hero,
      List<ProjectModel> projects,
      List<CreatorModel> creators,
      List<PerformancePointModel> performance,
      CalendarInfoModel calendar,
      CelebrationGroupModel birthdays,
      CelebrationGroupModel anniversaries});

  @override
  $UserProfileModelCopyWith<$Res> get user;
  @override
  $HeroProjectModelCopyWith<$Res> get hero;
  @override
  $CalendarInfoModelCopyWith<$Res> get calendar;
  @override
  $CelebrationGroupModelCopyWith<$Res> get birthdays;
  @override
  $CelebrationGroupModelCopyWith<$Res> get anniversaries;
}

/// @nodoc
class __$$DashboardResponseModelImplCopyWithImpl<$Res>
    extends _$DashboardResponseModelCopyWithImpl<$Res,
        _$DashboardResponseModelImpl>
    implements _$$DashboardResponseModelImplCopyWith<$Res> {
  __$$DashboardResponseModelImplCopyWithImpl(
      _$DashboardResponseModelImpl _value,
      $Res Function(_$DashboardResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? hero = null,
    Object? projects = null,
    Object? creators = null,
    Object? performance = null,
    Object? calendar = null,
    Object? birthdays = null,
    Object? anniversaries = null,
  }) {
    return _then(_$DashboardResponseModelImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserProfileModel,
      hero: null == hero
          ? _value.hero
          : hero // ignore: cast_nullable_to_non_nullable
              as HeroProjectModel,
      projects: null == projects
          ? _value._projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<ProjectModel>,
      creators: null == creators
          ? _value._creators
          : creators // ignore: cast_nullable_to_non_nullable
              as List<CreatorModel>,
      performance: null == performance
          ? _value._performance
          : performance // ignore: cast_nullable_to_non_nullable
              as List<PerformancePointModel>,
      calendar: null == calendar
          ? _value.calendar
          : calendar // ignore: cast_nullable_to_non_nullable
              as CalendarInfoModel,
      birthdays: null == birthdays
          ? _value.birthdays
          : birthdays // ignore: cast_nullable_to_non_nullable
              as CelebrationGroupModel,
      anniversaries: null == anniversaries
          ? _value.anniversaries
          : anniversaries // ignore: cast_nullable_to_non_nullable
              as CelebrationGroupModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardResponseModelImpl implements _DashboardResponseModel {
  const _$DashboardResponseModelImpl(
      {required this.user,
      required this.hero,
      final List<ProjectModel> projects = const <ProjectModel>[],
      final List<CreatorModel> creators = const <CreatorModel>[],
      final List<PerformancePointModel> performance =
          const <PerformancePointModel>[],
      required this.calendar,
      required this.birthdays,
      required this.anniversaries})
      : _projects = projects,
        _creators = creators,
        _performance = performance;

  factory _$DashboardResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardResponseModelImplFromJson(json);

  @override
  final UserProfileModel user;
  @override
  final HeroProjectModel hero;
  final List<ProjectModel> _projects;
  @override
  @JsonKey()
  List<ProjectModel> get projects {
    if (_projects is EqualUnmodifiableListView) return _projects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projects);
  }

  final List<CreatorModel> _creators;
  @override
  @JsonKey()
  List<CreatorModel> get creators {
    if (_creators is EqualUnmodifiableListView) return _creators;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_creators);
  }

  final List<PerformancePointModel> _performance;
  @override
  @JsonKey()
  List<PerformancePointModel> get performance {
    if (_performance is EqualUnmodifiableListView) return _performance;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_performance);
  }

  @override
  final CalendarInfoModel calendar;
  @override
  final CelebrationGroupModel birthdays;
  @override
  final CelebrationGroupModel anniversaries;

  @override
  String toString() {
    return 'DashboardResponseModel(user: $user, hero: $hero, projects: $projects, creators: $creators, performance: $performance, calendar: $calendar, birthdays: $birthdays, anniversaries: $anniversaries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardResponseModelImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.hero, hero) || other.hero == hero) &&
            const DeepCollectionEquality().equals(other._projects, _projects) &&
            const DeepCollectionEquality().equals(other._creators, _creators) &&
            const DeepCollectionEquality()
                .equals(other._performance, _performance) &&
            (identical(other.calendar, calendar) ||
                other.calendar == calendar) &&
            (identical(other.birthdays, birthdays) ||
                other.birthdays == birthdays) &&
            (identical(other.anniversaries, anniversaries) ||
                other.anniversaries == anniversaries));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      hero,
      const DeepCollectionEquality().hash(_projects),
      const DeepCollectionEquality().hash(_creators),
      const DeepCollectionEquality().hash(_performance),
      calendar,
      birthdays,
      anniversaries);

  /// Create a copy of DashboardResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardResponseModelImplCopyWith<_$DashboardResponseModelImpl>
      get copyWith => __$$DashboardResponseModelImplCopyWithImpl<
          _$DashboardResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardResponseModelImplToJson(
      this,
    );
  }
}

abstract class _DashboardResponseModel implements DashboardResponseModel {
  const factory _DashboardResponseModel(
          {required final UserProfileModel user,
          required final HeroProjectModel hero,
          final List<ProjectModel> projects,
          final List<CreatorModel> creators,
          final List<PerformancePointModel> performance,
          required final CalendarInfoModel calendar,
          required final CelebrationGroupModel birthdays,
          required final CelebrationGroupModel anniversaries}) =
      _$DashboardResponseModelImpl;

  factory _DashboardResponseModel.fromJson(Map<String, dynamic> json) =
      _$DashboardResponseModelImpl.fromJson;

  @override
  UserProfileModel get user;
  @override
  HeroProjectModel get hero;
  @override
  List<ProjectModel> get projects;
  @override
  List<CreatorModel> get creators;
  @override
  List<PerformancePointModel> get performance;
  @override
  CalendarInfoModel get calendar;
  @override
  CelebrationGroupModel get birthdays;
  @override
  CelebrationGroupModel get anniversaries;

  /// Create a copy of DashboardResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardResponseModelImplCopyWith<_$DashboardResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
