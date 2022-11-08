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

/// @nodoc
mixin _$TaskStatus {
  @Id()
  int get oid => throw _privateConstructorUsedError;
  @Id()
  set oid(int value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  @Property()
  int get color => throw _privateConstructorUsedError;
  @Property()
  set color(int value) => throw _privateConstructorUsedError;
  Map<String, dynamic> get attributes => throw _privateConstructorUsedError;
  set attributes(Map<String, dynamic> value) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@Id() int oid, String name, @Property() int color,
            Map<String, dynamic> attributes)
        $default, {
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        complete,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        todo,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        idea,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        underReview,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        starting,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        planned,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        inProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(@Id() int oid, String name, @Property() int color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        inProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@Id() int oid, String name, @Property() int color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(@Id() int oid, String name, int color,
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
      {@Id() int oid,
      String name,
      @Property() int color,
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
    Object? oid = freezed,
    Object? name = freezed,
    Object? color = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_value.copyWith(
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
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
      {@Id() int oid,
      String name,
      @Property() int color,
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
    Object? oid = freezed,
    Object? name = freezed,
    Object? color = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$_TaskStatus(
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      attributes: attributes == freezed
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

@Entity(realClass: TaskStatus)
class _$_TaskStatus extends _TaskStatus {
  _$_TaskStatus(
      {@Id() this.oid = 0,
      required this.name,
      @Property() required this.color,
      this.attributes = const {}})
      : super._();

  @override
  @JsonKey()
  @Id()
  int oid;
  @override
  String name;
  @override
  @Property()
  int color;
  @override
  @JsonKey()
  Map<String, dynamic> attributes;

  @override
  String toString() {
    return 'TaskStatus(oid: $oid, name: $name, color: $color, attributes: $attributes)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_TaskStatusCopyWith<_$_TaskStatus> get copyWith =>
      __$$_TaskStatusCopyWithImpl<_$_TaskStatus>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@Id() int oid, String name, @Property() int color,
            Map<String, dynamic> attributes)
        $default, {
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        complete,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        todo,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        idea,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        underReview,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        starting,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        planned,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        inProgress,
  }) {
    return $default(oid, name, color, attributes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(@Id() int oid, String name, @Property() int color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        inProgress,
  }) {
    return $default?.call(oid, name, color, attributes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@Id() int oid, String name, @Property() int color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        inProgress,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(oid, name, color, attributes);
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
}

abstract class _TaskStatus extends TaskStatus {
  factory _TaskStatus(
      {@Id() int oid,
      required String name,
      @Property() required int color,
      Map<String, dynamic> attributes}) = _$_TaskStatus;
  _TaskStatus._() : super._();

  @override
  @Id()
  int get oid;
  @Id()
  set oid(int value);
  @override
  String get name;
  set name(String value);
  @override
  @Property()
  int get color;
  @Property()
  set color(int value);
  @override
  Map<String, dynamic> get attributes;
  set attributes(Map<String, dynamic> value);
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
      {@Id() int oid, String name, int color, Map<String, dynamic> attributes});
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
    Object? oid = freezed,
    Object? name = freezed,
    Object? color = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$Complete(
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      attributes: attributes == freezed
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$Complete extends Complete {
  _$Complete(
      {@Id() this.oid = 0,
      this.name = 'Complete',
      this.color = 0xff8bc34a,
      this.attributes = const {}})
      : super._();

  @override
  @JsonKey()
  @Id()
  int oid;
  @override
  @JsonKey()
  String name;
  @override
  @JsonKey()
  int color;
  @override
  @JsonKey()
  Map<String, dynamic> attributes;

  @override
  String toString() {
    return 'TaskStatus.complete(oid: $oid, name: $name, color: $color, attributes: $attributes)';
  }

  @JsonKey(ignore: true)
  @override
  _$$CompleteCopyWith<_$Complete> get copyWith =>
      __$$CompleteCopyWithImpl<_$Complete>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@Id() int oid, String name, @Property() int color,
            Map<String, dynamic> attributes)
        $default, {
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        complete,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        todo,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        idea,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        underReview,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        starting,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        planned,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        inProgress,
  }) {
    return complete(oid, name, color, attributes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(@Id() int oid, String name, @Property() int color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        inProgress,
  }) {
    return complete?.call(oid, name, color, attributes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@Id() int oid, String name, @Property() int color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        inProgress,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(oid, name, color, attributes);
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
}

abstract class Complete extends TaskStatus {
  factory Complete(
      {@Id() int oid,
      String name,
      int color,
      Map<String, dynamic> attributes}) = _$Complete;
  Complete._() : super._();

  @override
  @Id()
  int get oid;
  @Id()
  set oid(int value);
  @override
  String get name;
  set name(String value);
  @override
  int get color;
  set color(int value);
  @override
  Map<String, dynamic> get attributes;
  set attributes(Map<String, dynamic> value);
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
      {@Id() int oid, String name, int color, Map<String, dynamic> attributes});
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
    Object? oid = freezed,
    Object? name = freezed,
    Object? color = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$TODO(
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      attributes: attributes == freezed
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$TODO extends TODO {
  _$TODO(
      {@Id() this.oid = 0,
      this.name = 'Todo',
      this.color = 0xffffca28,
      this.attributes = const {}})
      : super._();

  @override
  @JsonKey()
  @Id()
  int oid;
  @override
  @JsonKey()
  String name;
  @override
  @JsonKey()
  int color;
  @override
  @JsonKey()
  Map<String, dynamic> attributes;

  @override
  String toString() {
    return 'TaskStatus.todo(oid: $oid, name: $name, color: $color, attributes: $attributes)';
  }

  @JsonKey(ignore: true)
  @override
  _$$TODOCopyWith<_$TODO> get copyWith =>
      __$$TODOCopyWithImpl<_$TODO>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@Id() int oid, String name, @Property() int color,
            Map<String, dynamic> attributes)
        $default, {
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        complete,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        todo,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        idea,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        underReview,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        starting,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        planned,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        inProgress,
  }) {
    return todo(oid, name, color, attributes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(@Id() int oid, String name, @Property() int color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        inProgress,
  }) {
    return todo?.call(oid, name, color, attributes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@Id() int oid, String name, @Property() int color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        inProgress,
    required TResult orElse(),
  }) {
    if (todo != null) {
      return todo(oid, name, color, attributes);
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
}

abstract class TODO extends TaskStatus {
  factory TODO(
      {@Id() int oid,
      String name,
      int color,
      Map<String, dynamic> attributes}) = _$TODO;
  TODO._() : super._();

  @override
  @Id()
  int get oid;
  @Id()
  set oid(int value);
  @override
  String get name;
  set name(String value);
  @override
  int get color;
  set color(int value);
  @override
  Map<String, dynamic> get attributes;
  set attributes(Map<String, dynamic> value);
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
      {@Id() int oid, String name, int color, Map<String, dynamic> attributes});
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
    Object? oid = freezed,
    Object? name = freezed,
    Object? color = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$IDEA(
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      attributes: attributes == freezed
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$IDEA extends IDEA {
  _$IDEA(
      {@Id() this.oid = 0,
      this.name = 'Idea',
      this.color = 0xff9e9e9e,
      this.attributes = const {}})
      : super._();

  @override
  @JsonKey()
  @Id()
  int oid;
  @override
  @JsonKey()
  String name;
  @override
  @JsonKey()
  int color;
  @override
  @JsonKey()
  Map<String, dynamic> attributes;

  @override
  String toString() {
    return 'TaskStatus.idea(oid: $oid, name: $name, color: $color, attributes: $attributes)';
  }

  @JsonKey(ignore: true)
  @override
  _$$IDEACopyWith<_$IDEA> get copyWith =>
      __$$IDEACopyWithImpl<_$IDEA>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@Id() int oid, String name, @Property() int color,
            Map<String, dynamic> attributes)
        $default, {
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        complete,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        todo,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        idea,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        underReview,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        starting,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        planned,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        inProgress,
  }) {
    return idea(oid, name, color, attributes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(@Id() int oid, String name, @Property() int color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        inProgress,
  }) {
    return idea?.call(oid, name, color, attributes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@Id() int oid, String name, @Property() int color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        inProgress,
    required TResult orElse(),
  }) {
    if (idea != null) {
      return idea(oid, name, color, attributes);
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
}

abstract class IDEA extends TaskStatus {
  factory IDEA(
      {@Id() int oid,
      String name,
      int color,
      Map<String, dynamic> attributes}) = _$IDEA;
  IDEA._() : super._();

  @override
  @Id()
  int get oid;
  @Id()
  set oid(int value);
  @override
  String get name;
  set name(String value);
  @override
  int get color;
  set color(int value);
  @override
  Map<String, dynamic> get attributes;
  set attributes(Map<String, dynamic> value);
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
      {@Id() int oid, String name, int color, Map<String, dynamic> attributes});
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
    Object? oid = freezed,
    Object? name = freezed,
    Object? color = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$UnderReview(
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      attributes: attributes == freezed
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$UnderReview extends UnderReview {
  _$UnderReview(
      {@Id() this.oid = 0,
      this.name = 'Under Review',
      this.color = 0xffffb74d,
      this.attributes = const {}})
      : super._();

  @override
  @JsonKey()
  @Id()
  int oid;
  @override
  @JsonKey()
  String name;
  @override
  @JsonKey()
  int color;
  @override
  @JsonKey()
  Map<String, dynamic> attributes;

  @override
  String toString() {
    return 'TaskStatus.underReview(oid: $oid, name: $name, color: $color, attributes: $attributes)';
  }

  @JsonKey(ignore: true)
  @override
  _$$UnderReviewCopyWith<_$UnderReview> get copyWith =>
      __$$UnderReviewCopyWithImpl<_$UnderReview>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@Id() int oid, String name, @Property() int color,
            Map<String, dynamic> attributes)
        $default, {
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        complete,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        todo,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        idea,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        underReview,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        starting,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        planned,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        inProgress,
  }) {
    return underReview(oid, name, color, attributes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(@Id() int oid, String name, @Property() int color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        inProgress,
  }) {
    return underReview?.call(oid, name, color, attributes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@Id() int oid, String name, @Property() int color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        inProgress,
    required TResult orElse(),
  }) {
    if (underReview != null) {
      return underReview(oid, name, color, attributes);
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
}

abstract class UnderReview extends TaskStatus {
  factory UnderReview(
      {@Id() int oid,
      String name,
      int color,
      Map<String, dynamic> attributes}) = _$UnderReview;
  UnderReview._() : super._();

  @override
  @Id()
  int get oid;
  @Id()
  set oid(int value);
  @override
  String get name;
  set name(String value);
  @override
  int get color;
  set color(int value);
  @override
  Map<String, dynamic> get attributes;
  set attributes(Map<String, dynamic> value);
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
      {@Id() int oid, String name, int color, Map<String, dynamic> attributes});
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
    Object? oid = freezed,
    Object? name = freezed,
    Object? color = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$Starting(
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      attributes: attributes == freezed
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$Starting extends Starting {
  _$Starting(
      {@Id() this.oid = 0,
      this.name = 'Starting',
      this.color = 0xff536dfe,
      this.attributes = const {}})
      : super._();

  @override
  @JsonKey()
  @Id()
  int oid;
  @override
  @JsonKey()
  String name;
  @override
  @JsonKey()
  int color;
  @override
  @JsonKey()
  Map<String, dynamic> attributes;

  @override
  String toString() {
    return 'TaskStatus.starting(oid: $oid, name: $name, color: $color, attributes: $attributes)';
  }

  @JsonKey(ignore: true)
  @override
  _$$StartingCopyWith<_$Starting> get copyWith =>
      __$$StartingCopyWithImpl<_$Starting>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@Id() int oid, String name, @Property() int color,
            Map<String, dynamic> attributes)
        $default, {
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        complete,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        todo,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        idea,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        underReview,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        starting,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        planned,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        inProgress,
  }) {
    return starting(oid, name, color, attributes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(@Id() int oid, String name, @Property() int color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        inProgress,
  }) {
    return starting?.call(oid, name, color, attributes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@Id() int oid, String name, @Property() int color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        inProgress,
    required TResult orElse(),
  }) {
    if (starting != null) {
      return starting(oid, name, color, attributes);
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
}

abstract class Starting extends TaskStatus {
  factory Starting(
      {@Id() int oid,
      String name,
      int color,
      Map<String, dynamic> attributes}) = _$Starting;
  Starting._() : super._();

  @override
  @Id()
  int get oid;
  @Id()
  set oid(int value);
  @override
  String get name;
  set name(String value);
  @override
  int get color;
  set color(int value);
  @override
  Map<String, dynamic> get attributes;
  set attributes(Map<String, dynamic> value);
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
      {@Id() int oid, String name, int color, Map<String, dynamic> attributes});
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
    Object? oid = freezed,
    Object? name = freezed,
    Object? color = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$Planned(
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      attributes: attributes == freezed
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$Planned extends Planned {
  _$Planned(
      {@Id() this.oid = 0,
      this.name = 'Planned',
      this.color = 0xff4caf50,
      this.attributes = const {}})
      : super._();

  @override
  @JsonKey()
  @Id()
  int oid;
  @override
  @JsonKey()
  String name;
  @override
  @JsonKey()
  int color;
  @override
  @JsonKey()
  Map<String, dynamic> attributes;

  @override
  String toString() {
    return 'TaskStatus.planned(oid: $oid, name: $name, color: $color, attributes: $attributes)';
  }

  @JsonKey(ignore: true)
  @override
  _$$PlannedCopyWith<_$Planned> get copyWith =>
      __$$PlannedCopyWithImpl<_$Planned>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@Id() int oid, String name, @Property() int color,
            Map<String, dynamic> attributes)
        $default, {
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        complete,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        todo,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        idea,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        underReview,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        starting,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        planned,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        inProgress,
  }) {
    return planned(oid, name, color, attributes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(@Id() int oid, String name, @Property() int color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        inProgress,
  }) {
    return planned?.call(oid, name, color, attributes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@Id() int oid, String name, @Property() int color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        inProgress,
    required TResult orElse(),
  }) {
    if (planned != null) {
      return planned(oid, name, color, attributes);
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
}

abstract class Planned extends TaskStatus {
  factory Planned(
      {@Id() int oid,
      String name,
      int color,
      Map<String, dynamic> attributes}) = _$Planned;
  Planned._() : super._();

  @override
  @Id()
  int get oid;
  @Id()
  set oid(int value);
  @override
  String get name;
  set name(String value);
  @override
  int get color;
  set color(int value);
  @override
  Map<String, dynamic> get attributes;
  set attributes(Map<String, dynamic> value);
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
      {@Id() int oid, String name, int color, Map<String, dynamic> attributes});
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
    Object? oid = freezed,
    Object? name = freezed,
    Object? color = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$InProgress(
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      attributes: attributes == freezed
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$InProgress extends InProgress {
  _$InProgress(
      {@Id() this.oid = 0,
      this.name = 'Planned',
      this.color = 0xff2196f3,
      this.attributes = const {}})
      : super._();

  @override
  @JsonKey()
  @Id()
  int oid;
  @override
  @JsonKey()
  String name;
  @override
  @JsonKey()
  int color;
  @override
  @JsonKey()
  Map<String, dynamic> attributes;

  @override
  String toString() {
    return 'TaskStatus.inProgress(oid: $oid, name: $name, color: $color, attributes: $attributes)';
  }

  @JsonKey(ignore: true)
  @override
  _$$InProgressCopyWith<_$InProgress> get copyWith =>
      __$$InProgressCopyWithImpl<_$InProgress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@Id() int oid, String name, @Property() int color,
            Map<String, dynamic> attributes)
        $default, {
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        complete,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        todo,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        idea,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        underReview,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        starting,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        planned,
    required TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)
        inProgress,
  }) {
    return inProgress(oid, name, color, attributes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(@Id() int oid, String name, @Property() int color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        inProgress,
  }) {
    return inProgress?.call(oid, name, color, attributes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@Id() int oid, String name, @Property() int color,
            Map<String, dynamic> attributes)?
        $default, {
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        complete,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        todo,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        idea,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        underReview,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        starting,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        planned,
    TResult Function(@Id() int oid, String name, int color,
            Map<String, dynamic> attributes)?
        inProgress,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(oid, name, color, attributes);
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
}

abstract class InProgress extends TaskStatus {
  factory InProgress(
      {@Id() int oid,
      String name,
      int color,
      Map<String, dynamic> attributes}) = _$InProgress;
  InProgress._() : super._();

  @override
  @Id()
  int get oid;
  @Id()
  set oid(int value);
  @override
  String get name;
  set name(String value);
  @override
  int get color;
  set color(int value);
  @override
  Map<String, dynamic> get attributes;
  set attributes(Map<String, dynamic> value);
  @override
  @JsonKey(ignore: true)
  _$$InProgressCopyWith<_$InProgress> get copyWith =>
      throw _privateConstructorUsedError;
}
