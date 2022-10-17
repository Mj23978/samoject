// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  bool get activ => throw _privateConstructorUsedError;
  List<Task> get createdTasks => throw _privateConstructorUsedError;
  List<Task> get assignedTasks => throw _privateConstructorUsedError;
  List<Comment> get comments => throw _privateConstructorUsedError;
  List<Workspace> get workspaces => throw _privateConstructorUsedError;
  String? get roleName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String username,
      String? firstName,
      String? lastName,
      bool activ,
      List<Task> createdTasks,
      List<Task> assignedTasks,
      List<Comment> comments,
      List<Workspace> workspaces,
      String? roleName});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? activ = freezed,
    Object? createdTasks = freezed,
    Object? assignedTasks = freezed,
    Object? comments = freezed,
    Object? workspaces = freezed,
    Object? roleName = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      activ: activ == freezed
          ? _value.activ
          : activ // ignore: cast_nullable_to_non_nullable
              as bool,
      createdTasks: createdTasks == freezed
          ? _value.createdTasks
          : createdTasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      assignedTasks: assignedTasks == freezed
          ? _value.assignedTasks
          : assignedTasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
      workspaces: workspaces == freezed
          ? _value.workspaces
          : workspaces // ignore: cast_nullable_to_non_nullable
              as List<Workspace>,
      roleName: roleName == freezed
          ? _value.roleName
          : roleName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String username,
      String? firstName,
      String? lastName,
      bool activ,
      List<Task> createdTasks,
      List<Task> assignedTasks,
      List<Comment> comments,
      List<Workspace> workspaces,
      String? roleName});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, (v) => _then(v as _$_User));

  @override
  _$_User get _value => super._value as _$_User;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? activ = freezed,
    Object? createdTasks = freezed,
    Object? assignedTasks = freezed,
    Object? comments = freezed,
    Object? workspaces = freezed,
    Object? roleName = freezed,
  }) {
    return _then(_$_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      activ: activ == freezed
          ? _value.activ
          : activ // ignore: cast_nullable_to_non_nullable
              as bool,
      createdTasks: createdTasks == freezed
          ? _value._createdTasks
          : createdTasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      assignedTasks: assignedTasks == freezed
          ? _value._assignedTasks
          : assignedTasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      comments: comments == freezed
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
      workspaces: workspaces == freezed
          ? _value._workspaces
          : workspaces // ignore: cast_nullable_to_non_nullable
              as List<Workspace>,
      roleName: roleName == freezed
          ? _value.roleName
          : roleName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User extends _User {
  const _$_User(
      {required this.id,
      required this.username,
      this.firstName,
      this.lastName,
      this.activ = true,
      final List<Task> createdTasks = const [],
      final List<Task> assignedTasks = const [],
      final List<Comment> comments = const [],
      final List<Workspace> workspaces = const [],
      this.roleName})
      : _createdTasks = createdTasks,
        _assignedTasks = assignedTasks,
        _comments = comments,
        _workspaces = workspaces,
        super._();

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String id;
  @override
  final String username;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  @JsonKey()
  final bool activ;
  final List<Task> _createdTasks;
  @override
  @JsonKey()
  List<Task> get createdTasks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_createdTasks);
  }

  final List<Task> _assignedTasks;
  @override
  @JsonKey()
  List<Task> get assignedTasks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assignedTasks);
  }

  final List<Comment> _comments;
  @override
  @JsonKey()
  List<Comment> get comments {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  final List<Workspace> _workspaces;
  @override
  @JsonKey()
  List<Workspace> get workspaces {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workspaces);
  }

  @override
  final String? roleName;

  @override
  String toString() {
    return 'User(id: $id, username: $username, firstName: $firstName, lastName: $lastName, activ: $activ, createdTasks: $createdTasks, assignedTasks: $assignedTasks, comments: $comments, workspaces: $workspaces, roleName: $roleName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality().equals(other.activ, activ) &&
            const DeepCollectionEquality()
                .equals(other._createdTasks, _createdTasks) &&
            const DeepCollectionEquality()
                .equals(other._assignedTasks, _assignedTasks) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            const DeepCollectionEquality()
                .equals(other._workspaces, _workspaces) &&
            const DeepCollectionEquality().equals(other.roleName, roleName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(activ),
      const DeepCollectionEquality().hash(_createdTasks),
      const DeepCollectionEquality().hash(_assignedTasks),
      const DeepCollectionEquality().hash(_comments),
      const DeepCollectionEquality().hash(_workspaces),
      const DeepCollectionEquality().hash(roleName));

  @JsonKey(ignore: true)
  @override
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User extends User {
  const factory _User(
      {required final String id,
      required final String username,
      final String? firstName,
      final String? lastName,
      final bool activ,
      final List<Task> createdTasks,
      final List<Task> assignedTasks,
      final List<Comment> comments,
      final List<Workspace> workspaces,
      final String? roleName}) = _$_User;
  const _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  bool get activ;
  @override
  List<Task> get createdTasks;
  @override
  List<Task> get assignedTasks;
  @override
  List<Comment> get comments;
  @override
  List<Workspace> get workspaces;
  @override
  String? get roleName;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
