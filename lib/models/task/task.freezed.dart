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
  String get status => throw _privateConstructorUsedError;
  String get taskDetailsId => throw _privateConstructorUsedError;
  String get taskDetailsHash => throw _privateConstructorUsedError;
  List<Task> get subTaks => throw _privateConstructorUsedError;
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
      String status,
      String taskDetailsId,
      String taskDetailsHash,
      List<Task> subTaks,
      Map<String, dynamic> attributes});
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
    Object? status = freezed,
    Object? taskDetailsId = freezed,
    Object? taskDetailsHash = freezed,
    Object? subTaks = freezed,
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
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      taskDetailsId: taskDetailsId == freezed
          ? _value.taskDetailsId
          : taskDetailsId // ignore: cast_nullable_to_non_nullable
              as String,
      taskDetailsHash: taskDetailsHash == freezed
          ? _value.taskDetailsHash
          : taskDetailsHash // ignore: cast_nullable_to_non_nullable
              as String,
      subTaks: subTaks == freezed
          ? _value.subTaks
          : subTaks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      attributes: attributes == freezed
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
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
      String status,
      String taskDetailsId,
      String taskDetailsHash,
      List<Task> subTaks,
      Map<String, dynamic> attributes});
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
    Object? status = freezed,
    Object? taskDetailsId = freezed,
    Object? taskDetailsHash = freezed,
    Object? subTaks = freezed,
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
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      taskDetailsId: taskDetailsId == freezed
          ? _value.taskDetailsId
          : taskDetailsId // ignore: cast_nullable_to_non_nullable
              as String,
      taskDetailsHash: taskDetailsHash == freezed
          ? _value.taskDetailsHash
          : taskDetailsHash // ignore: cast_nullable_to_non_nullable
              as String,
      subTaks: subTaks == freezed
          ? _value._subTaks
          : subTaks // ignore: cast_nullable_to_non_nullable
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
      this.status = "starting",
      this.taskDetailsId = "",
      this.taskDetailsHash = "",
      final List<Task> subTaks = const [],
      final Map<String, dynamic> attributes = const {}})
      : _subTaks = subTaks,
        _attributes = attributes,
        super._();

  factory _$_Task.fromJson(Map<String, dynamic> json) => _$$_TaskFromJson(json);

  @override
  final String id;
  @override
  final String taskName;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final String taskDetailsId;
  @override
  @JsonKey()
  final String taskDetailsHash;
  final List<Task> _subTaks;
  @override
  @JsonKey()
  List<Task> get subTaks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subTaks);
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
    return 'Task(id: $id, taskName: $taskName, status: $status, taskDetailsId: $taskDetailsId, taskDetailsHash: $taskDetailsHash, subTaks: $subTaks, attributes: $attributes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Task &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.taskName, taskName) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.taskDetailsId, taskDetailsId) &&
            const DeepCollectionEquality()
                .equals(other.taskDetailsHash, taskDetailsHash) &&
            const DeepCollectionEquality().equals(other._subTaks, _subTaks) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(taskName),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(taskDetailsId),
      const DeepCollectionEquality().hash(taskDetailsHash),
      const DeepCollectionEquality().hash(_subTaks),
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
      final String status,
      final String taskDetailsId,
      final String taskDetailsHash,
      final List<Task> subTaks,
      final Map<String, dynamic> attributes}) = _$_Task;
  const _Task._() : super._();

  factory _Task.fromJson(Map<String, dynamic> json) = _$_Task.fromJson;

  @override
  String get id;
  @override
  String get taskName;
  @override
  String get status;
  @override
  String get taskDetailsId;
  @override
  String get taskDetailsHash;
  @override
  List<Task> get subTaks;
  @override
  Map<String, dynamic> get attributes;
  @override
  @JsonKey(ignore: true)
  _$$_TaskCopyWith<_$_Task> get copyWith => throw _privateConstructorUsedError;
}
