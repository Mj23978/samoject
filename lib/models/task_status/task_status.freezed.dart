// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskStatus _$TaskStatusFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _TaskStatus.fromJson(json);
    case 'complete':
      return Complete.fromJson(json);
    case 'todo':
      return TODO.fromJson(json);
    case 'idea':
      return IDEA.fromJson(json);
    case 'underReview':
      return UnderReview.fromJson(json);
    case 'starting':
      return Starting.fromJson(json);
    case 'planned':
      return Planned.fromJson(json);
    case 'inProgress':
      return InProgress.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'TaskStatus',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$TaskStatus {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(toJson: color2String, fromJson: string2Color)
  Color get color => throw _privateConstructorUsedError;
  Map<String, dynamic> get attributes => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        $default, {
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        complete,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        todo,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        idea,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        underReview,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        starting,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        planned,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        inProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        inProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        inProgress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TaskStatus value) $default, {
    required TResult Function(Complete value) complete,
    required TResult Function(TODO value) todo,
    required TResult Function(IDEA value) idea,
    required TResult Function(UnderReview value) underReview,
    required TResult Function(Starting value) starting,
    required TResult Function(Planned value) planned,
    required TResult Function(InProgress value) inProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_TaskStatus value)? $default, {
    TResult Function(Complete value)? complete,
    TResult Function(TODO value)? todo,
    TResult Function(IDEA value)? idea,
    TResult Function(UnderReview value)? underReview,
    TResult Function(Starting value)? starting,
    TResult Function(Planned value)? planned,
    TResult Function(InProgress value)? inProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TaskStatus value)? $default, {
    TResult Function(Complete value)? complete,
    TResult Function(TODO value)? todo,
    TResult Function(IDEA value)? idea,
    TResult Function(UnderReview value)? underReview,
    TResult Function(Starting value)? starting,
    TResult Function(Planned value)? planned,
    TResult Function(InProgress value)? inProgress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskStatusCopyWith<TaskStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskStatusCopyWith<$Res> {
  factory $TaskStatusCopyWith(
          TaskStatus value, $Res Function(TaskStatus) then) =
      _$TaskStatusCopyWithImpl<$Res>;
  $Res call(
      {String name,
      @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
      Map<String, dynamic> attributes});
}

/// @nodoc
class _$TaskStatusCopyWithImpl<$Res> implements $TaskStatusCopyWith<$Res> {
  _$TaskStatusCopyWithImpl(this._value, this._then);

  final TaskStatus _value;
  // ignore: unused_field
  final $Res Function(TaskStatus) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? color = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      attributes: attributes == freezed
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$$_TaskStatusCopyWith<$Res>
    implements $TaskStatusCopyWith<$Res> {
  factory _$$_TaskStatusCopyWith(
          _$_TaskStatus value, $Res Function(_$_TaskStatus) then) =
      __$$_TaskStatusCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
      Map<String, dynamic> attributes});
}

/// @nodoc
class __$$_TaskStatusCopyWithImpl<$Res> extends _$TaskStatusCopyWithImpl<$Res>
    implements _$$_TaskStatusCopyWith<$Res> {
  __$$_TaskStatusCopyWithImpl(
      _$_TaskStatus _value, $Res Function(_$_TaskStatus) _then)
      : super(_value, (v) => _then(v as _$_TaskStatus));

  @override
  _$_TaskStatus get _value => super._value as _$_TaskStatus;

  @override
  $Res call({
    Object? name = freezed,
    Object? color = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$_TaskStatus(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      attributes: attributes == freezed
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaskStatus extends _TaskStatus {
  const _$_TaskStatus(
      {required this.name,
      @JsonKey(toJson: color2String, fromJson: string2Color)
          required this.color,
      final Map<String, dynamic> attributes = const {},
      final String? $type})
      : _attributes = attributes,
        $type = $type ?? 'default',
        super._();

  factory _$_TaskStatus.fromJson(Map<String, dynamic> json) =>
      _$$_TaskStatusFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(toJson: color2String, fromJson: string2Color)
  final Color color;
  final Map<String, dynamic> _attributes;
  @override
  @JsonKey()
  Map<String, dynamic> get attributes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_attributes);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TaskStatus(name: $name, color: $color, attributes: $attributes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskStatus &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(_attributes));

  @JsonKey(ignore: true)
  @override
  _$$_TaskStatusCopyWith<_$_TaskStatus> get copyWith =>
      __$$_TaskStatusCopyWithImpl<_$_TaskStatus>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        $default, {
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        complete,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        todo,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        idea,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        underReview,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        starting,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        planned,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        inProgress,
  }) {
    return $default(name, color, attributes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        inProgress,
  }) {
    return $default?.call(name, color, attributes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        inProgress,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(name, color, attributes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TaskStatus value) $default, {
    required TResult Function(Complete value) complete,
    required TResult Function(TODO value) todo,
    required TResult Function(IDEA value) idea,
    required TResult Function(UnderReview value) underReview,
    required TResult Function(Starting value) starting,
    required TResult Function(Planned value) planned,
    required TResult Function(InProgress value) inProgress,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_TaskStatus value)? $default, {
    TResult Function(Complete value)? complete,
    TResult Function(TODO value)? todo,
    TResult Function(IDEA value)? idea,
    TResult Function(UnderReview value)? underReview,
    TResult Function(Starting value)? starting,
    TResult Function(Planned value)? planned,
    TResult Function(InProgress value)? inProgress,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TaskStatus value)? $default, {
    TResult Function(Complete value)? complete,
    TResult Function(TODO value)? todo,
    TResult Function(IDEA value)? idea,
    TResult Function(UnderReview value)? underReview,
    TResult Function(Starting value)? starting,
    TResult Function(Planned value)? planned,
    TResult Function(InProgress value)? inProgress,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskStatusToJson(
      this,
    );
  }
}

abstract class _TaskStatus extends TaskStatus {
  const factory _TaskStatus(
      {required final String name,
      @JsonKey(toJson: color2String, fromJson: string2Color)
          required final Color color,
      final Map<String, dynamic> attributes}) = _$_TaskStatus;
  const _TaskStatus._() : super._();

  factory _TaskStatus.fromJson(Map<String, dynamic> json) =
      _$_TaskStatus.fromJson;

  @override
  String get name;
  @override
  @JsonKey(toJson: color2String, fromJson: string2Color)
  Color get color;
  @override
  Map<String, dynamic> get attributes;
  @override
  @JsonKey(ignore: true)
  _$$_TaskStatusCopyWith<_$_TaskStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CompleteCopyWith<$Res> implements $TaskStatusCopyWith<$Res> {
  factory _$$CompleteCopyWith(
          _$Complete value, $Res Function(_$Complete) then) =
      __$$CompleteCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
      Map<String, dynamic> attributes});
}

/// @nodoc
class __$$CompleteCopyWithImpl<$Res> extends _$TaskStatusCopyWithImpl<$Res>
    implements _$$CompleteCopyWith<$Res> {
  __$$CompleteCopyWithImpl(_$Complete _value, $Res Function(_$Complete) _then)
      : super(_value, (v) => _then(v as _$Complete));

  @override
  _$Complete get _value => super._value as _$Complete;

  @override
  $Res call({
    Object? name = freezed,
    Object? color = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$Complete(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      attributes: attributes == freezed
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Complete extends Complete {
  const _$Complete(
      {this.name = 'Complete',
      @JsonKey(toJson: color2String, fromJson: string2Color)
          this.color = Colors.lightGreen,
      final Map<String, dynamic> attributes = const {},
      final String? $type})
      : _attributes = attributes,
        $type = $type ?? 'complete',
        super._();

  factory _$Complete.fromJson(Map<String, dynamic> json) =>
      _$$CompleteFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey(toJson: color2String, fromJson: string2Color)
  final Color color;
  final Map<String, dynamic> _attributes;
  @override
  @JsonKey()
  Map<String, dynamic> get attributes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_attributes);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TaskStatus.complete(name: $name, color: $color, attributes: $attributes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Complete &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(_attributes));

  @JsonKey(ignore: true)
  @override
  _$$CompleteCopyWith<_$Complete> get copyWith =>
      __$$CompleteCopyWithImpl<_$Complete>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        $default, {
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        complete,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        todo,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        idea,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        underReview,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        starting,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        planned,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        inProgress,
  }) {
    return complete(name, color, attributes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        inProgress,
  }) {
    return complete?.call(name, color, attributes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        inProgress,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(name, color, attributes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TaskStatus value) $default, {
    required TResult Function(Complete value) complete,
    required TResult Function(TODO value) todo,
    required TResult Function(IDEA value) idea,
    required TResult Function(UnderReview value) underReview,
    required TResult Function(Starting value) starting,
    required TResult Function(Planned value) planned,
    required TResult Function(InProgress value) inProgress,
  }) {
    return complete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_TaskStatus value)? $default, {
    TResult Function(Complete value)? complete,
    TResult Function(TODO value)? todo,
    TResult Function(IDEA value)? idea,
    TResult Function(UnderReview value)? underReview,
    TResult Function(Starting value)? starting,
    TResult Function(Planned value)? planned,
    TResult Function(InProgress value)? inProgress,
  }) {
    return complete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TaskStatus value)? $default, {
    TResult Function(Complete value)? complete,
    TResult Function(TODO value)? todo,
    TResult Function(IDEA value)? idea,
    TResult Function(UnderReview value)? underReview,
    TResult Function(Starting value)? starting,
    TResult Function(Planned value)? planned,
    TResult Function(InProgress value)? inProgress,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CompleteToJson(
      this,
    );
  }
}

abstract class Complete extends TaskStatus {
  const factory Complete(
      {final String name,
      @JsonKey(toJson: color2String, fromJson: string2Color) final Color color,
      final Map<String, dynamic> attributes}) = _$Complete;
  const Complete._() : super._();

  factory Complete.fromJson(Map<String, dynamic> json) = _$Complete.fromJson;

  @override
  String get name;
  @override
  @JsonKey(toJson: color2String, fromJson: string2Color)
  Color get color;
  @override
  Map<String, dynamic> get attributes;
  @override
  @JsonKey(ignore: true)
  _$$CompleteCopyWith<_$Complete> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TODOCopyWith<$Res> implements $TaskStatusCopyWith<$Res> {
  factory _$$TODOCopyWith(_$TODO value, $Res Function(_$TODO) then) =
      __$$TODOCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
      Map<String, dynamic> attributes});
}

/// @nodoc
class __$$TODOCopyWithImpl<$Res> extends _$TaskStatusCopyWithImpl<$Res>
    implements _$$TODOCopyWith<$Res> {
  __$$TODOCopyWithImpl(_$TODO _value, $Res Function(_$TODO) _then)
      : super(_value, (v) => _then(v as _$TODO));

  @override
  _$TODO get _value => super._value as _$TODO;

  @override
  $Res call({
    Object? name = freezed,
    Object? color = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$TODO(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      attributes: attributes == freezed
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TODO extends TODO {
  const _$TODO(
      {this.name = 'Todo',
      @JsonKey(toJson: color2String, fromJson: string2Color)
          this.color = Colors.yellow,
      final Map<String, dynamic> attributes = const {},
      final String? $type})
      : _attributes = attributes,
        $type = $type ?? 'todo',
        super._();

  factory _$TODO.fromJson(Map<String, dynamic> json) => _$$TODOFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey(toJson: color2String, fromJson: string2Color)
  final Color color;
  final Map<String, dynamic> _attributes;
  @override
  @JsonKey()
  Map<String, dynamic> get attributes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_attributes);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TaskStatus.todo(name: $name, color: $color, attributes: $attributes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TODO &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(_attributes));

  @JsonKey(ignore: true)
  @override
  _$$TODOCopyWith<_$TODO> get copyWith =>
      __$$TODOCopyWithImpl<_$TODO>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        $default, {
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        complete,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        todo,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        idea,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        underReview,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        starting,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        planned,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        inProgress,
  }) {
    return todo(name, color, attributes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        inProgress,
  }) {
    return todo?.call(name, color, attributes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        inProgress,
    required TResult orElse(),
  }) {
    if (todo != null) {
      return todo(name, color, attributes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TaskStatus value) $default, {
    required TResult Function(Complete value) complete,
    required TResult Function(TODO value) todo,
    required TResult Function(IDEA value) idea,
    required TResult Function(UnderReview value) underReview,
    required TResult Function(Starting value) starting,
    required TResult Function(Planned value) planned,
    required TResult Function(InProgress value) inProgress,
  }) {
    return todo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_TaskStatus value)? $default, {
    TResult Function(Complete value)? complete,
    TResult Function(TODO value)? todo,
    TResult Function(IDEA value)? idea,
    TResult Function(UnderReview value)? underReview,
    TResult Function(Starting value)? starting,
    TResult Function(Planned value)? planned,
    TResult Function(InProgress value)? inProgress,
  }) {
    return todo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TaskStatus value)? $default, {
    TResult Function(Complete value)? complete,
    TResult Function(TODO value)? todo,
    TResult Function(IDEA value)? idea,
    TResult Function(UnderReview value)? underReview,
    TResult Function(Starting value)? starting,
    TResult Function(Planned value)? planned,
    TResult Function(InProgress value)? inProgress,
    required TResult orElse(),
  }) {
    if (todo != null) {
      return todo(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TODOToJson(
      this,
    );
  }
}

abstract class TODO extends TaskStatus {
  const factory TODO(
      {final String name,
      @JsonKey(toJson: color2String, fromJson: string2Color) final Color color,
      final Map<String, dynamic> attributes}) = _$TODO;
  const TODO._() : super._();

  factory TODO.fromJson(Map<String, dynamic> json) = _$TODO.fromJson;

  @override
  String get name;
  @override
  @JsonKey(toJson: color2String, fromJson: string2Color)
  Color get color;
  @override
  Map<String, dynamic> get attributes;
  @override
  @JsonKey(ignore: true)
  _$$TODOCopyWith<_$TODO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IDEACopyWith<$Res> implements $TaskStatusCopyWith<$Res> {
  factory _$$IDEACopyWith(_$IDEA value, $Res Function(_$IDEA) then) =
      __$$IDEACopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
      Map<String, dynamic> attributes});
}

/// @nodoc
class __$$IDEACopyWithImpl<$Res> extends _$TaskStatusCopyWithImpl<$Res>
    implements _$$IDEACopyWith<$Res> {
  __$$IDEACopyWithImpl(_$IDEA _value, $Res Function(_$IDEA) _then)
      : super(_value, (v) => _then(v as _$IDEA));

  @override
  _$IDEA get _value => super._value as _$IDEA;

  @override
  $Res call({
    Object? name = freezed,
    Object? color = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$IDEA(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      attributes: attributes == freezed
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IDEA extends IDEA {
  const _$IDEA(
      {this.name = 'Idea',
      @JsonKey(toJson: color2String, fromJson: string2Color)
          this.color = Colors.grey,
      final Map<String, dynamic> attributes = const {},
      final String? $type})
      : _attributes = attributes,
        $type = $type ?? 'idea',
        super._();

  factory _$IDEA.fromJson(Map<String, dynamic> json) => _$$IDEAFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey(toJson: color2String, fromJson: string2Color)
  final Color color;
  final Map<String, dynamic> _attributes;
  @override
  @JsonKey()
  Map<String, dynamic> get attributes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_attributes);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TaskStatus.idea(name: $name, color: $color, attributes: $attributes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IDEA &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(_attributes));

  @JsonKey(ignore: true)
  @override
  _$$IDEACopyWith<_$IDEA> get copyWith =>
      __$$IDEACopyWithImpl<_$IDEA>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        $default, {
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        complete,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        todo,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        idea,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        underReview,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        starting,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        planned,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        inProgress,
  }) {
    return idea(name, color, attributes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        inProgress,
  }) {
    return idea?.call(name, color, attributes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        inProgress,
    required TResult orElse(),
  }) {
    if (idea != null) {
      return idea(name, color, attributes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TaskStatus value) $default, {
    required TResult Function(Complete value) complete,
    required TResult Function(TODO value) todo,
    required TResult Function(IDEA value) idea,
    required TResult Function(UnderReview value) underReview,
    required TResult Function(Starting value) starting,
    required TResult Function(Planned value) planned,
    required TResult Function(InProgress value) inProgress,
  }) {
    return idea(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_TaskStatus value)? $default, {
    TResult Function(Complete value)? complete,
    TResult Function(TODO value)? todo,
    TResult Function(IDEA value)? idea,
    TResult Function(UnderReview value)? underReview,
    TResult Function(Starting value)? starting,
    TResult Function(Planned value)? planned,
    TResult Function(InProgress value)? inProgress,
  }) {
    return idea?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TaskStatus value)? $default, {
    TResult Function(Complete value)? complete,
    TResult Function(TODO value)? todo,
    TResult Function(IDEA value)? idea,
    TResult Function(UnderReview value)? underReview,
    TResult Function(Starting value)? starting,
    TResult Function(Planned value)? planned,
    TResult Function(InProgress value)? inProgress,
    required TResult orElse(),
  }) {
    if (idea != null) {
      return idea(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$IDEAToJson(
      this,
    );
  }
}

abstract class IDEA extends TaskStatus {
  const factory IDEA(
      {final String name,
      @JsonKey(toJson: color2String, fromJson: string2Color) final Color color,
      final Map<String, dynamic> attributes}) = _$IDEA;
  const IDEA._() : super._();

  factory IDEA.fromJson(Map<String, dynamic> json) = _$IDEA.fromJson;

  @override
  String get name;
  @override
  @JsonKey(toJson: color2String, fromJson: string2Color)
  Color get color;
  @override
  Map<String, dynamic> get attributes;
  @override
  @JsonKey(ignore: true)
  _$$IDEACopyWith<_$IDEA> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnderReviewCopyWith<$Res>
    implements $TaskStatusCopyWith<$Res> {
  factory _$$UnderReviewCopyWith(
          _$UnderReview value, $Res Function(_$UnderReview) then) =
      __$$UnderReviewCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
      Map<String, dynamic> attributes});
}

/// @nodoc
class __$$UnderReviewCopyWithImpl<$Res> extends _$TaskStatusCopyWithImpl<$Res>
    implements _$$UnderReviewCopyWith<$Res> {
  __$$UnderReviewCopyWithImpl(
      _$UnderReview _value, $Res Function(_$UnderReview) _then)
      : super(_value, (v) => _then(v as _$UnderReview));

  @override
  _$UnderReview get _value => super._value as _$UnderReview;

  @override
  $Res call({
    Object? name = freezed,
    Object? color = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$UnderReview(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      attributes: attributes == freezed
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UnderReview extends UnderReview {
  const _$UnderReview(
      {this.name = 'Under Review',
      @JsonKey(toJson: color2String, fromJson: string2Color)
          this.color = const Color(0xffffb74d),
      final Map<String, dynamic> attributes = const {},
      final String? $type})
      : _attributes = attributes,
        $type = $type ?? 'underReview',
        super._();

  factory _$UnderReview.fromJson(Map<String, dynamic> json) =>
      _$$UnderReviewFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey(toJson: color2String, fromJson: string2Color)
  final Color color;
  final Map<String, dynamic> _attributes;
  @override
  @JsonKey()
  Map<String, dynamic> get attributes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_attributes);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TaskStatus.underReview(name: $name, color: $color, attributes: $attributes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnderReview &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(_attributes));

  @JsonKey(ignore: true)
  @override
  _$$UnderReviewCopyWith<_$UnderReview> get copyWith =>
      __$$UnderReviewCopyWithImpl<_$UnderReview>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        $default, {
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        complete,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        todo,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        idea,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        underReview,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        starting,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        planned,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        inProgress,
  }) {
    return underReview(name, color, attributes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        inProgress,
  }) {
    return underReview?.call(name, color, attributes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        inProgress,
    required TResult orElse(),
  }) {
    if (underReview != null) {
      return underReview(name, color, attributes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TaskStatus value) $default, {
    required TResult Function(Complete value) complete,
    required TResult Function(TODO value) todo,
    required TResult Function(IDEA value) idea,
    required TResult Function(UnderReview value) underReview,
    required TResult Function(Starting value) starting,
    required TResult Function(Planned value) planned,
    required TResult Function(InProgress value) inProgress,
  }) {
    return underReview(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_TaskStatus value)? $default, {
    TResult Function(Complete value)? complete,
    TResult Function(TODO value)? todo,
    TResult Function(IDEA value)? idea,
    TResult Function(UnderReview value)? underReview,
    TResult Function(Starting value)? starting,
    TResult Function(Planned value)? planned,
    TResult Function(InProgress value)? inProgress,
  }) {
    return underReview?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TaskStatus value)? $default, {
    TResult Function(Complete value)? complete,
    TResult Function(TODO value)? todo,
    TResult Function(IDEA value)? idea,
    TResult Function(UnderReview value)? underReview,
    TResult Function(Starting value)? starting,
    TResult Function(Planned value)? planned,
    TResult Function(InProgress value)? inProgress,
    required TResult orElse(),
  }) {
    if (underReview != null) {
      return underReview(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UnderReviewToJson(
      this,
    );
  }
}

abstract class UnderReview extends TaskStatus {
  const factory UnderReview(
      {final String name,
      @JsonKey(toJson: color2String, fromJson: string2Color) final Color color,
      final Map<String, dynamic> attributes}) = _$UnderReview;
  const UnderReview._() : super._();

  factory UnderReview.fromJson(Map<String, dynamic> json) =
      _$UnderReview.fromJson;

  @override
  String get name;
  @override
  @JsonKey(toJson: color2String, fromJson: string2Color)
  Color get color;
  @override
  Map<String, dynamic> get attributes;
  @override
  @JsonKey(ignore: true)
  _$$UnderReviewCopyWith<_$UnderReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StartingCopyWith<$Res> implements $TaskStatusCopyWith<$Res> {
  factory _$$StartingCopyWith(
          _$Starting value, $Res Function(_$Starting) then) =
      __$$StartingCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
      Map<String, dynamic> attributes});
}

/// @nodoc
class __$$StartingCopyWithImpl<$Res> extends _$TaskStatusCopyWithImpl<$Res>
    implements _$$StartingCopyWith<$Res> {
  __$$StartingCopyWithImpl(_$Starting _value, $Res Function(_$Starting) _then)
      : super(_value, (v) => _then(v as _$Starting));

  @override
  _$Starting get _value => super._value as _$Starting;

  @override
  $Res call({
    Object? name = freezed,
    Object? color = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$Starting(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      attributes: attributes == freezed
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Starting extends Starting {
  const _$Starting(
      {this.name = 'Starting',
      @JsonKey(toJson: color2String, fromJson: string2Color)
          this.color = Colors.indigoAccent,
      final Map<String, dynamic> attributes = const {},
      final String? $type})
      : _attributes = attributes,
        $type = $type ?? 'starting',
        super._();

  factory _$Starting.fromJson(Map<String, dynamic> json) =>
      _$$StartingFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey(toJson: color2String, fromJson: string2Color)
  final Color color;
  final Map<String, dynamic> _attributes;
  @override
  @JsonKey()
  Map<String, dynamic> get attributes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_attributes);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TaskStatus.starting(name: $name, color: $color, attributes: $attributes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Starting &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(_attributes));

  @JsonKey(ignore: true)
  @override
  _$$StartingCopyWith<_$Starting> get copyWith =>
      __$$StartingCopyWithImpl<_$Starting>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        $default, {
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        complete,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        todo,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        idea,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        underReview,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        starting,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        planned,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        inProgress,
  }) {
    return starting(name, color, attributes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        inProgress,
  }) {
    return starting?.call(name, color, attributes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        inProgress,
    required TResult orElse(),
  }) {
    if (starting != null) {
      return starting(name, color, attributes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TaskStatus value) $default, {
    required TResult Function(Complete value) complete,
    required TResult Function(TODO value) todo,
    required TResult Function(IDEA value) idea,
    required TResult Function(UnderReview value) underReview,
    required TResult Function(Starting value) starting,
    required TResult Function(Planned value) planned,
    required TResult Function(InProgress value) inProgress,
  }) {
    return starting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_TaskStatus value)? $default, {
    TResult Function(Complete value)? complete,
    TResult Function(TODO value)? todo,
    TResult Function(IDEA value)? idea,
    TResult Function(UnderReview value)? underReview,
    TResult Function(Starting value)? starting,
    TResult Function(Planned value)? planned,
    TResult Function(InProgress value)? inProgress,
  }) {
    return starting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TaskStatus value)? $default, {
    TResult Function(Complete value)? complete,
    TResult Function(TODO value)? todo,
    TResult Function(IDEA value)? idea,
    TResult Function(UnderReview value)? underReview,
    TResult Function(Starting value)? starting,
    TResult Function(Planned value)? planned,
    TResult Function(InProgress value)? inProgress,
    required TResult orElse(),
  }) {
    if (starting != null) {
      return starting(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$StartingToJson(
      this,
    );
  }
}

abstract class Starting extends TaskStatus {
  const factory Starting(
      {final String name,
      @JsonKey(toJson: color2String, fromJson: string2Color) final Color color,
      final Map<String, dynamic> attributes}) = _$Starting;
  const Starting._() : super._();

  factory Starting.fromJson(Map<String, dynamic> json) = _$Starting.fromJson;

  @override
  String get name;
  @override
  @JsonKey(toJson: color2String, fromJson: string2Color)
  Color get color;
  @override
  Map<String, dynamic> get attributes;
  @override
  @JsonKey(ignore: true)
  _$$StartingCopyWith<_$Starting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlannedCopyWith<$Res> implements $TaskStatusCopyWith<$Res> {
  factory _$$PlannedCopyWith(_$Planned value, $Res Function(_$Planned) then) =
      __$$PlannedCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
      Map<String, dynamic> attributes});
}

/// @nodoc
class __$$PlannedCopyWithImpl<$Res> extends _$TaskStatusCopyWithImpl<$Res>
    implements _$$PlannedCopyWith<$Res> {
  __$$PlannedCopyWithImpl(_$Planned _value, $Res Function(_$Planned) _then)
      : super(_value, (v) => _then(v as _$Planned));

  @override
  _$Planned get _value => super._value as _$Planned;

  @override
  $Res call({
    Object? name = freezed,
    Object? color = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$Planned(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      attributes: attributes == freezed
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Planned extends Planned {
  const _$Planned(
      {this.name = 'Planned',
      @JsonKey(toJson: color2String, fromJson: string2Color)
          this.color = Colors.green,
      final Map<String, dynamic> attributes = const {},
      final String? $type})
      : _attributes = attributes,
        $type = $type ?? 'planned',
        super._();

  factory _$Planned.fromJson(Map<String, dynamic> json) =>
      _$$PlannedFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey(toJson: color2String, fromJson: string2Color)
  final Color color;
  final Map<String, dynamic> _attributes;
  @override
  @JsonKey()
  Map<String, dynamic> get attributes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_attributes);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TaskStatus.planned(name: $name, color: $color, attributes: $attributes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Planned &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(_attributes));

  @JsonKey(ignore: true)
  @override
  _$$PlannedCopyWith<_$Planned> get copyWith =>
      __$$PlannedCopyWithImpl<_$Planned>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        $default, {
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        complete,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        todo,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        idea,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        underReview,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        starting,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        planned,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        inProgress,
  }) {
    return planned(name, color, attributes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        inProgress,
  }) {
    return planned?.call(name, color, attributes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        inProgress,
    required TResult orElse(),
  }) {
    if (planned != null) {
      return planned(name, color, attributes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TaskStatus value) $default, {
    required TResult Function(Complete value) complete,
    required TResult Function(TODO value) todo,
    required TResult Function(IDEA value) idea,
    required TResult Function(UnderReview value) underReview,
    required TResult Function(Starting value) starting,
    required TResult Function(Planned value) planned,
    required TResult Function(InProgress value) inProgress,
  }) {
    return planned(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_TaskStatus value)? $default, {
    TResult Function(Complete value)? complete,
    TResult Function(TODO value)? todo,
    TResult Function(IDEA value)? idea,
    TResult Function(UnderReview value)? underReview,
    TResult Function(Starting value)? starting,
    TResult Function(Planned value)? planned,
    TResult Function(InProgress value)? inProgress,
  }) {
    return planned?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TaskStatus value)? $default, {
    TResult Function(Complete value)? complete,
    TResult Function(TODO value)? todo,
    TResult Function(IDEA value)? idea,
    TResult Function(UnderReview value)? underReview,
    TResult Function(Starting value)? starting,
    TResult Function(Planned value)? planned,
    TResult Function(InProgress value)? inProgress,
    required TResult orElse(),
  }) {
    if (planned != null) {
      return planned(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PlannedToJson(
      this,
    );
  }
}

abstract class Planned extends TaskStatus {
  const factory Planned(
      {final String name,
      @JsonKey(toJson: color2String, fromJson: string2Color) final Color color,
      final Map<String, dynamic> attributes}) = _$Planned;
  const Planned._() : super._();

  factory Planned.fromJson(Map<String, dynamic> json) = _$Planned.fromJson;

  @override
  String get name;
  @override
  @JsonKey(toJson: color2String, fromJson: string2Color)
  Color get color;
  @override
  Map<String, dynamic> get attributes;
  @override
  @JsonKey(ignore: true)
  _$$PlannedCopyWith<_$Planned> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InProgressCopyWith<$Res>
    implements $TaskStatusCopyWith<$Res> {
  factory _$$InProgressCopyWith(
          _$InProgress value, $Res Function(_$InProgress) then) =
      __$$InProgressCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
      Map<String, dynamic> attributes});
}

/// @nodoc
class __$$InProgressCopyWithImpl<$Res> extends _$TaskStatusCopyWithImpl<$Res>
    implements _$$InProgressCopyWith<$Res> {
  __$$InProgressCopyWithImpl(
      _$InProgress _value, $Res Function(_$InProgress) _then)
      : super(_value, (v) => _then(v as _$InProgress));

  @override
  _$InProgress get _value => super._value as _$InProgress;

  @override
  $Res call({
    Object? name = freezed,
    Object? color = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$InProgress(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      attributes: attributes == freezed
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InProgress extends InProgress {
  const _$InProgress(
      {this.name = 'Planned',
      @JsonKey(toJson: color2String, fromJson: string2Color)
          this.color = Colors.blue,
      final Map<String, dynamic> attributes = const {},
      final String? $type})
      : _attributes = attributes,
        $type = $type ?? 'inProgress',
        super._();

  factory _$InProgress.fromJson(Map<String, dynamic> json) =>
      _$$InProgressFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey(toJson: color2String, fromJson: string2Color)
  final Color color;
  final Map<String, dynamic> _attributes;
  @override
  @JsonKey()
  Map<String, dynamic> get attributes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_attributes);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TaskStatus.inProgress(name: $name, color: $color, attributes: $attributes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InProgress &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(_attributes));

  @JsonKey(ignore: true)
  @override
  _$$InProgressCopyWith<_$InProgress> get copyWith =>
      __$$InProgressCopyWithImpl<_$InProgress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        $default, {
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        complete,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        todo,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        idea,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        underReview,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        starting,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        planned,
    required TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)
        inProgress,
  }) {
    return inProgress(name, color, attributes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        inProgress,
  }) {
    return inProgress?.call(name, color, attributes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(
            String name,
            @JsonKey(toJson: color2String, fromJson: string2Color) Color color,
            Map<String, dynamic> attributes)?
        inProgress,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(name, color, attributes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TaskStatus value) $default, {
    required TResult Function(Complete value) complete,
    required TResult Function(TODO value) todo,
    required TResult Function(IDEA value) idea,
    required TResult Function(UnderReview value) underReview,
    required TResult Function(Starting value) starting,
    required TResult Function(Planned value) planned,
    required TResult Function(InProgress value) inProgress,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_TaskStatus value)? $default, {
    TResult Function(Complete value)? complete,
    TResult Function(TODO value)? todo,
    TResult Function(IDEA value)? idea,
    TResult Function(UnderReview value)? underReview,
    TResult Function(Starting value)? starting,
    TResult Function(Planned value)? planned,
    TResult Function(InProgress value)? inProgress,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TaskStatus value)? $default, {
    TResult Function(Complete value)? complete,
    TResult Function(TODO value)? todo,
    TResult Function(IDEA value)? idea,
    TResult Function(UnderReview value)? underReview,
    TResult Function(Starting value)? starting,
    TResult Function(Planned value)? planned,
    TResult Function(InProgress value)? inProgress,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$InProgressToJson(
      this,
    );
  }
}

abstract class InProgress extends TaskStatus {
  const factory InProgress(
      {final String name,
      @JsonKey(toJson: color2String, fromJson: string2Color) final Color color,
      final Map<String, dynamic> attributes}) = _$InProgress;
  const InProgress._() : super._();

  factory InProgress.fromJson(Map<String, dynamic> json) =
      _$InProgress.fromJson;

  @override
  String get name;
  @override
  @JsonKey(toJson: color2String, fromJson: string2Color)
  Color get color;
  @override
  Map<String, dynamic> get attributes;
  @override
  @JsonKey(ignore: true)
  _$$InProgressCopyWith<_$InProgress> get copyWith =>
      throw _privateConstructorUsedError;
}
