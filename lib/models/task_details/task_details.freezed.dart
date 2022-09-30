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

TaskDetails _$TaskDetailsFromJson(Map<String, dynamic> json) {
  return _TaskDetails.fromJson(json);
}

/// @nodoc
mixin _$TaskDetails {
  String get id => throw _privateConstructorUsedError;
  String get hash => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  Map<String, dynamic> get attributes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskDetailsCopyWith<TaskDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskDetailsCopyWith<$Res> {
  factory $TaskDetailsCopyWith(
          TaskDetails value, $Res Function(TaskDetails) then) =
      _$TaskDetailsCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String hash,
      String content,
      Map<String, dynamic> attributes});
}

/// @nodoc
class _$TaskDetailsCopyWithImpl<$Res> implements $TaskDetailsCopyWith<$Res> {
  _$TaskDetailsCopyWithImpl(this._value, this._then);

  final TaskDetails _value;
  // ignore: unused_field
  final $Res Function(TaskDetails) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? hash = freezed,
    Object? content = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_value.copyWith(
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
      attributes: attributes == freezed
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
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
  $Res call(
      {String id,
      String hash,
      String content,
      Map<String, dynamic> attributes});
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
    Object? id = freezed,
    Object? hash = freezed,
    Object? content = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$_TaskDetails(
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
      attributes: attributes == freezed
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaskDetails extends _TaskDetails {
  const _$_TaskDetails(
      {required this.id,
      required this.hash,
      this.content = "",
      final Map<String, dynamic> attributes = const {}})
      : _attributes = attributes,
        super._();

  factory _$_TaskDetails.fromJson(Map<String, dynamic> json) =>
      _$$_TaskDetailsFromJson(json);

  @override
  final String id;
  @override
  final String hash;
  @override
  @JsonKey()
  final String content;
  final Map<String, dynamic> _attributes;
  @override
  @JsonKey()
  Map<String, dynamic> get attributes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_attributes);
  }

  @override
  String toString() {
    return 'TaskDetails(id: $id, hash: $hash, content: $content, attributes: $attributes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskDetails &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.hash, hash) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(hash),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(_attributes));

  @JsonKey(ignore: true)
  @override
  _$$_TaskDetailsCopyWith<_$_TaskDetails> get copyWith =>
      __$$_TaskDetailsCopyWithImpl<_$_TaskDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskDetailsToJson(
      this,
    );
  }
}

abstract class _TaskDetails extends TaskDetails {
  const factory _TaskDetails(
      {required final String id,
      required final String hash,
      final String content,
      final Map<String, dynamic> attributes}) = _$_TaskDetails;
  const _TaskDetails._() : super._();

  factory _TaskDetails.fromJson(Map<String, dynamic> json) =
      _$_TaskDetails.fromJson;

  @override
  String get id;
  @override
  String get hash;
  @override
  String get content;
  @override
  Map<String, dynamic> get attributes;
  @override
  @JsonKey(ignore: true)
  _$$_TaskDetailsCopyWith<_$_TaskDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
