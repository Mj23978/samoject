// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return _Project.fromJson(json);
}

/// @nodoc
mixin _$Project {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  ProjectSettings get settings => throw _privateConstructorUsedError;
  List<Space> get spaces => throw _privateConstructorUsedError;
  List<String> get spaceIds => throw _privateConstructorUsedError;
  List<Task> get tasks => throw _privateConstructorUsedError;
  List<String> get taskIds => throw _privateConstructorUsedError;
  List<User> get users => throw _privateConstructorUsedError;
  List<String> get userIds => throw _privateConstructorUsedError;
  String get workspaceId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectCopyWith<Project> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) then) =
      _$ProjectCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      ProjectSettings settings,
      List<Space> spaces,
      List<String> spaceIds,
      List<Task> tasks,
      List<String> taskIds,
      List<User> users,
      List<String> userIds,
      String workspaceId});

  $ProjectSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res> implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._value, this._then);

  final Project _value;
  // ignore: unused_field
  final $Res Function(Project) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? settings = freezed,
    Object? spaces = freezed,
    Object? spaceIds = freezed,
    Object? tasks = freezed,
    Object? taskIds = freezed,
    Object? users = freezed,
    Object? userIds = freezed,
    Object? workspaceId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as ProjectSettings,
      spaces: spaces == freezed
          ? _value.spaces
          : spaces // ignore: cast_nullable_to_non_nullable
              as List<Space>,
      spaceIds: spaceIds == freezed
          ? _value.spaceIds
          : spaceIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tasks: tasks == freezed
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      taskIds: taskIds == freezed
          ? _value.taskIds
          : taskIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
      userIds: userIds == freezed
          ? _value.userIds
          : userIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      workspaceId: workspaceId == freezed
          ? _value.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $ProjectSettingsCopyWith<$Res> get settings {
    return $ProjectSettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value));
    });
  }
}

/// @nodoc
abstract class _$$_ProjectCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$$_ProjectCopyWith(
          _$_Project value, $Res Function(_$_Project) then) =
      __$$_ProjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      ProjectSettings settings,
      List<Space> spaces,
      List<String> spaceIds,
      List<Task> tasks,
      List<String> taskIds,
      List<User> users,
      List<String> userIds,
      String workspaceId});

  @override
  $ProjectSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$$_ProjectCopyWithImpl<$Res> extends _$ProjectCopyWithImpl<$Res>
    implements _$$_ProjectCopyWith<$Res> {
  __$$_ProjectCopyWithImpl(_$_Project _value, $Res Function(_$_Project) _then)
      : super(_value, (v) => _then(v as _$_Project));

  @override
  _$_Project get _value => super._value as _$_Project;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? settings = freezed,
    Object? spaces = freezed,
    Object? spaceIds = freezed,
    Object? tasks = freezed,
    Object? taskIds = freezed,
    Object? users = freezed,
    Object? userIds = freezed,
    Object? workspaceId = freezed,
  }) {
    return _then(_$_Project(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as ProjectSettings,
      spaces: spaces == freezed
          ? _value._spaces
          : spaces // ignore: cast_nullable_to_non_nullable
              as List<Space>,
      spaceIds: spaceIds == freezed
          ? _value._spaceIds
          : spaceIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tasks: tasks == freezed
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      taskIds: taskIds == freezed
          ? _value._taskIds
          : taskIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      users: users == freezed
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
      userIds: userIds == freezed
          ? _value._userIds
          : userIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      workspaceId: workspaceId == freezed
          ? _value.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Project extends _Project {
  const _$_Project(
      {required this.id,
      required this.name,
      required this.settings,
      final List<Space> spaces = const [],
      final List<String> spaceIds = const [],
      final List<Task> tasks = const [],
      final List<String> taskIds = const [],
      final List<User> users = const [],
      final List<String> userIds = const [],
      required this.workspaceId})
      : _spaces = spaces,
        _spaceIds = spaceIds,
        _tasks = tasks,
        _taskIds = taskIds,
        _users = users,
        _userIds = userIds,
        super._();

  factory _$_Project.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final ProjectSettings settings;
  final List<Space> _spaces;
  @override
  @JsonKey()
  List<Space> get spaces {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_spaces);
  }

  final List<String> _spaceIds;
  @override
  @JsonKey()
  List<String> get spaceIds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_spaceIds);
  }

  final List<Task> _tasks;
  @override
  @JsonKey()
  List<Task> get tasks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  final List<String> _taskIds;
  @override
  @JsonKey()
  List<String> get taskIds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_taskIds);
  }

  final List<User> _users;
  @override
  @JsonKey()
  List<User> get users {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  final List<String> _userIds;
  @override
  @JsonKey()
  List<String> get userIds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userIds);
  }

  @override
  final String workspaceId;

  @override
  String toString() {
    return 'Project(id: $id, name: $name, settings: $settings, spaces: $spaces, spaceIds: $spaceIds, tasks: $tasks, taskIds: $taskIds, users: $users, userIds: $userIds, workspaceId: $workspaceId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Project &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.settings, settings) &&
            const DeepCollectionEquality().equals(other._spaces, _spaces) &&
            const DeepCollectionEquality().equals(other._spaceIds, _spaceIds) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            const DeepCollectionEquality().equals(other._taskIds, _taskIds) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            const DeepCollectionEquality().equals(other._userIds, _userIds) &&
            const DeepCollectionEquality()
                .equals(other.workspaceId, workspaceId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(settings),
      const DeepCollectionEquality().hash(_spaces),
      const DeepCollectionEquality().hash(_spaceIds),
      const DeepCollectionEquality().hash(_tasks),
      const DeepCollectionEquality().hash(_taskIds),
      const DeepCollectionEquality().hash(_users),
      const DeepCollectionEquality().hash(_userIds),
      const DeepCollectionEquality().hash(workspaceId));

  @JsonKey(ignore: true)
  @override
  _$$_ProjectCopyWith<_$_Project> get copyWith =>
      __$$_ProjectCopyWithImpl<_$_Project>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectToJson(
      this,
    );
  }
}

