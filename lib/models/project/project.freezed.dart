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

/// @nodoc
mixin _$Project {
  @Id()
  int get oid => throw _privateConstructorUsedError;
  @Id()
  set oid(int value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  ToOne<ProjectSettings> get settings => throw _privateConstructorUsedError;
  set settings(ToOne<ProjectSettings> value) =>
      throw _privateConstructorUsedError;
  ToOne<Workspace> get workspaceId => throw _privateConstructorUsedError;
  set workspaceId(ToOne<Workspace> value) => throw _privateConstructorUsedError;
  ToMany<Space> get spaces => throw _privateConstructorUsedError;
  set spaces(ToMany<Space> value) => throw _privateConstructorUsedError;
  ToMany<Task> get tasks => throw _privateConstructorUsedError;
  set tasks(ToMany<Task> value) => throw _privateConstructorUsedError;
  ToMany<User> get users => throw _privateConstructorUsedError;
  set users(ToMany<User> value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProjectCopyWith<Project> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) then) =
      _$ProjectCopyWithImpl<$Res>;
  $Res call(
      {@Id() int oid,
      String id,
      String name,
      ToOne<ProjectSettings> settings,
      ToOne<Workspace> workspaceId,
      ToMany<Space> spaces,
      ToMany<Task> tasks,
      ToMany<User> users});
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res> implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._value, this._then);

  final Project _value;
  // ignore: unused_field
  final $Res Function(Project) _then;

  @override
  $Res call({
    Object? oid = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? settings = freezed,
    Object? workspaceId = freezed,
    Object? spaces = freezed,
    Object? tasks = freezed,
    Object? users = freezed,
  }) {
    return _then(_value.copyWith(
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as int,
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
              as ToOne<ProjectSettings>,
      workspaceId: workspaceId == freezed
          ? _value.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as ToOne<Workspace>,
      spaces: spaces == freezed
          ? _value.spaces
          : spaces // ignore: cast_nullable_to_non_nullable
              as ToMany<Space>,
      tasks: tasks == freezed
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as ToMany<Task>,
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as ToMany<User>,
    ));
  }
}

/// @nodoc
abstract class _$$_ProjectCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$$_ProjectCopyWith(
          _$_Project value, $Res Function(_$_Project) then) =
      __$$_ProjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {@Id() int oid,
      String id,
      String name,
      ToOne<ProjectSettings> settings,
      ToOne<Workspace> workspaceId,
      ToMany<Space> spaces,
      ToMany<Task> tasks,
      ToMany<User> users});
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
    Object? oid = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? settings = freezed,
    Object? workspaceId = freezed,
    Object? spaces = freezed,
    Object? tasks = freezed,
    Object? users = freezed,
  }) {
    return _then(_$_Project(
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as int,
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
              as ToOne<ProjectSettings>,
      workspaceId: workspaceId == freezed
          ? _value.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as ToOne<Workspace>,
      spaces: spaces == freezed
          ? _value.spaces
          : spaces // ignore: cast_nullable_to_non_nullable
              as ToMany<Space>,
      tasks: tasks == freezed
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as ToMany<Task>,
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as ToMany<User>,
    ));
  }
}

/// @nodoc

@Entity(realClass: Project)
class _$_Project extends _Project {
  _$_Project(
      {@Id() this.oid = 0,
      required this.id,
      required this.name,
      required this.settings,
      required this.workspaceId,
      required this.spaces,
      required this.tasks,
      required this.users})
      : super._();

  @override
  @JsonKey()
  @Id()
  int oid;
  @override
  String id;
  @override
  String name;
  @override
  ToOne<ProjectSettings> settings;
  @override
  ToOne<Workspace> workspaceId;
  @override
  ToMany<Space> spaces;
  @override
  ToMany<Task> tasks;
  @override
  ToMany<User> users;

  @override
  String toString() {
    return 'Project(oid: $oid, id: $id, name: $name, settings: $settings, workspaceId: $workspaceId, spaces: $spaces, tasks: $tasks, users: $users)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_ProjectCopyWith<_$_Project> get copyWith =>
      __$$_ProjectCopyWithImpl<_$_Project>(this, _$identity);
}

abstract class _Project extends Project {
  factory _Project(
      {@Id() int oid,
      required String id,
      required String name,
      required ToOne<ProjectSettings> settings,
      required ToOne<Workspace> workspaceId,
      required ToMany<Space> spaces,
      required ToMany<Task> tasks,
      required ToMany<User> users}) = _$_Project;
  _Project._() : super._();

  @override
  @Id()
  int get oid;
  @Id()
  set oid(int value);
  @override
  String get id;
  set id(String value);
  @override
  String get name;
  set name(String value);
  @override
  ToOne<ProjectSettings> get settings;
  set settings(ToOne<ProjectSettings> value);
  @override
  ToOne<Workspace> get workspaceId;
  set workspaceId(ToOne<Workspace> value);
  @override
  ToMany<Space> get spaces;
  set spaces(ToMany<Space> value);
  @override
  ToMany<Task> get tasks;
  set tasks(ToMany<Task> value);
  @override
  ToMany<User> get users;
  set users(ToMany<User> value);
  @override
  @JsonKey(ignore: true)
  _$$_ProjectCopyWith<_$_Project> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProjectSettings {
  @Id()
  int get oid => throw _privateConstructorUsedError;
  @Id()
  set oid(int value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String? get localId => throw _privateConstructorUsedError;
  set localId(String? value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProjectSettingsCopyWith<ProjectSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectSettingsCopyWith<$Res> {
  factory $ProjectSettingsCopyWith(
          ProjectSettings value, $Res Function(ProjectSettings) then) =
      _$ProjectSettingsCopyWithImpl<$Res>;
  $Res call({@Id() int oid, String id, String? localId});
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
    Object? oid = freezed,
    Object? id = freezed,
    Object? localId = freezed,
  }) {
    return _then(_value.copyWith(
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as int,
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
  $Res call({@Id() int oid, String id, String? localId});
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
    Object? oid = freezed,
    Object? id = freezed,
    Object? localId = freezed,
  }) {
    return _then(_$_ProjectSettings(
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as int,
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

@Entity(realClass: ProjectSettings)
class _$_ProjectSettings extends _ProjectSettings {
  _$_ProjectSettings({@Id() this.oid = 0, required this.id, this.localId})
      : super._();

  @override
  @JsonKey()
  @Id()
  int oid;
  @override
  String id;
  @override
  String? localId;

  @override
  String toString() {
    return 'ProjectSettings(oid: $oid, id: $id, localId: $localId)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_ProjectSettingsCopyWith<_$_ProjectSettings> get copyWith =>
      __$$_ProjectSettingsCopyWithImpl<_$_ProjectSettings>(this, _$identity);
}

abstract class _ProjectSettings extends ProjectSettings {
  factory _ProjectSettings(
      {@Id() int oid,
      required String id,
      String? localId}) = _$_ProjectSettings;
  _ProjectSettings._() : super._();

  @override
  @Id()
  int get oid;
  @Id()
  set oid(int value);
  @override
  String get id;
  set id(String value);
  @override
  String? get localId;
  set localId(String? value);
  @override
  @JsonKey(ignore: true)
  _$$_ProjectSettingsCopyWith<_$_ProjectSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
