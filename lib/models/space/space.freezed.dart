// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'space.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Space _$SpaceFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _Space.fromJson(json);
    case 'box':
      return SpaceBox.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Space',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Space {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  SpaceType get spaceType => throw _privateConstructorUsedError;
  set spaceType(SpaceType value) => throw _privateConstructorUsedError;
  SpaceSettings get settings => throw _privateConstructorUsedError;
  set settings(SpaceSettings value) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, SpaceView view,
            SpaceType spaceType, SpaceSettings settings, List<Space>? subSpaces)
        $default, {
    required TResult Function(String id, String name, SpaceSettings settings,
            SpaceViewBox view, SpaceType spaceType, String? parentId)
        box,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            String id,
            String name,
            SpaceView view,
            SpaceType spaceType,
            SpaceSettings settings,
            List<Space>? subSpaces)?
        $default, {
    TResult Function(String id, String name, SpaceSettings settings,
            SpaceViewBox view, SpaceType spaceType, String? parentId)?
        box,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String name,
            SpaceView view,
            SpaceType spaceType,
            SpaceSettings settings,
            List<Space>? subSpaces)?
        $default, {
    TResult Function(String id, String name, SpaceSettings settings,
            SpaceViewBox view, SpaceType spaceType, String? parentId)?
        box,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Space value) $default, {
    required TResult Function(SpaceBox value) box,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_Space value)? $default, {
    TResult Function(SpaceBox value)? box,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Space value)? $default, {
    TResult Function(SpaceBox value)? box,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpaceCopyWith<Space> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpaceCopyWith<$Res> {
  factory $SpaceCopyWith(Space value, $Res Function(Space) then) =
      _$SpaceCopyWithImpl<$Res>;
  $Res call(
      {String id, String name, SpaceType spaceType, SpaceSettings settings});

  $SpaceSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class _$SpaceCopyWithImpl<$Res> implements $SpaceCopyWith<$Res> {
  _$SpaceCopyWithImpl(this._value, this._then);

  final Space _value;
  // ignore: unused_field
  final $Res Function(Space) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? spaceType = freezed,
    Object? settings = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      spaceType: spaceType == freezed
          ? _value.spaceType
          : spaceType // ignore: cast_nullable_to_non_nullable
              as SpaceType,
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as SpaceSettings,
    ));
  }

  @override
  $SpaceSettingsCopyWith<$Res> get settings {
    return $SpaceSettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value));
    });
  }
}

