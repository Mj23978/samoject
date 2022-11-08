// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TaskDetails {
  @Id()
  int get oid => throw _privateConstructorUsedError;
  @Id()
  set oid(int value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get hash => throw _privateConstructorUsedError;
  set hash(String value) => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  set content(String value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskDetailsCopyWith<TaskDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskDetailsCopyWith<$Res> {
  factory $TaskDetailsCopyWith(
          TaskDetails value, $Res Function(TaskDetails) then) =
      _$TaskDetailsCopyWithImpl<$Res>;
  $Res call({@Id() int oid, String id, String hash, String content});
}

/// @nodoc
class _$TaskDetailsCopyWithImpl<$Res> implements $TaskDetailsCopyWith<$Res> {
  _$TaskDetailsCopyWithImpl(this._value, this._then);

  final TaskDetails _value;
  // ignore: unused_field
  final $Res Function(TaskDetails) _then;

  @override
  $Res call({
    Object? oid = freezed,
    Object? id = freezed,
    Object? hash = freezed,
    Object? content = freezed,
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
      hash: hash == freezed
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_TaskDetailsCopyWith<$Res>
    implements $TaskDetailsCopyWith<$Res> {
  factory _$$_TaskDetailsCopyWith(
          _$_TaskDetails value, $Res Function(_$_TaskDetails) then) =
      __$$_TaskDetailsCopyWithImpl<$Res>;
  @override
  $Res call({@Id() int oid, String id, String hash, String content});
}

/// @nodoc
class __$$_TaskDetailsCopyWithImpl<$Res> extends _$TaskDetailsCopyWithImpl<$Res>
    implements _$$_TaskDetailsCopyWith<$Res> {
  __$$_TaskDetailsCopyWithImpl(
      _$_TaskDetails _value, $Res Function(_$_TaskDetails) _then)
      : super(_value, (v) => _then(v as _$_TaskDetails));

  @override
  _$_TaskDetails get _value => super._value as _$_TaskDetails;

  @override
  $Res call({
    Object? oid = freezed,
    Object? id = freezed,
    Object? hash = freezed,
    Object? content = freezed,
  }) {
    return _then(_$_TaskDetails(
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hash: hash == freezed
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@Entity(realClass: TaskDetails)
class _$_TaskDetails extends _TaskDetails {
  _$_TaskDetails(
      {@Id() this.oid = 0,
      required this.id,
      required this.hash,
      this.content = ""})
      : super._();

  @override
  @JsonKey()
  @Id()
  int oid;
  @override
  String id;
  @override
  String hash;
  @override
  @JsonKey()
  String content;

  @override
  String toString() {
    return 'TaskDetails(oid: $oid, id: $id, hash: $hash, content: $content)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_TaskDetailsCopyWith<_$_TaskDetails> get copyWith =>
      __$$_TaskDetailsCopyWithImpl<_$_TaskDetails>(this, _$identity);
}

abstract class _TaskDetails extends TaskDetails {
  factory _TaskDetails(
      {@Id() int oid,
      required String id,
      required String hash,
      String content}) = _$_TaskDetails;
  _TaskDetails._() : super._();

  @override
  @Id()
  int get oid;
  @Id()
  set oid(int value);
  @override
  String get id;
  set id(String value);
  @override
  String get hash;
  set hash(String value);
  @override
  String get content;
  set content(String value);
  @override
  @JsonKey(ignore: true)
  _$$_TaskDetailsCopyWith<_$_TaskDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
