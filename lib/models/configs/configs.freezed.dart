// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'configs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppConfigs {
  @Id()
  int get oid => throw _privateConstructorUsedError;
  @Id()
  set oid(int value) => throw _privateConstructorUsedError;
  bool get initialized => throw _privateConstructorUsedError;
  set initialized(bool value) => throw _privateConstructorUsedError;
  bool get showSplash => throw _privateConstructorUsedError;
  set showSplash(bool value) => throw _privateConstructorUsedError;
  ToOne<User> get me => throw _privateConstructorUsedError;
  set me(ToOne<User> value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppConfigsCopyWith<AppConfigs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppConfigsCopyWith<$Res> {
  factory $AppConfigsCopyWith(
          AppConfigs value, $Res Function(AppConfigs) then) =
      _$AppConfigsCopyWithImpl<$Res>;
  $Res call({@Id() int oid, bool initialized, bool showSplash, ToOne<User> me});
}

/// @nodoc
class _$AppConfigsCopyWithImpl<$Res> implements $AppConfigsCopyWith<$Res> {
  _$AppConfigsCopyWithImpl(this._value, this._then);

  final AppConfigs _value;
  // ignore: unused_field
  final $Res Function(AppConfigs) _then;

  @override
  $Res call({
    Object? oid = freezed,
    Object? initialized = freezed,
    Object? showSplash = freezed,
    Object? me = freezed,
  }) {
    return _then(_value.copyWith(
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as int,
      initialized: initialized == freezed
          ? _value.initialized
          : initialized // ignore: cast_nullable_to_non_nullable
              as bool,
      showSplash: showSplash == freezed
          ? _value.showSplash
          : showSplash // ignore: cast_nullable_to_non_nullable
              as bool,
      me: me == freezed
          ? _value.me
          : me // ignore: cast_nullable_to_non_nullable
              as ToOne<User>,
    ));
  }
}

/// @nodoc
abstract class _$$_AppConfigsCopyWith<$Res>
    implements $AppConfigsCopyWith<$Res> {
  factory _$$_AppConfigsCopyWith(
          _$_AppConfigs value, $Res Function(_$_AppConfigs) then) =
      __$$_AppConfigsCopyWithImpl<$Res>;
  @override
  $Res call({@Id() int oid, bool initialized, bool showSplash, ToOne<User> me});
}

/// @nodoc
class __$$_AppConfigsCopyWithImpl<$Res> extends _$AppConfigsCopyWithImpl<$Res>
    implements _$$_AppConfigsCopyWith<$Res> {
  __$$_AppConfigsCopyWithImpl(
      _$_AppConfigs _value, $Res Function(_$_AppConfigs) _then)
      : super(_value, (v) => _then(v as _$_AppConfigs));

  @override
  _$_AppConfigs get _value => super._value as _$_AppConfigs;

  @override
  $Res call({
    Object? oid = freezed,
    Object? initialized = freezed,
    Object? showSplash = freezed,
    Object? me = freezed,
  }) {
    return _then(_$_AppConfigs(
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as int,
      initialized: initialized == freezed
          ? _value.initialized
          : initialized // ignore: cast_nullable_to_non_nullable
              as bool,
      showSplash: showSplash == freezed
          ? _value.showSplash
          : showSplash // ignore: cast_nullable_to_non_nullable
              as bool,
      me: me == freezed
          ? _value.me
          : me // ignore: cast_nullable_to_non_nullable
              as ToOne<User>,
    ));
  }
}

/// @nodoc

@Entity(realClass: AppConfigs)
class _$_AppConfigs extends _AppConfigs {
  _$_AppConfigs(
      {@Id() this.oid = 0,
      this.initialized = false,
      this.showSplash = false,
      required this.me})
      : super._();

  @override
  @JsonKey()
  @Id()
  int oid;
  @override
  @JsonKey()
  bool initialized;
  @override
  @JsonKey()
  bool showSplash;
  @override
  ToOne<User> me;

  @override
  String toString() {
    return 'AppConfigs(oid: $oid, initialized: $initialized, showSplash: $showSplash, me: $me)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_AppConfigsCopyWith<_$_AppConfigs> get copyWith =>
      __$$_AppConfigsCopyWithImpl<_$_AppConfigs>(this, _$identity);
}

abstract class _AppConfigs extends AppConfigs {
  factory _AppConfigs(
      {@Id() int oid,
      bool initialized,
      bool showSplash,
      required ToOne<User> me}) = _$_AppConfigs;
  _AppConfigs._() : super._();

  @override
  @Id()
  int get oid;
  @Id()
  set oid(int value);
  @override
  bool get initialized;
  set initialized(bool value);
  @override
  bool get showSplash;
  set showSplash(bool value);
  @override
  ToOne<User> get me;
  set me(ToOne<User> value);
  @override
  @JsonKey(ignore: true)
  _$$_AppConfigsCopyWith<_$_AppConfigs> get copyWith =>
      throw _privateConstructorUsedError;
}
