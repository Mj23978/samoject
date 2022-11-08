// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'workspace.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Workspace {
  @Id()
  int get oid => throw _privateConstructorUsedError;
  @Id()
  set oid(int value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  ToOne<User> get belongsTo => throw _privateConstructorUsedError;
  set belongsTo(ToOne<User> value) => throw _privateConstructorUsedError;
  ToMany<Project> get projects => throw _privateConstructorUsedError;
  set projects(ToMany<Project> value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkspaceCopyWith<Workspace> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkspaceCopyWith<$Res> {
  factory $WorkspaceCopyWith(Workspace value, $Res Function(Workspace) then) =
      _$WorkspaceCopyWithImpl<$Res>;
  $Res call(
      {@Id() int oid,
      String id,
      String name,
      ToOne<User> belongsTo,
      ToMany<Project> projects});
}

/// @nodoc
class _$WorkspaceCopyWithImpl<$Res> implements $WorkspaceCopyWith<$Res> {
  _$WorkspaceCopyWithImpl(this._value, this._then);

  final Workspace _value;
  // ignore: unused_field
  final $Res Function(Workspace) _then;

  @override
  $Res call({
    Object? oid = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? belongsTo = freezed,
    Object? projects = freezed,
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
      belongsTo: belongsTo == freezed
          ? _value.belongsTo
          : belongsTo // ignore: cast_nullable_to_non_nullable
              as ToOne<User>,
      projects: projects == freezed
          ? _value.projects
          : projects // ignore: cast_nullable_to_non_nullable
              as ToMany<Project>,
    ));
  }
}

/// @nodoc
abstract class _$$_WorkspaceCopyWith<$Res> implements $WorkspaceCopyWith<$Res> {
  factory _$$_WorkspaceCopyWith(
          _$_Workspace value, $Res Function(_$_Workspace) then) =
      __$$_WorkspaceCopyWithImpl<$Res>;
  @override
  $Res call(
      {@Id() int oid,
      String id,
      String name,
      ToOne<User> belongsTo,
      ToMany<Project> projects});
}

/// @nodoc
class __$$_WorkspaceCopyWithImpl<$Res> extends _$WorkspaceCopyWithImpl<$Res>
    implements _$$_WorkspaceCopyWith<$Res> {
  __$$_WorkspaceCopyWithImpl(
      _$_Workspace _value, $Res Function(_$_Workspace) _then)
      : super(_value, (v) => _then(v as _$_Workspace));

  @override
  _$_Workspace get _value => super._value as _$_Workspace;

  @override
  $Res call({
    Object? oid = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? belongsTo = freezed,
    Object? projects = freezed,
  }) {
    return _then(_$_Workspace(
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
      belongsTo: belongsTo == freezed
          ? _value.belongsTo
          : belongsTo // ignore: cast_nullable_to_non_nullable
              as ToOne<User>,
      projects: projects == freezed
          ? _value.projects
          : projects // ignore: cast_nullable_to_non_nullable
              as ToMany<Project>,
    ));
  }
}

/// @nodoc

@Entity(realClass: Workspace)
class _$_Workspace extends _Workspace {
  _$_Workspace(
      {@Id() this.oid = 0,
      required this.id,
      required this.name,
      required this.belongsTo,
      required this.projects})
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
  ToOne<User> belongsTo;
  @override
  ToMany<Project> projects;

  @override
  String toString() {
    return 'Workspace(oid: $oid, id: $id, name: $name, belongsTo: $belongsTo, projects: $projects)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_WorkspaceCopyWith<_$_Workspace> get copyWith =>
      __$$_WorkspaceCopyWithImpl<_$_Workspace>(this, _$identity);
}

abstract class _Workspace extends Workspace {
  factory _Workspace(
      {@Id() int oid,
      required String id,
      required String name,
      required ToOne<User> belongsTo,
      required ToMany<Project> projects}) = _$_Workspace;
  _Workspace._() : super._();

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
  ToOne<User> get belongsTo;
  set belongsTo(ToOne<User> value);
  @override
  ToMany<Project> get projects;
  set projects(ToMany<Project> value);
  @override
  @JsonKey(ignore: true)
  _$$_WorkspaceCopyWith<_$_Workspace> get copyWith =>
      throw _privateConstructorUsedError;
}
