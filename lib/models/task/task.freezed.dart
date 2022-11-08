// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Task {
  @Id()
  int get oid => throw _privateConstructorUsedError;
  @Id()
  set oid(int value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get taskName => throw _privateConstructorUsedError;
  set taskName(String value) => throw _privateConstructorUsedError;
  ToOne<User> get creatorId => throw _privateConstructorUsedError;
  set creatorId(ToOne<User> value) => throw _privateConstructorUsedError;
  ToOne<Project> get projectId => throw _privateConstructorUsedError;
  set projectId(ToOne<Project> value) => throw _privateConstructorUsedError;
  ToOne<TaskDetails> get taskDetailsId => throw _privateConstructorUsedError;
  set taskDetailsId(ToOne<TaskDetails> value) =>
      throw _privateConstructorUsedError;
  ToMany<User> get assignesId => throw _privateConstructorUsedError;
  set assignesId(ToMany<User> value) => throw _privateConstructorUsedError;
  ToMany<Task> get subTasks => throw _privateConstructorUsedError;
  set subTasks(ToMany<Task> value) => throw _privateConstructorUsedError;
  ToOne<TaskStatus> get status => throw _privateConstructorUsedError;
  set status(ToOne<TaskStatus> value) => throw _privateConstructorUsedError;
  String get taskDetailsHash => throw _privateConstructorUsedError;
  set taskDetailsHash(String value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res>;
  $Res call(
      {@Id() int oid,
      String id,
      String taskName,
      ToOne<User> creatorId,
      ToOne<Project> projectId,
      ToOne<TaskDetails> taskDetailsId,
      ToMany<User> assignesId,
      ToMany<Task> subTasks,
      ToOne<TaskStatus> status,
      String taskDetailsHash});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res> implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  final Task _value;
  // ignore: unused_field
  final $Res Function(Task) _then;

  @override
  $Res call({
    Object? oid = freezed,
    Object? id = freezed,
    Object? taskName = freezed,
    Object? creatorId = freezed,
    Object? projectId = freezed,
    Object? taskDetailsId = freezed,
    Object? assignesId = freezed,
    Object? subTasks = freezed,
    Object? status = freezed,
    Object? taskDetailsHash = freezed,
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
      taskName: taskName == freezed
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: creatorId == freezed
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as ToOne<User>,
      projectId: projectId == freezed
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as ToOne<Project>,
      taskDetailsId: taskDetailsId == freezed
          ? _value.taskDetailsId
          : taskDetailsId // ignore: cast_nullable_to_non_nullable
              as ToOne<TaskDetails>,
      assignesId: assignesId == freezed
          ? _value.assignesId
          : assignesId // ignore: cast_nullable_to_non_nullable
              as ToMany<User>,
      subTasks: subTasks == freezed
          ? _value.subTasks
          : subTasks // ignore: cast_nullable_to_non_nullable
              as ToMany<Task>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ToOne<TaskStatus>,
      taskDetailsHash: taskDetailsHash == freezed
          ? _value.taskDetailsHash
          : taskDetailsHash // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$_TaskCopyWith(_$_Task value, $Res Function(_$_Task) then) =
      __$$_TaskCopyWithImpl<$Res>;
  @override
  $Res call(
      {@Id() int oid,
      String id,
      String taskName,
      ToOne<User> creatorId,
      ToOne<Project> projectId,
      ToOne<TaskDetails> taskDetailsId,
      ToMany<User> assignesId,
      ToMany<Task> subTasks,
      ToOne<TaskStatus> status,
      String taskDetailsHash});
}

/// @nodoc
class __$$_TaskCopyWithImpl<$Res> extends _$TaskCopyWithImpl<$Res>
    implements _$$_TaskCopyWith<$Res> {
  __$$_TaskCopyWithImpl(_$_Task _value, $Res Function(_$_Task) _then)
      : super(_value, (v) => _then(v as _$_Task));

  @override
  _$_Task get _value => super._value as _$_Task;

  @override
  $Res call({
    Object? oid = freezed,
    Object? id = freezed,
    Object? taskName = freezed,
    Object? creatorId = freezed,
    Object? projectId = freezed,
    Object? taskDetailsId = freezed,
    Object? assignesId = freezed,
    Object? subTasks = freezed,
    Object? status = freezed,
    Object? taskDetailsHash = freezed,
  }) {
    return _then(_$_Task(
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      taskName: taskName == freezed
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: creatorId == freezed
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as ToOne<User>,
      projectId: projectId == freezed
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as ToOne<Project>,
      taskDetailsId: taskDetailsId == freezed
          ? _value.taskDetailsId
          : taskDetailsId // ignore: cast_nullable_to_non_nullable
              as ToOne<TaskDetails>,
      assignesId: assignesId == freezed
          ? _value.assignesId
          : assignesId // ignore: cast_nullable_to_non_nullable
              as ToMany<User>,
      subTasks: subTasks == freezed
          ? _value.subTasks
          : subTasks // ignore: cast_nullable_to_non_nullable
              as ToMany<Task>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ToOne<TaskStatus>,
      taskDetailsHash: taskDetailsHash == freezed
          ? _value.taskDetailsHash
          : taskDetailsHash // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@Entity(realClass: Task)
class _$_Task extends _Task {
  _$_Task(
      {@Id() this.oid = 0,
      required this.id,
      required this.taskName,
      required this.creatorId,
      required this.projectId,
      required this.taskDetailsId,
      required this.assignesId,
      required this.subTasks,
      required this.status,
      this.taskDetailsHash = ""})
      : super._();

  @override
  @JsonKey()
  @Id()
  int oid;
  @override
  String id;
  @override
  String taskName;
  @override
  ToOne<User> creatorId;
  @override
  ToOne<Project> projectId;
  @override
  ToOne<TaskDetails> taskDetailsId;
  @override
  ToMany<User> assignesId;
  @override
  ToMany<Task> subTasks;
  @override
  ToOne<TaskStatus> status;
  @override
  @JsonKey()
  String taskDetailsHash;

  @override
  String toString() {
    return 'Task(oid: $oid, id: $id, taskName: $taskName, creatorId: $creatorId, projectId: $projectId, taskDetailsId: $taskDetailsId, assignesId: $assignesId, subTasks: $subTasks, status: $status, taskDetailsHash: $taskDetailsHash)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_TaskCopyWith<_$_Task> get copyWith =>
      __$$_TaskCopyWithImpl<_$_Task>(this, _$identity);
}

abstract class _Task extends Task {
  factory _Task(
      {@Id() int oid,
      required String id,
      required String taskName,
      required ToOne<User> creatorId,
      required ToOne<Project> projectId,
      required ToOne<TaskDetails> taskDetailsId,
      required ToMany<User> assignesId,
      required ToMany<Task> subTasks,
      required ToOne<TaskStatus> status,
      String taskDetailsHash}) = _$_Task;
  _Task._() : super._();

  @override
  @Id()
  int get oid;
  @Id()
  set oid(int value);
  @override
  String get id;
  set id(String value);
  @override
  String get taskName;
  set taskName(String value);
  @override
  ToOne<User> get creatorId;
  set creatorId(ToOne<User> value);
  @override
  ToOne<Project> get projectId;
  set projectId(ToOne<Project> value);
  @override
  ToOne<TaskDetails> get taskDetailsId;
  set taskDetailsId(ToOne<TaskDetails> value);
  @override
  ToMany<User> get assignesId;
  set assignesId(ToMany<User> value);
  @override
  ToMany<Task> get subTasks;
  set subTasks(ToMany<Task> value);
  @override
  ToOne<TaskStatus> get status;
  set status(ToOne<TaskStatus> value);
  @override
  String get taskDetailsHash;
  set taskDetailsHash(String value);
  @override
  @JsonKey(ignore: true)
  _$$_TaskCopyWith<_$_Task> get copyWith => throw _privateConstructorUsedError;
}
