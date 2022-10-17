// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_configs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppConfigs _$AppConfigsFromJson(Map<String, dynamic> json) {
  return _AppConfigs.fromJson(json);
}

/// @nodoc
mixin _$AppConfigs {
  bool get splashShowed => throw _privateConstructorUsedError;
  bool get initialized => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: (String value) => {Locale.fromSubtags()},
      toJson: (Locale value) => value.toLanguageTag())
  Locale get locale => throw _privateConstructorUsedError;
  User? get me => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppConfigsCopyWith<AppConfigs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppConfigsCopyWith<$Res> {
  factory $AppConfigsCopyWith(
          AppConfigs value, $Res Function(AppConfigs) then) =
      _$AppConfigsCopyWithImpl<$Res>;
  $Res call(
      {bool splashShowed,
      bool initialized,
      @JsonKey(fromJson: (String value) => {Locale.fromSubtags()}, toJson: (Locale value) => value.toLanguageTag())
          Locale locale,
      User? me});

  $UserCopyWith<$Res>? get me;
}

/// @nodoc
class _$AppConfigsCopyWithImpl<$Res> implements $AppConfigsCopyWith<$Res> {
  _$AppConfigsCopyWithImpl(this._value, this._then);

  final AppConfigs _value;
  // ignore: unused_field
  final $Res Function(AppConfigs) _then;

  @override
  $Res call({
    Object? splashShowed = freezed,
    Object? initialized = freezed,
    Object? locale = freezed,
    Object? me = freezed,
  }) {
    return _then(_value.copyWith(
      splashShowed: splashShowed == freezed
          ? _value.splashShowed
          : splashShowed // ignore: cast_nullable_to_non_nullable
              as bool,
      initialized: initialized == freezed
          ? _value.initialized
          : initialized // ignore: cast_nullable_to_non_nullable
              as bool,
      locale: locale == freezed
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
      me: me == freezed
          ? _value.me
          : me // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get me {
    if (_value.me == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.me!, (value) {
      return _then(_value.copyWith(me: value));
    });
  }
}

/// @nodoc
abstract class _$$_AppConfigsCopyWith<$Res>
    implements $AppConfigsCopyWith<$Res> {
  factory _$$_AppConfigsCopyWith(
          _$_AppConfigs value, $Res Function(_$_AppConfigs) then) =
      __$$_AppConfigsCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool splashShowed,
      bool initialized,
      @JsonKey(fromJson: (String value) => {Locale.fromSubtags()}, toJson: (Locale value) => value.toLanguageTag())
          Locale locale,
      User? me});

  @override
  $UserCopyWith<$Res>? get me;
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
    Object? splashShowed = freezed,
    Object? initialized = freezed,
    Object? locale = freezed,
    Object? me = freezed,
  }) {
    return _then(_$_AppConfigs(
      splashShowed: splashShowed == freezed
          ? _value.splashShowed
          : splashShowed // ignore: cast_nullable_to_non_nullable
              as bool,
      initialized: initialized == freezed
          ? _value.initialized
          : initialized // ignore: cast_nullable_to_non_nullable
              as bool,
      locale: locale == freezed
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
      me: me == freezed
          ? _value.me
          : me // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppConfigs extends _AppConfigs {
  const _$_AppConfigs(
      {this.splashShowed = false,
      this.initialized = false,
      @JsonKey(fromJson: (String value) => {Locale.fromSubtags()}, toJson: (Locale value) => value.toLanguageTag())
          this.locale = const Locale('en', 'EN'),
      this.me})
      : super._();

  factory _$_AppConfigs.fromJson(Map<String, dynamic> json) =>
      _$$_AppConfigsFromJson(json);

  @override
  @JsonKey()
  final bool splashShowed;
  @override
  @JsonKey()
  final bool initialized;
  @override
  @JsonKey(
      fromJson: (String value) => {Locale.fromSubtags()},
      toJson: (Locale value) => value.toLanguageTag())
  final Locale locale;
  @override
  final User? me;

  @override
  String toString() {
    return 'AppConfigs(splashShowed: $splashShowed, initialized: $initialized, locale: $locale, me: $me)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppConfigs &&
            const DeepCollectionEquality()
                .equals(other.splashShowed, splashShowed) &&
            const DeepCollectionEquality()
                .equals(other.initialized, initialized) &&
            const DeepCollectionEquality().equals(other.locale, locale) &&
            const DeepCollectionEquality().equals(other.me, me));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(splashShowed),
      const DeepCollectionEquality().hash(initialized),
      const DeepCollectionEquality().hash(locale),
      const DeepCollectionEquality().hash(me));

  @JsonKey(ignore: true)
  @override
  _$$_AppConfigsCopyWith<_$_AppConfigs> get copyWith =>
      __$$_AppConfigsCopyWithImpl<_$_AppConfigs>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppConfigsToJson(
      this,
    );
  }
}

abstract class _AppConfigs extends AppConfigs {
  const factory _AppConfigs(
      {final bool splashShowed,
      final bool initialized,
      @JsonKey(fromJson: (String value) => {Locale.fromSubtags()}, toJson: (Locale value) => value.toLanguageTag())
          final Locale locale,
      final User? me}) = _$_AppConfigs;
  const _AppConfigs._() : super._();

  factory _AppConfigs.fromJson(Map<String, dynamic> json) =
      _$_AppConfigs.fromJson;

  @override
  bool get splashShowed;
  @override
  bool get initialized;
  @override
  @JsonKey(
      fromJson: (String value) => {Locale.fromSubtags()},
      toJson: (Locale value) => value.toLanguageTag())
  Locale get locale;
  @override
  User? get me;
  @override
  @JsonKey(ignore: true)
  _$$_AppConfigsCopyWith<_$_AppConfigs> get copyWith =>
      throw _privateConstructorUsedError;
}
