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

Workspace _$WorkspaceFromJson(Map<String, dynamic> json) {
  return _Workspace.fromJson(json);
}

/// @nodoc
mixin _$Workspace {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  User get belongsTo => throw _privateConstructorUsedError;
  List<Project> get projects => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkspaceCopyWith<Workspace> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkspaceCopyWith<$Res> {
  factory $WorkspaceCopyWith(Workspace value, $Res Function(Workspace) then) =
      _$WorkspaceCopyWithImpl<$Res>;
  $Res call({String id, String name, User belongsTo, List<Project> projects});

  $UserCopyWith<$Res> get belongsTo;
}

/// @nodoc
class _$WorkspaceCopyWithImpl<$Res> implements $WorkspaceCopyWith<$Res> {
  _$WorkspaceCopyWithImpl(this._value, this._then);

  final Workspace _value;
  // ignore: unused_field
  final $Res Function(Workspace) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? belongsTo = freezed,
    Object? projects = freezed,
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
      belongsTo: belongsTo == freezed
          ? _value.belongsTo
          : belongsTo // ignore: cast_nullable_to_non_nullable
              as User,
      projects: projects == freezed
          ? _value.projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<Project>,
    ));
  }

  @override
  $UserCopyWith<$Res> get belongsTo {
    return $UserCopyWith<$Res>(_value.belongsTo, (value) {
      return _then(_value.copyWith(belongsTo: value));
    });
  }
}

/// @nodoc
abstract class _$$_WorkspaceCopyWith<$Res> implements $WorkspaceCopyWith<$Res> {
  factory _$$_WorkspaceCopyWith(
          _$_Workspace value, $Res Function(_$_Workspace) then) =
      __$$_WorkspaceCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, User belongsTo, List<Project> projects});

  @override
  $UserCopyWith<$Res> get belongsTo;
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
    Object? id = freezed,
    Object? name = freezed,
    Object? belongsTo = freezed,
    Object? projects = freezed,
  }) {
    return _then(_$_Workspace(
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
              as User,
      projects: projects == freezed
          ? _value._projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<Project>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Workspace extends _Workspace {
  const _$_Workspace(
      {required this.id,
      required this.name,
      required this.belongsTo,
      final List<Project> projects = const []})
      : _projects = projects,
        super._();

  factory _$_Workspace.fromJson(Map<String, dynamic> json) =>
      _$$_WorkspaceFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final User belongsTo;
  final List<Project> _projects;
  @override
  @JsonKey()
  List<Project> get projects {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projects);
  }

  @override
  String toString() {
    return 'Workspace(id: $id, name: $name, belongsTo: $belongsTo, projects: $projects)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Workspace &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.belongsTo, belongsTo) &&
            const DeepCollectionEquality().equals(other._projects, _projects));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(belongsTo),
      const DeepCollectionEquality().hash(_projects));

  @JsonKey(ignore: true)
  @override
  _$$_WorkspaceCopyWith<_$_Workspace> get copyWith =>
      __$$_WorkspaceCopyWithImpl<_$_Workspace>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorkspaceToJson(
      this,
    );
  }
}

abstract class _Workspace extends Workspace {
  const factory _Workspace(
      {required final String id,
      required final String name,
      required final User belongsTo,
      final List<Project> projects}) = _$_Workspace;
  const _Workspace._() : super._();

  factory _Workspace.fromJson(Map<String, dynamic> json) =
      _$_Workspace.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  User get belongsTo;
  @override
  List<Project> get projects;
  @override
  @JsonKey(ignore: true)
  _$$_WorkspaceCopyWith<_$_Workspace> get copyWith =>
      throw _privateConstructorUsedError;
}
