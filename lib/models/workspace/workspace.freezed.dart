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
  List<Project> get project => throw _privateConstructorUsedError;
  List<Space> get spaces => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkspaceCopyWith<Workspace> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkspaceCopyWith<$Res> {
  factory $WorkspaceCopyWith(Workspace value, $Res Function(Workspace) then) =
      _$WorkspaceCopyWithImpl<$Res>;
  $Res call(
      {String id, String name, List<Project> project, List<Space> spaces});
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
    Object? project = freezed,
    Object? spaces = freezed,
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
      project: project == freezed
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as List<Project>,
      spaces: spaces == freezed
          ? _value.spaces
          : spaces // ignore: cast_nullable_to_non_nullable
              as List<Space>,
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
      {String id, String name, List<Project> project, List<Space> spaces});
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
    Object? project = freezed,
    Object? spaces = freezed,
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
      project: project == freezed
          ? _value._project
          : project // ignore: cast_nullable_to_non_nullable
              as List<Project>,
      spaces: spaces == freezed
          ? _value._spaces
          : spaces // ignore: cast_nullable_to_non_nullable
              as List<Space>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Workspace extends _Workspace {
  const _$_Workspace(
      {required this.id,
      required this.name,
      final List<Project> project = const [],
      final List<Space> spaces = const []})
      : _project = project,
        _spaces = spaces,
        super._();

  factory _$_Workspace.fromJson(Map<String, dynamic> json) =>
      _$$_WorkspaceFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final List<Project> _project;
  @override
  @JsonKey()
  List<Project> get project {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_project);
  }

  final List<Space> _spaces;
  @override
  @JsonKey()
  List<Space> get spaces {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_spaces);
  }

  @override
  String toString() {
    return 'Workspace(id: $id, name: $name, project: $project, spaces: $spaces)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Workspace &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other._project, _project) &&
            const DeepCollectionEquality().equals(other._spaces, _spaces));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(_project),
      const DeepCollectionEquality().hash(_spaces));

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
      final List<Project> project,
      final List<Space> spaces}) = _$_Workspace;
  const _Workspace._() : super._();

  factory _Workspace.fromJson(Map<String, dynamic> json) =
      _$_Workspace.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  List<Project> get project;
  @override
  List<Space> get spaces;
  @override
  @JsonKey(ignore: true)
  _$$_WorkspaceCopyWith<_$_Workspace> get copyWith =>
      throw _privateConstructorUsedError;
}
