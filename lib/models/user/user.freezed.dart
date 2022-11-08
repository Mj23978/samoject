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

/// @nodoc
mixin _$User {
  @Id()
  int get oid => throw _privateConstructorUsedError;
  @Id()
  set oid(int value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  set username(String value) => throw _privateConstructorUsedError;
  @Property(type: PropertyType.date)
  DateTime get date => throw _privateConstructorUsedError;
  @Property(type: PropertyType.date)
  set date(DateTime value) => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  set firstName(String? value) => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  set lastName(String? value) => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  set password(String? value) => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  set email(String? value) => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  set active(bool value) => throw _privateConstructorUsedError;
  ToMany<Task> get createdTasks => throw _privateConstructorUsedError;
  set createdTasks(ToMany<Task> value) => throw _privateConstructorUsedError;
  ToMany<Task> get assignedTasks => throw _privateConstructorUsedError;
  set assignedTasks(ToMany<Task> value) => throw _privateConstructorUsedError;
  ToMany<Comment> get comments => throw _privateConstructorUsedError;
  set comments(ToMany<Comment> value) => throw _privateConstructorUsedError;
  ToMany<Project> get projects => throw _privateConstructorUsedError;
  set projects(ToMany<Project> value) => throw _privateConstructorUsedError;
  String? get roleName => throw _privateConstructorUsedError;
  set roleName(String? value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {@Id() int oid,
      String id,
      String username,
      @Property(type: PropertyType.date) DateTime date,
      String? firstName,
      String? lastName,
      String? password,
      String? email,
      bool active,
      ToMany<Task> createdTasks,
      ToMany<Task> assignedTasks,
      ToMany<Comment> comments,
      ToMany<Project> projects,
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
    Object? oid = freezed,
    Object? id = freezed,
    Object? username = freezed,
    Object? date = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? password = freezed,
    Object? email = freezed,
    Object? active = freezed,
    Object? createdTasks = freezed,
    Object? assignedTasks = freezed,
    Object? comments = freezed,
    Object? projects = freezed,
    Object? roleName = freezed,
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
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      createdTasks: createdTasks == freezed
          ? _value.createdTasks
          : createdTasks // ignore: cast_nullable_to_non_nullable
              as ToMany<Task>,
      assignedTasks: assignedTasks == freezed
          ? _value.assignedTasks
          : assignedTasks // ignore: cast_nullable_to_non_nullable
              as ToMany<Task>,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as ToMany<Comment>,
      projects: projects == freezed
          ? _value.projects
          : projects // ignore: cast_nullable_to_non_nullable
              as ToMany<Project>,
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
      {@Id() int oid,
      String id,
      String username,
      @Property(type: PropertyType.date) DateTime date,
      String? firstName,
      String? lastName,
      String? password,
      String? email,
      bool active,
      ToMany<Task> createdTasks,
      ToMany<Task> assignedTasks,
      ToMany<Comment> comments,
      ToMany<Project> projects,
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
    Object? oid = freezed,
    Object? id = freezed,
    Object? username = freezed,
    Object? date = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? password = freezed,
    Object? email = freezed,
    Object? active = freezed,
    Object? createdTasks = freezed,
    Object? assignedTasks = freezed,
    Object? comments = freezed,
    Object? projects = freezed,
    Object? roleName = freezed,
  }) {
    return _then(_$_User(
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      createdTasks: createdTasks == freezed
          ? _value.createdTasks
          : createdTasks // ignore: cast_nullable_to_non_nullable
              as ToMany<Task>,
      assignedTasks: assignedTasks == freezed
          ? _value.assignedTasks
          : assignedTasks // ignore: cast_nullable_to_non_nullable
              as ToMany<Task>,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as ToMany<Comment>,
      projects: projects == freezed
          ? _value.projects
          : projects // ignore: cast_nullable_to_non_nullable
              as ToMany<Project>,
      roleName: roleName == freezed
          ? _value.roleName
          : roleName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@Entity(realClass: User)
class _$_User extends _User {
  _$_User(
      {@Id() this.oid = 0,
      required this.id,
      required this.username,
      @Property(type: PropertyType.date) required this.date,
      this.firstName,
      this.lastName,
      this.password,
      this.email,
      this.active = true,
      required this.createdTasks,
      required this.assignedTasks,
      required this.comments,
      required this.projects,
      this.roleName})
      : super._();

  @override
  @JsonKey()
  @Id()
  int oid;
  @override
  String id;
  @override
  String username;
  @override
  @Property(type: PropertyType.date)
  DateTime date;
  @override
  String? firstName;
  @override
  String? lastName;
  @override
  String? password;
  @override
  String? email;
  @override
  @JsonKey()
  bool active;
  @override
  ToMany<Task> createdTasks;
  @override
  ToMany<Task> assignedTasks;
  @override
  ToMany<Comment> comments;
  @override
  ToMany<Project> projects;
  @override
  String? roleName;

  @override
  String toString() {
    return 'User(oid: $oid, id: $id, username: $username, date: $date, firstName: $firstName, lastName: $lastName, password: $password, email: $email, active: $active, createdTasks: $createdTasks, assignedTasks: $assignedTasks, comments: $comments, projects: $projects, roleName: $roleName)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);
}

abstract class _User extends User {
  factory _User(
      {@Id() int oid,
      required String id,
      required String username,
      @Property(type: PropertyType.date) required DateTime date,
      String? firstName,
      String? lastName,
      String? password,
      String? email,
      bool active,
      required ToMany<Task> createdTasks,
      required ToMany<Task> assignedTasks,
      required ToMany<Comment> comments,
      required ToMany<Project> projects,
      String? roleName}) = _$_User;
  _User._() : super._();

  @override
  @Id()
  int get oid;
  @Id()
  set oid(int value);
  @override
  String get id;
  set id(String value);
  @override
  String get username;
  set username(String value);
  @override
  @Property(type: PropertyType.date)
  DateTime get date;
  @Property(type: PropertyType.date)
  set date(DateTime value);
  @override
  String? get firstName;
  set firstName(String? value);
  @override
  String? get lastName;
  set lastName(String? value);
  @override
  String? get password;
  set password(String? value);
  @override
  String? get email;
  set email(String? value);
  @override
  bool get active;
  set active(bool value);
  @override
  ToMany<Task> get createdTasks;
  set createdTasks(ToMany<Task> value);
  @override
  ToMany<Task> get assignedTasks;
  set assignedTasks(ToMany<Task> value);
  @override
  ToMany<Comment> get comments;
  set comments(ToMany<Comment> value);
  @override
  ToMany<Project> get projects;
  set projects(ToMany<Project> value);
  @override
  String? get roleName;
  set roleName(String? value);
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
