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

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  String get id => throw _privateConstructorUsedError;
  String get taskName => throw _privateConstructorUsedError;
  String get creatorId => throw _privateConstructorUsedError;
  String? get projectId => throw _privateConstructorUsedError;
  List<String> get assignesId => throw _privateConstructorUsedError;
  TaskStatus get status => throw _privateConstructorUsedError;
  String get taskDetailsId => throw _privateConstructorUsedError;
  String get taskDetailsHash => throw _privateConstructorUsedError;
  List<Task> get subTasks => throw _privateConstructorUsedError;
  Map<String, dynamic> get attributes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String taskName,
      String creatorId,
      String? projectId,
      List<String> assignesId,
      TaskStatus status,
      String taskDetailsId,
      String taskDetailsHash,
      List<Task> subTasks,
      Map<String, dynamic> attributes});

  $TaskStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$TaskCopyWithImpl<$Res> implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  final Task _value;
  // ignore: unused_field
  final $Res Function(Task) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? taskName = freezed,
    Object? creatorId = freezed,
    Object? projectId = freezed,
    Object? assignesId = freezed,
    Object? status = freezed,
    Object? taskDetailsId = freezed,
    Object? taskDetailsHash = freezed,
    Object? subTasks = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_value.copyWith(
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
              as String,
      projectId: projectId == freezed
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      assignesId: assignesId == freezed
          ? _value.assignesId
          : assignesId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      taskDetailsId: taskDetailsId == freezed
          ? _value.taskDetailsId
          : taskDetailsId // ignore: cast_nullable_to_non_nullable
              as String,
      taskDetailsHash: taskDetailsHash == freezed
          ? _value.taskDetailsHash
          : taskDetailsHash // ignore: cast_nullable_to_non_nullable
              as String,
      subTasks: subTasks == freezed
          ? _value.subTasks
          : subTasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      attributes: attributes == freezed
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }

  @override
  $TaskStatusCopyWith<$Res> get status {
    return $TaskStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value));
    });
  }
}

/// @nodoc
abstract class _$$_TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$_TaskCopyWith(_$_Task value, $Res Function(_$_Task) then) =
      __$$_TaskCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String taskName,
      String creatorId,
      String? projectId,
      List<String> assignesId,
      TaskStatus status,
      String taskDetailsId,
      String taskDetailsHash,
      List<Task> subTasks,
      Map<String, dynamic> attributes});

  @override
  $TaskStatusCopyWith<$Res> get status;
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
    Object? id = freezed,
    Object? taskName = freezed,
    Object? creatorId = freezed,
    Object? projectId = freezed,
    Object? assignesId = freezed,
    Object? status = freezed,
    Object? taskDetailsId = freezed,
    Object? taskDetailsHash = freezed,
    Object? subTasks = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$_Task(
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
              as String,
      projectId: projectId == freezed
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      assignesId: assignesId == freezed
          ? _value._assignesId
          : assignesId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      taskDetailsId: taskDetailsId == freezed
          ? _value.taskDetailsId
          : taskDetailsId // ignore: cast_nullable_to_non_nullable
              as String,
      taskDetailsHash: taskDetailsHash == freezed
          ? _value.taskDetailsHash
          : taskDetailsHash // ignore: cast_nullable_to_non_nullable
              as String,
      subTasks: subTasks == freezed
          ? _value._subTasks
          : subTasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      attributes: attributes == freezed
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Task extends _Task {
  const _$_Task(
      {required this.id,
      required this.taskName,
      required this.creatorId,
      this.projectId,
      final List<String> assignesId = const [],
      this.status = const TaskStatus.idea(),
      this.taskDetailsId = "",
      this.taskDetailsHash = "",
      final List<Task> subTasks = const [],
      final Map<String, dynamic> attributes = const {}})
      : _assignesId = assignesId,
        _subTasks = subTasks,
        _attributes = attributes,
        super._();

  factory _$_Task.fromJson(Map<String, dynamic> json) => _$$_TaskFromJson(json);

  @override
  final String id;
  @override
  final String taskName;
  @override
  final String creatorId;
  @override
  final String? projectId;
  final List<String> _assignesId;
  @override
  @JsonKey()
  List<String> get assignesId {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assignesId);
  }

  @override
  @JsonKey()
  final TaskStatus status;
  @override
  @JsonKey()
  final String taskDetailsId;
  @override
  @JsonKey()
  final String taskDetailsHash;
  final List<Task> _subTasks;
  @override
  @JsonKey()
  List<Task> get subTasks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subTasks);
  }

  final Map<String, dynamic> _attributes;
  @override
  @JsonKey()
  Map<String, dynamic> get attributes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_attributes);
  }

  @override
  String toString() {
    return 'Task(id: $id, taskName: $taskName, creatorId: $creatorId, projectId: $projectId, assignesId: $assignesId, status: $status, taskDetailsId: $taskDetailsId, taskDetailsHash: $taskDetailsHash, subTasks: $subTasks, attributes: $attributes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Task &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.taskName, taskName) &&
            const DeepCollectionEquality().equals(other.creatorId, creatorId) &&
            const DeepCollectionEquality().equals(other.projectId, projectId) &&
            const DeepCollectionEquality()
                .equals(other._assignesId, _assignesId) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.taskDetailsId, taskDetailsId) &&
            const DeepCollectionEquality()
                .equals(other.taskDetailsHash, taskDetailsHash) &&
            const DeepCollectionEquality().equals(other._subTasks, _subTasks) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(taskName),
      const DeepCollectionEquality().hash(creatorId),
      const DeepCollectionEquality().hash(projectId),
      const DeepCollectionEquality().hash(_assignesId),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(taskDetailsId),
      const DeepCollectionEquality().hash(taskDetailsHash),
      const DeepCollectionEquality().hash(_subTasks),
      const DeepCollectionEquality().hash(_attributes));

  @JsonKey(ignore: true)
  @override
  _$$_TaskCopyWith<_$_Task> get copyWith =>
      __$$_TaskCopyWithImpl<_$_Task>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskToJson(
      this,
    );
  }
}

abstract class _Task extends Task {
  const factory _Task(
      {required final String id,
      required final String taskName,
      required final String creatorId,
      final String? projectId,
      final List<String> assignesId,
      final TaskStatus status,
      final String taskDetailsId,
      final String taskDetailsHash,
      final List<Task> subTasks,
      final Map<String, dynamic> attributes}) = _$_Task;
  const _Task._() : super._();

  factory _Task.fromJson(Map<String, dynamic> json) = _$_Task.fromJson;

  @override
  String get id;
  @override
  String get taskName;
  @override
  String get creatorId;
  @override
  String? get projectId;
  @override
  List<String> get assignesId;
  @override
  TaskStatus get status;
  @override
  String get taskDetailsId;
  @override
  String get taskDetailsHash;
  @override
  List<Task> get subTasks;
  @override
  Map<String, dynamic> get attributes;
  @override
  @JsonKey(ignore: true)
  _$$_TaskCopyWith<_$_Task> get copyWith => throw _privateConstructorUsedError;
}