/// @nodoc
abstract class _$$_SpaceCopyWith<$Res> implements $SpaceCopyWith<$Res> {
  factory _$$_SpaceCopyWith(_$_Space value, $Res Function(_$_Space) then) =
      __$$_SpaceCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      SpaceView view,
      SpaceType spaceType,
      SpaceSettings settings,
      List<Space>? subSpaces});

  $SpaceViewCopyWith<$Res> get view;
  @override
  $SpaceSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$$_SpaceCopyWithImpl<$Res> extends _$SpaceCopyWithImpl<$Res>
    implements _$$_SpaceCopyWith<$Res> {
  __$$_SpaceCopyWithImpl(_$_Space _value, $Res Function(_$_Space) _then)
      : super(_value, (v) => _then(v as _$_Space));

  @override
  _$_Space get _value => super._value as _$_Space;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? view = freezed,
    Object? spaceType = freezed,
    Object? settings = freezed,
    Object? subSpaces = freezed,
  }) {
    return _then(_$_Space(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      view: view == freezed
          ? _value.view
          : view // ignore: cast_nullable_to_non_nullable
              as SpaceView,
      spaceType: spaceType == freezed
          ? _value.spaceType
          : spaceType // ignore: cast_nullable_to_non_nullable
              as SpaceType,
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as SpaceSettings,
      subSpaces: subSpaces == freezed
          ? _value.subSpaces
          : subSpaces // ignore: cast_nullable_to_non_nullable
              as List<Space>?,
    ));
  }

  @override
  $SpaceViewCopyWith<$Res> get view {
    return $SpaceViewCopyWith<$Res>(_value.view, (value) {
      return _then(_value.copyWith(view: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$_Space extends _Space {
  _$_Space(
      {required this.id,
      required this.name,
      required this.view,
      required this.spaceType,
      required this.settings,
      this.subSpaces,
      final String? $type})
      : $type = $type ?? 'default',
        super._();

  factory _$_Space.fromJson(Map<String, dynamic> json) =>
      _$$_SpaceFromJson(json);

  @override
  String id;
  @override
  String name;
  @override
  SpaceView view;
  @override
  SpaceType spaceType;
  @override
  SpaceSettings settings;
  @override
  List<Space>? subSpaces;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Space(id: $id, name: $name, view: $view, spaceType: $spaceType, settings: $settings, subSpaces: $subSpaces)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_SpaceCopyWith<_$_Space> get copyWith =>
      __$$_SpaceCopyWithImpl<_$_Space>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, SpaceView view,
            SpaceType spaceType, SpaceSettings settings, List<Space>? subSpaces)
        $default, {
    required TResult Function(String id, String name, SpaceSettings settings,
            SpaceViewBox view, SpaceType spaceType, String? parentId)
        box,
  }) {
    return $default(id, name, view, spaceType, settings, subSpaces);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            String id,
            String name,
            SpaceView view,
            SpaceType spaceType,
            SpaceSettings settings,
            List<Space>? subSpaces)?
        $default, {
    TResult Function(String id, String name, SpaceSettings settings,
            SpaceViewBox view, SpaceType spaceType, String? parentId)?
        box,
  }) {
    return $default?.call(id, name, view, spaceType, settings, subSpaces);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String name,
            SpaceView view,
            SpaceType spaceType,
            SpaceSettings settings,
            List<Space>? subSpaces)?
        $default, {
    TResult Function(String id, String name, SpaceSettings settings,
            SpaceViewBox view, SpaceType spaceType, String? parentId)?
        box,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, name, view, spaceType, settings, subSpaces);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Space value) $default, {
    required TResult Function(SpaceBox value) box,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_Space value)? $default, {
    TResult Function(SpaceBox value)? box,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Space value)? $default, {
    TResult Function(SpaceBox value)? box,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_SpaceToJson(
      this,
    );
  }
}

abstract class _Space extends Space {
  factory _Space(
      {required String id,
      required String name,
      required SpaceView view,
      required SpaceType spaceType,
      required SpaceSettings settings,
      List<Space>? subSpaces}) = _$_Space;
  _Space._() : super._();

  factory _Space.fromJson(Map<String, dynamic> json) = _$_Space.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get name;
  set name(String value);
  SpaceView get view;
  set view(SpaceView value);
  @override
  SpaceType get spaceType;
  set spaceType(SpaceType value);
  @override
  SpaceSettings get settings;
  set settings(SpaceSettings value);
  List<Space>? get subSpaces;
  set subSpaces(List<Space>? value);
  @override
  @JsonKey(ignore: true)
  _$$_SpaceCopyWith<_$_Space> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SpaceBoxCopyWith<$Res> implements $SpaceCopyWith<$Res> {
  factory _$$SpaceBoxCopyWith(
          _$SpaceBox value, $Res Function(_$SpaceBox) then) =
      __$$SpaceBoxCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      SpaceSettings settings,
      SpaceViewBox view,
      SpaceType spaceType,
      String? parentId});

  @override
  $SpaceSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$$SpaceBoxCopyWithImpl<$Res> extends _$SpaceCopyWithImpl<$Res>
    implements _$$SpaceBoxCopyWith<$Res> {
  __$$SpaceBoxCopyWithImpl(_$SpaceBox _value, $Res Function(_$SpaceBox) _then)
      : super(_value, (v) => _then(v as _$SpaceBox));

  @override
  _$SpaceBox get _value => super._value as _$SpaceBox;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? settings = freezed,
    Object? view = freezed,
    Object? spaceType = freezed,
    Object? parentId = freezed,
  }) {
    return _then(_$SpaceBox(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as SpaceSettings,
      view: view == freezed
          ? _value.view
          : view // ignore: cast_nullable_to_non_nullable
              as SpaceViewBox,
      spaceType: spaceType == freezed
          ? _value.spaceType
          : spaceType // ignore: cast_nullable_to_non_nullable
              as SpaceType,
      parentId: parentId == freezed
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpaceBox extends SpaceBox {
  _$SpaceBox(
      {required this.id,
      required this.name,
      required this.settings,
      required this.view,
      this.spaceType = SpaceType.box,
      this.parentId,
      final String? $type})
      : $type = $type ?? 'box',
        super._();

  factory _$SpaceBox.fromJson(Map<String, dynamic> json) =>
      _$$SpaceBoxFromJson(json);

  @override
  String id;
  @override
  String name;
  @override
  SpaceSettings settings;
  @override
  SpaceViewBox view;
  @override
  @JsonKey()
  SpaceType spaceType;
  @override
  String? parentId;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Space.box(id: $id, name: $name, settings: $settings, view: $view, spaceType: $spaceType, parentId: $parentId)';
  }

  @JsonKey(ignore: true)
  @override
  _$$SpaceBoxCopyWith<_$SpaceBox> get copyWith =>
      __$$SpaceBoxCopyWithImpl<_$SpaceBox>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, SpaceView view,
            SpaceType spaceType, SpaceSettings settings, List<Space>? subSpaces)
        $default, {
    required TResult Function(String id, String name, SpaceSettings settings,
            SpaceViewBox view, SpaceType spaceType, String? parentId)
        box,
  }) {
    return box(id, name, settings, view, spaceType, parentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            String id,
            String name,
            SpaceView view,
            SpaceType spaceType,
            SpaceSettings settings,
            List<Space>? subSpaces)?
        $default, {
    TResult Function(String id, String name, SpaceSettings settings,
            SpaceViewBox view, SpaceType spaceType, String? parentId)?
        box,
  }) {
    return box?.call(id, name, settings, view, spaceType, parentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String name,
            SpaceView view,
            SpaceType spaceType,
            SpaceSettings settings,
            List<Space>? subSpaces)?
        $default, {
    TResult Function(String id, String name, SpaceSettings settings,
            SpaceViewBox view, SpaceType spaceType, String? parentId)?
        box,
    required TResult orElse(),
  }) {
    if (box != null) {
      return box(id, name, settings, view, spaceType, parentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Space value) $default, {
    required TResult Function(SpaceBox value) box,
  }) {
    return box(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_Space value)? $default, {
    TResult Function(SpaceBox value)? box,
  }) {
    return box?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Space value)? $default, {
    TResult Function(SpaceBox value)? box,
    required TResult orElse(),
  }) {
    if (box != null) {
      return box(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SpaceBoxToJson(
      this,
    );
  }
}

abstract class SpaceBox extends Space {
  factory SpaceBox(
      {required String id,
      required String name,
      required SpaceSettings settings,
      required SpaceViewBox view,
      SpaceType spaceType,
      String? parentId}) = _$SpaceBox;
  SpaceBox._() : super._();

  factory SpaceBox.fromJson(Map<String, dynamic> json) = _$SpaceBox.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get name;
  set name(String value);
  @override
  SpaceSettings get settings;
  set settings(SpaceSettings value);
  SpaceViewBox get view;
  set view(SpaceViewBox value);
  @override
  SpaceType get spaceType;
  set spaceType(SpaceType value);
  String? get parentId;
  set parentId(String? value);
  @override
  @JsonKey(ignore: true)
  _$$SpaceBoxCopyWith<_$SpaceBox> get copyWith =>
      throw _privateConstructorUsedError;
}

SpaceSettings _$SpaceSettingsFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _SpaceSettings.fromJson(json);
    case 'box':
      return SpaceSettingsBox.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'SpaceSettings',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$SpaceSettings {
  bool get selected => throw _privateConstructorUsedError;
  set selected(bool value) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool selected) $default, {
    required TResult Function(bool selected) box,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(bool selected)? $default, {
    TResult Function(bool selected)? box,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool selected)? $default, {
    TResult Function(bool selected)? box,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SpaceSettings value) $default, {
    required TResult Function(SpaceSettingsBox value) box,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_SpaceSettings value)? $default, {
    TResult Function(SpaceSettingsBox value)? box,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SpaceSettings value)? $default, {
    TResult Function(SpaceSettingsBox value)? box,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpaceSettingsCopyWith<SpaceSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpaceSettingsCopyWith<$Res> {
  factory $SpaceSettingsCopyWith(
          SpaceSettings value, $Res Function(SpaceSettings) then) =
      _$SpaceSettingsCopyWithImpl<$Res>;
  $Res call({bool selected});
}

/// @nodoc
class _$SpaceSettingsCopyWithImpl<$Res>
    implements $SpaceSettingsCopyWith<$Res> {
  _$SpaceSettingsCopyWithImpl(this._value, this._then);

  final SpaceSettings _value;
  // ignore: unused_field
  final $Res Function(SpaceSettings) _then;

  @override
  $Res call({
    Object? selected = freezed,
  }) {
    return _then(_value.copyWith(
      selected: selected == freezed
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_SpaceSettingsCopyWith<$Res>
    implements $SpaceSettingsCopyWith<$Res> {
  factory _$$_SpaceSettingsCopyWith(
          _$_SpaceSettings value, $Res Function(_$_SpaceSettings) then) =
      __$$_SpaceSettingsCopyWithImpl<$Res>;
  @override
  $Res call({bool selected});
}

/// @nodoc
class __$$_SpaceSettingsCopyWithImpl<$Res>
    extends _$SpaceSettingsCopyWithImpl<$Res>
    implements _$$_SpaceSettingsCopyWith<$Res> {
  __$$_SpaceSettingsCopyWithImpl(
      _$_SpaceSettings _value, $Res Function(_$_SpaceSettings) _then)
      : super(_value, (v) => _then(v as _$_SpaceSettings));

  @override
  _$_SpaceSettings get _value => super._value as _$_SpaceSettings;

  @override
  $Res call({
    Object? selected = freezed,
  }) {
    return _then(_$_SpaceSettings(
      selected: selected == freezed
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SpaceSettings extends _SpaceSettings {
  _$_SpaceSettings({this.selected = false, final String? $type})
      : $type = $type ?? 'default',
        super._();

  factory _$_SpaceSettings.fromJson(Map<String, dynamic> json) =>
      _$$_SpaceSettingsFromJson(json);

  @override
  @JsonKey()
  bool selected;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SpaceSettings(selected: $selected)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_SpaceSettingsCopyWith<_$_SpaceSettings> get copyWith =>
      __$$_SpaceSettingsCopyWithImpl<_$_SpaceSettings>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool selected) $default, {
    required TResult Function(bool selected) box,
  }) {
    return $default(selected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(bool selected)? $default, {
    TResult Function(bool selected)? box,
  }) {
    return $default?.call(selected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool selected)? $default, {
    TResult Function(bool selected)? box,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(selected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SpaceSettings value) $default, {
    required TResult Function(SpaceSettingsBox value) box,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_SpaceSettings value)? $default, {
    TResult Function(SpaceSettingsBox value)? box,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SpaceSettings value)? $default, {
    TResult Function(SpaceSettingsBox value)? box,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_SpaceSettingsToJson(
      this,
    );
  }
}

abstract class _SpaceSettings extends SpaceSettings {
  factory _SpaceSettings({bool selected}) = _$_SpaceSettings;
  _SpaceSettings._() : super._();

  factory _SpaceSettings.fromJson(Map<String, dynamic> json) =
      _$_SpaceSettings.fromJson;

  @override
  bool get selected;
  set selected(bool value);
  @override
  @JsonKey(ignore: true)
  _$$_SpaceSettingsCopyWith<_$_SpaceSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SpaceSettingsBoxCopyWith<$Res>
    implements $SpaceSettingsCopyWith<$Res> {
  factory _$$SpaceSettingsBoxCopyWith(
          _$SpaceSettingsBox value, $Res Function(_$SpaceSettingsBox) then) =
      __$$SpaceSettingsBoxCopyWithImpl<$Res>;
  @override
  $Res call({bool selected});
}

/// @nodoc
class __$$SpaceSettingsBoxCopyWithImpl<$Res>
    extends _$SpaceSettingsCopyWithImpl<$Res>
    implements _$$SpaceSettingsBoxCopyWith<$Res> {
  __$$SpaceSettingsBoxCopyWithImpl(
      _$SpaceSettingsBox _value, $Res Function(_$SpaceSettingsBox) _then)
      : super(_value, (v) => _then(v as _$SpaceSettingsBox));

  @override
  _$SpaceSettingsBox get _value => super._value as _$SpaceSettingsBox;

  @override
  $Res call({
    Object? selected = freezed,
  }) {
    return _then(_$SpaceSettingsBox(
      selected: selected == freezed
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpaceSettingsBox extends SpaceSettingsBox {
  _$SpaceSettingsBox({this.selected = false, final String? $type})
      : $type = $type ?? 'box',
        super._();

  factory _$SpaceSettingsBox.fromJson(Map<String, dynamic> json) =>
      _$$SpaceSettingsBoxFromJson(json);

  @override
  @JsonKey()
  bool selected;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SpaceSettings.box(selected: $selected)';
  }

  @JsonKey(ignore: true)
  @override
  _$$SpaceSettingsBoxCopyWith<_$SpaceSettingsBox> get copyWith =>
      __$$SpaceSettingsBoxCopyWithImpl<_$SpaceSettingsBox>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool selected) $default, {
    required TResult Function(bool selected) box,
  }) {
    return box(selected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(bool selected)? $default, {
    TResult Function(bool selected)? box,
  }) {
    return box?.call(selected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool selected)? $default, {
    TResult Function(bool selected)? box,
    required TResult orElse(),
  }) {
    if (box != null) {
      return box(selected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SpaceSettings value) $default, {
    required TResult Function(SpaceSettingsBox value) box,
  }) {
    return box(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_SpaceSettings value)? $default, {
    TResult Function(SpaceSettingsBox value)? box,
  }) {
    return box?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SpaceSettings value)? $default, {
    TResult Function(SpaceSettingsBox value)? box,
    required TResult orElse(),
  }) {
    if (box != null) {
      return box(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SpaceSettingsBoxToJson(
      this,
    );
  }
}

abstract class SpaceSettingsBox extends SpaceSettings {
  factory SpaceSettingsBox({bool selected}) = _$SpaceSettingsBox;
  SpaceSettingsBox._() : super._();

  factory SpaceSettingsBox.fromJson(Map<String, dynamic> json) =
      _$SpaceSettingsBox.fromJson;

  @override
  bool get selected;
  set selected(bool value);
  @override
  @JsonKey(ignore: true)
  _$$SpaceSettingsBoxCopyWith<_$SpaceSettingsBox> get copyWith =>
      throw _privateConstructorUsedError;
}

SpaceView _$SpaceViewFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _SpaceView.fromJson(json);
    case 'box':
      return SpaceViewBox.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'SpaceView',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$SpaceView {
  bool get onHovered => throw _privateConstructorUsedError;
  set onHovered(bool value) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool onHovered) $default, {
    required TResult Function(bool onHovered) box,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(bool onHovered)? $default, {
    TResult Function(bool onHovered)? box,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool onHovered)? $default, {
    TResult Function(bool onHovered)? box,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SpaceView value) $default, {
    required TResult Function(SpaceViewBox value) box,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_SpaceView value)? $default, {
    TResult Function(SpaceViewBox value)? box,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SpaceView value)? $default, {
    TResult Function(SpaceViewBox value)? box,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpaceViewCopyWith<SpaceView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpaceViewCopyWith<$Res> {
  factory $SpaceViewCopyWith(SpaceView value, $Res Function(SpaceView) then) =
      _$SpaceViewCopyWithImpl<$Res>;
  $Res call({bool onHovered});
}

/// @nodoc
class _$SpaceViewCopyWithImpl<$Res> implements $SpaceViewCopyWith<$Res> {
  _$SpaceViewCopyWithImpl(this._value, this._then);

  final SpaceView _value;
  // ignore: unused_field
  final $Res Function(SpaceView) _then;

  @override
  $Res call({
    Object? onHovered = freezed,
  }) {
    return _then(_value.copyWith(
      onHovered: onHovered == freezed
          ? _value.onHovered
          : onHovered // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_SpaceViewCopyWith<$Res> implements $SpaceViewCopyWith<$Res> {
  factory _$$_SpaceViewCopyWith(
          _$_SpaceView value, $Res Function(_$_SpaceView) then) =
      __$$_SpaceViewCopyWithImpl<$Res>;
  @override
  $Res call({bool onHovered});
}

/// @nodoc
class __$$_SpaceViewCopyWithImpl<$Res> extends _$SpaceViewCopyWithImpl<$Res>
    implements _$$_SpaceViewCopyWith<$Res> {
  __$$_SpaceViewCopyWithImpl(
      _$_SpaceView _value, $Res Function(_$_SpaceView) _then)
      : super(_value, (v) => _then(v as _$_SpaceView));

  @override
  _$_SpaceView get _value => super._value as _$_SpaceView;

  @override
  $Res call({
    Object? onHovered = freezed,
  }) {
    return _then(_$_SpaceView(
      onHovered: onHovered == freezed
          ? _value.onHovered
          : onHovered // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SpaceView extends _SpaceView {
  _$_SpaceView({this.onHovered = false, final String? $type})
      : $type = $type ?? 'default',
        super._();

  factory _$_SpaceView.fromJson(Map<String, dynamic> json) =>
      _$$_SpaceViewFromJson(json);

  @override
  @JsonKey()
  bool onHovered;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SpaceView(onHovered: $onHovered)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_SpaceViewCopyWith<_$_SpaceView> get copyWith =>
      __$$_SpaceViewCopyWithImpl<_$_SpaceView>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool onHovered) $default, {
    required TResult Function(bool onHovered) box,
  }) {
    return $default(onHovered);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(bool onHovered)? $default, {
    TResult Function(bool onHovered)? box,
  }) {
    return $default?.call(onHovered);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool onHovered)? $default, {
    TResult Function(bool onHovered)? box,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(onHovered);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SpaceView value) $default, {
    required TResult Function(SpaceViewBox value) box,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_SpaceView value)? $default, {
    TResult Function(SpaceViewBox value)? box,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SpaceView value)? $default, {
    TResult Function(SpaceViewBox value)? box,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_SpaceViewToJson(
      this,
    );
  }
}

abstract class _SpaceView extends SpaceView {
  factory _SpaceView({bool onHovered}) = _$_SpaceView;
  _SpaceView._() : super._();

  factory _SpaceView.fromJson(Map<String, dynamic> json) =
      _$_SpaceView.fromJson;

  @override
  bool get onHovered;
  set onHovered(bool value);
  @override
  @JsonKey(ignore: true)
  _$$_SpaceViewCopyWith<_$_SpaceView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SpaceViewBoxCopyWith<$Res>
    implements $SpaceViewCopyWith<$Res> {
  factory _$$SpaceViewBoxCopyWith(
          _$SpaceViewBox value, $Res Function(_$SpaceViewBox) then) =
      __$$SpaceViewBoxCopyWithImpl<$Res>;
  @override
  $Res call({bool onHovered});
}

/// @nodoc
class __$$SpaceViewBoxCopyWithImpl<$Res> extends _$SpaceViewCopyWithImpl<$Res>
    implements _$$SpaceViewBoxCopyWith<$Res> {
  __$$SpaceViewBoxCopyWithImpl(
      _$SpaceViewBox _value, $Res Function(_$SpaceViewBox) _then)
      : super(_value, (v) => _then(v as _$SpaceViewBox));

  @override
  _$SpaceViewBox get _value => super._value as _$SpaceViewBox;

  @override
  $Res call({
    Object? onHovered = freezed,
  }) {
    return _then(_$SpaceViewBox(
      onHovered: onHovered == freezed
          ? _value.onHovered
          : onHovered // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpaceViewBox extends SpaceViewBox {
  _$SpaceViewBox({this.onHovered = false, final String? $type})
      : $type = $type ?? 'box',
        super._();

  factory _$SpaceViewBox.fromJson(Map<String, dynamic> json) =>
      _$$SpaceViewBoxFromJson(json);

  @override
  @JsonKey()
  bool onHovered;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SpaceView.box(onHovered: $onHovered)';
  }

  @JsonKey(ignore: true)
  @override
  _$$SpaceViewBoxCopyWith<_$SpaceViewBox> get copyWith =>
      __$$SpaceViewBoxCopyWithImpl<_$SpaceViewBox>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool onHovered) $default, {
    required TResult Function(bool onHovered) box,
  }) {
    return box(onHovered);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(bool onHovered)? $default, {
    TResult Function(bool onHovered)? box,
  }) {
    return box?.call(onHovered);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool onHovered)? $default, {
    TResult Function(bool onHovered)? box,
    required TResult orElse(),
  }) {
    if (box != null) {
      return box(onHovered);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SpaceView value) $default, {
    required TResult Function(SpaceViewBox value) box,
  }) {
    return box(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_SpaceView value)? $default, {
    TResult Function(SpaceViewBox value)? box,
  }) {
    return box?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SpaceView value)? $default, {
    TResult Function(SpaceViewBox value)? box,
    required TResult orElse(),
  }) {
    if (box != null) {
      return box(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SpaceViewBoxToJson(
      this,
    );
  }
}

abstract class SpaceViewBox extends SpaceView {
  factory SpaceViewBox({bool onHovered}) = _$SpaceViewBox;
  SpaceViewBox._() : super._();

  factory SpaceViewBox.fromJson(Map<String, dynamic> json) =
      _$SpaceViewBox.fromJson;

  @override
  bool get onHovered;
  set onHovered(bool value);
  @override
  @JsonKey(ignore: true)
  _$$SpaceViewBoxCopyWith<_$SpaceViewBox> get copyWith =>
      throw _privateConstructorUsedError;
}