abstract class _Project extends Project {
  const factory _Project(
      {required final String id,
      required final String name,
      required final ProjectSettings settings,
      final List<Space> spaces,
      final List<String> spaceIds,
      final List<Task> tasks,
      final List<String> taskIds,
      final List<User> users,
      final List<String> userIds,
      required final String workspaceId}) = _$_Project;
  const _Project._() : super._();

  factory _Project.fromJson(Map<String, dynamic> json) = _$_Project.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  ProjectSettings get settings;
  @override
  List<Space> get spaces;
  @override
  List<String> get spaceIds;
  @override
  List<Task> get tasks;
  @override
  List<String> get taskIds;
  @override
  List<User> get users;
  @override
  List<String> get userIds;
  @override
  String get workspaceId;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectCopyWith<_$_Project> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectSettings _$ProjectSettingsFromJson(Map<String, dynamic> json) {
  return _ProjectSettings.fromJson(json);
}

/// @nodoc
mixin _$ProjectSettings {
  String get id => throw _privateConstructorUsedError;
  String? get localId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectSettingsCopyWith<ProjectSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectSettingsCopyWith<$Res> {
  factory $ProjectSettingsCopyWith(
          ProjectSettings value, $Res Function(ProjectSettings) then) =
      _$ProjectSettingsCopyWithImpl<$Res>;
  $Res call({String id, String? localId});
}

/// @nodoc
class _$ProjectSettingsCopyWithImpl<$Res>
    implements $ProjectSettingsCopyWith<$Res> {
  _$ProjectSettingsCopyWithImpl(this._value, this._then);

  final ProjectSettings _value;
  // ignore: unused_field
  final $Res Function(ProjectSettings) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? localId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      localId: localId == freezed
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ProjectSettingsCopyWith<$Res>
    implements $ProjectSettingsCopyWith<$Res> {
  factory _$$_ProjectSettingsCopyWith(
          _$_ProjectSettings value, $Res Function(_$_ProjectSettings) then) =
      __$$_ProjectSettingsCopyWithImpl<$Res>;
  @override
  $Res call({String id, String? localId});
}

/// @nodoc
class __$$_ProjectSettingsCopyWithImpl<$Res>
    extends _$ProjectSettingsCopyWithImpl<$Res>
    implements _$$_ProjectSettingsCopyWith<$Res> {
  __$$_ProjectSettingsCopyWithImpl(
      _$_ProjectSettings _value, $Res Function(_$_ProjectSettings) _then)
      : super(_value, (v) => _then(v as _$_ProjectSettings));

  @override
  _$_ProjectSettings get _value => super._value as _$_ProjectSettings;

  @override
  $Res call({
    Object? id = freezed,
    Object? localId = freezed,
  }) {
    return _then(_$_ProjectSettings(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      localId: localId == freezed
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProjectSettings extends _ProjectSettings {
  const _$_ProjectSettings({required this.id, this.localId}) : super._();

  factory _$_ProjectSettings.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectSettingsFromJson(json);

  @override
  final String id;
  @override
  final String? localId;

  @override
  String toString() {
    return 'ProjectSettings(id: $id, localId: $localId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectSettings &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.localId, localId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(localId));

  @JsonKey(ignore: true)
  @override
  _$$_ProjectSettingsCopyWith<_$_ProjectSettings> get copyWith =>
      __$$_ProjectSettingsCopyWithImpl<_$_ProjectSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectSettingsToJson(
      this,
    );
  }
}

abstract class _ProjectSettings extends ProjectSettings {
  const factory _ProjectSettings(
      {required final String id, final String? localId}) = _$_ProjectSettings;
  const _ProjectSettings._() : super._();

  factory _ProjectSettings.fromJson(Map<String, dynamic> json) =
      _$_ProjectSettings.fromJson;

  @override
  String get id;
  @override
  String? get localId;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectSettingsCopyWith<_$_ProjectSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
