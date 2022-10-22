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
    case 'boxSettings':
      return SpaceBoxSettings.fromJson(json);
    case 'view':
      return SpaceView.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Space',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Space {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, SpaceView view,
            SpaceType spaceType, List<Space>? subSpaces)
        $default, {
    required TResult Function(String id, String name, SpaceBoxSettings settings,
            SpaceView view, SpaceType spaceType, String? parentId)
        box,
    required TResult Function(bool selected) boxSettings,
    required TResult Function(bool selected, bool onHovered) view,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String id, String name, SpaceView view,
            SpaceType spaceType, List<Space>? subSpaces)?
        $default, {
    TResult Function(String id, String name, SpaceBoxSettings settings,
            SpaceView view, SpaceType spaceType, String? parentId)?
        box,
    TResult Function(bool selected)? boxSettings,
    TResult Function(bool selected, bool onHovered)? view,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, SpaceView view,
            SpaceType spaceType, List<Space>? subSpaces)?
        $default, {
    TResult Function(String id, String name, SpaceBoxSettings settings,
            SpaceView view, SpaceType spaceType, String? parentId)?
        box,
    TResult Function(bool selected)? boxSettings,
    TResult Function(bool selected, bool onHovered)? view,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Space value) $default, {
    required TResult Function(SpaceBox value) box,
    required TResult Function(SpaceBoxSettings value) boxSettings,
    required TResult Function(SpaceView value) view,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_Space value)? $default, {
    TResult Function(SpaceBox value)? box,
    TResult Function(SpaceBoxSettings value)? boxSettings,
    TResult Function(SpaceView value)? view,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Space value)? $default, {
    TResult Function(SpaceBox value)? box,
    TResult Function(SpaceBoxSettings value)? boxSettings,
    TResult Function(SpaceView value)? view,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpaceCopyWith<$Res> {
  factory $SpaceCopyWith(Space value, $Res Function(Space) then) =
      _$SpaceCopyWithImpl<$Res>;
}

/// @nodoc
class _$SpaceCopyWithImpl<$Res> implements $SpaceCopyWith<$Res> {
  _$SpaceCopyWithImpl(this._value, this._then);

  final Space _value;
  // ignore: unused_field
  final $Res Function(Space) _then;
}

/// @nodoc
abstract class _$$_SpaceCopyWith<$Res> {
  factory _$$_SpaceCopyWith(_$_Space value, $Res Function(_$_Space) then) =
      __$$_SpaceCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      SpaceView view,
      SpaceType spaceType,
      List<Space>? subSpaces});
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
      subSpaces: subSpaces == freezed
          ? _value.subSpaces
          : subSpaces // ignore: cast_nullable_to_non_nullable
              as List<Space>?,
    ));
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
  List<Space>? subSpaces;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Space(id: $id, name: $name, view: $view, spaceType: $spaceType, subSpaces: $subSpaces)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_SpaceCopyWith<_$_Space> get copyWith =>
      __$$_SpaceCopyWithImpl<_$_Space>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, SpaceView view,
            SpaceType spaceType, List<Space>? subSpaces)
        $default, {
    required TResult Function(String id, String name, SpaceBoxSettings settings,
            SpaceView view, SpaceType spaceType, String? parentId)
        box,
    required TResult Function(bool selected) boxSettings,
    required TResult Function(bool selected, bool onHovered) view,
  }) {
    return $default(id, name, this.view, spaceType, subSpaces);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String id, String name, SpaceView view,
            SpaceType spaceType, List<Space>? subSpaces)?
        $default, {
    TResult Function(String id, String name, SpaceBoxSettings settings,
            SpaceView view, SpaceType spaceType, String? parentId)?
        box,
    TResult Function(bool selected)? boxSettings,
    TResult Function(bool selected, bool onHovered)? view,
  }) {
    return $default?.call(id, name, this.view, spaceType, subSpaces);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, SpaceView view,
            SpaceType spaceType, List<Space>? subSpaces)?
        $default, {
    TResult Function(String id, String name, SpaceBoxSettings settings,
            SpaceView view, SpaceType spaceType, String? parentId)?
        box,
    TResult Function(bool selected)? boxSettings,
    TResult Function(bool selected, bool onHovered)? view,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, name, this.view, spaceType, subSpaces);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Space value) $default, {
    required TResult Function(SpaceBox value) box,
    required TResult Function(SpaceBoxSettings value) boxSettings,
    required TResult Function(SpaceView value) view,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_Space value)? $default, {
    TResult Function(SpaceBox value)? box,
    TResult Function(SpaceBoxSettings value)? boxSettings,
    TResult Function(SpaceView value)? view,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Space value)? $default, {
    TResult Function(SpaceBox value)? box,
    TResult Function(SpaceBoxSettings value)? boxSettings,
    TResult Function(SpaceView value)? view,
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
      List<Space>? subSpaces}) = _$_Space;
  _Space._() : super._();

  factory _Space.fromJson(Map<String, dynamic> json) = _$_Space.fromJson;

  String get id;
  set id(String value);
  String get name;
  set name(String value);
  SpaceView get view;
  set view(SpaceView value);
  SpaceType get spaceType;
  set spaceType(SpaceType value);
  List<Space>? get subSpaces;
  set subSpaces(List<Space>? value);
  @JsonKey(ignore: true)
  _$$_SpaceCopyWith<_$_Space> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SpaceBoxCopyWith<$Res> {
  factory _$$SpaceBoxCopyWith(
          _$SpaceBox value, $Res Function(_$SpaceBox) then) =
      __$$SpaceBoxCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      SpaceBoxSettings settings,
      SpaceView view,
      SpaceType spaceType,
      String? parentId});
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
              as SpaceBoxSettings,
      view: view == freezed
          ? _value.view
          : view // ignore: cast_nullable_to_non_nullable
              as SpaceView,
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
  SpaceBoxSettings settings;
  @override
  SpaceView view;
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
            SpaceType spaceType, List<Space>? subSpaces)
        $default, {
    required TResult Function(String id, String name, SpaceBoxSettings settings,
            SpaceView view, SpaceType spaceType, String? parentId)
        box,
    required TResult Function(bool selected) boxSettings,
    required TResult Function(bool selected, bool onHovered) view,
  }) {
    return box(id, name, settings, this.view, spaceType, parentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String id, String name, SpaceView view,
            SpaceType spaceType, List<Space>? subSpaces)?
        $default, {
    TResult Function(String id, String name, SpaceBoxSettings settings,
            SpaceView view, SpaceType spaceType, String? parentId)?
        box,
    TResult Function(bool selected)? boxSettings,
    TResult Function(bool selected, bool onHovered)? view,
  }) {
    return box?.call(id, name, settings, this.view, spaceType, parentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, SpaceView view,
            SpaceType spaceType, List<Space>? subSpaces)?
        $default, {
    TResult Function(String id, String name, SpaceBoxSettings settings,
            SpaceView view, SpaceType spaceType, String? parentId)?
        box,
    TResult Function(bool selected)? boxSettings,
    TResult Function(bool selected, bool onHovered)? view,
    required TResult orElse(),
  }) {
    if (box != null) {
      return box(id, name, settings, this.view, spaceType, parentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Space value) $default, {
    required TResult Function(SpaceBox value) box,
    required TResult Function(SpaceBoxSettings value) boxSettings,
    required TResult Function(SpaceView value) view,
  }) {
    return box(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_Space value)? $default, {
    TResult Function(SpaceBox value)? box,
    TResult Function(SpaceBoxSettings value)? boxSettings,
    TResult Function(SpaceView value)? view,
  }) {
    return box?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Space value)? $default, {
    TResult Function(SpaceBox value)? box,
    TResult Function(SpaceBoxSettings value)? boxSettings,
    TResult Function(SpaceView value)? view,
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
      required SpaceBoxSettings settings,
      required SpaceView view,
      SpaceType spaceType,
      String? parentId}) = _$SpaceBox;
  SpaceBox._() : super._();

  factory SpaceBox.fromJson(Map<String, dynamic> json) = _$SpaceBox.fromJson;

  String get id;
  set id(String value);
  String get name;
  set name(String value);
  SpaceBoxSettings get settings;
  set settings(SpaceBoxSettings value);
  SpaceView get view;
  set view(SpaceView value);
  SpaceType get spaceType;
  set spaceType(SpaceType value);
  String? get parentId;
  set parentId(String? value);
  @JsonKey(ignore: true)
  _$$SpaceBoxCopyWith<_$SpaceBox> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SpaceBoxSettingsCopyWith<$Res> {
  factory _$$SpaceBoxSettingsCopyWith(
          _$SpaceBoxSettings value, $Res Function(_$SpaceBoxSettings) then) =
      __$$SpaceBoxSettingsCopyWithImpl<$Res>;
  $Res call({bool selected});
}

/// @nodoc
class __$$SpaceBoxSettingsCopyWithImpl<$Res> extends _$SpaceCopyWithImpl<$Res>
    implements _$$SpaceBoxSettingsCopyWith<$Res> {
  __$$SpaceBoxSettingsCopyWithImpl(
      _$SpaceBoxSettings _value, $Res Function(_$SpaceBoxSettings) _then)
      : super(_value, (v) => _then(v as _$SpaceBoxSettings));

  @override
  _$SpaceBoxSettings get _value => super._value as _$SpaceBoxSettings;

  @override
  $Res call({
    Object? selected = freezed,
  }) {
    return _then(_$SpaceBoxSettings(
      selected: selected == freezed
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpaceBoxSettings extends SpaceBoxSettings {
  _$SpaceBoxSettings({this.selected = false, final String? $type})
      : $type = $type ?? 'boxSettings',
        super._();

  factory _$SpaceBoxSettings.fromJson(Map<String, dynamic> json) =>
      _$$SpaceBoxSettingsFromJson(json);

  @override
  @JsonKey()
  bool selected;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Space.boxSettings(selected: $selected)';
  }

  @JsonKey(ignore: true)
  @override
  _$$SpaceBoxSettingsCopyWith<_$SpaceBoxSettings> get copyWith =>
      __$$SpaceBoxSettingsCopyWithImpl<_$SpaceBoxSettings>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, SpaceView view,
            SpaceType spaceType, List<Space>? subSpaces)
        $default, {
    required TResult Function(String id, String name, SpaceBoxSettings settings,
            SpaceView view, SpaceType spaceType, String? parentId)
        box,
    required TResult Function(bool selected) boxSettings,
    required TResult Function(bool selected, bool onHovered) view,
  }) {
    return boxSettings(selected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String id, String name, SpaceView view,
            SpaceType spaceType, List<Space>? subSpaces)?
        $default, {
    TResult Function(String id, String name, SpaceBoxSettings settings,
            SpaceView view, SpaceType spaceType, String? parentId)?
        box,
    TResult Function(bool selected)? boxSettings,
    TResult Function(bool selected, bool onHovered)? view,
  }) {
    return boxSettings?.call(selected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, SpaceView view,
            SpaceType spaceType, List<Space>? subSpaces)?
        $default, {
    TResult Function(String id, String name, SpaceBoxSettings settings,
            SpaceView view, SpaceType spaceType, String? parentId)?
        box,
    TResult Function(bool selected)? boxSettings,
    TResult Function(bool selected, bool onHovered)? view,
    required TResult orElse(),
  }) {
    if (boxSettings != null) {
      return boxSettings(selected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Space value) $default, {
    required TResult Function(SpaceBox value) box,
    required TResult Function(SpaceBoxSettings value) boxSettings,
    required TResult Function(SpaceView value) view,
  }) {
    return boxSettings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_Space value)? $default, {
    TResult Function(SpaceBox value)? box,
    TResult Function(SpaceBoxSettings value)? boxSettings,
    TResult Function(SpaceView value)? view,
  }) {
    return boxSettings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Space value)? $default, {
    TResult Function(SpaceBox value)? box,
    TResult Function(SpaceBoxSettings value)? boxSettings,
    TResult Function(SpaceView value)? view,
    required TResult orElse(),
  }) {
    if (boxSettings != null) {
      return boxSettings(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SpaceBoxSettingsToJson(
      this,
    );
  }
}

abstract class SpaceBoxSettings extends Space {
  factory SpaceBoxSettings({bool selected}) = _$SpaceBoxSettings;
  SpaceBoxSettings._() : super._();

  factory SpaceBoxSettings.fromJson(Map<String, dynamic> json) =
      _$SpaceBoxSettings.fromJson;

  bool get selected;
  set selected(bool value);
  @JsonKey(ignore: true)
  _$$SpaceBoxSettingsCopyWith<_$SpaceBoxSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SpaceViewCopyWith<$Res> {
  factory _$$SpaceViewCopyWith(
          _$SpaceView value, $Res Function(_$SpaceView) then) =
      __$$SpaceViewCopyWithImpl<$Res>;
  $Res call({bool selected, bool onHovered});
}

/// @nodoc
class __$$SpaceViewCopyWithImpl<$Res> extends _$SpaceCopyWithImpl<$Res>
    implements _$$SpaceViewCopyWith<$Res> {
  __$$SpaceViewCopyWithImpl(
      _$SpaceView _value, $Res Function(_$SpaceView) _then)
      : super(_value, (v) => _then(v as _$SpaceView));

  @override
  _$SpaceView get _value => super._value as _$SpaceView;

  @override
  $Res call({
    Object? selected = freezed,
    Object? onHovered = freezed,
  }) {
    return _then(_$SpaceView(
      selected: selected == freezed
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
      onHovered: onHovered == freezed
          ? _value.onHovered
          : onHovered // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpaceView extends SpaceView {
  _$SpaceView(
      {this.selected = false, this.onHovered = false, final String? $type})
      : $type = $type ?? 'view',
        super._();

  factory _$SpaceView.fromJson(Map<String, dynamic> json) =>
      _$$SpaceViewFromJson(json);

  @override
  @JsonKey()
  bool selected;
  @override
  @JsonKey()
  bool onHovered;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Space.view(selected: $selected, onHovered: $onHovered)';
  }

  @JsonKey(ignore: true)
  @override
  _$$SpaceViewCopyWith<_$SpaceView> get copyWith =>
      __$$SpaceViewCopyWithImpl<_$SpaceView>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, SpaceView view,
            SpaceType spaceType, List<Space>? subSpaces)
        $default, {
    required TResult Function(String id, String name, SpaceBoxSettings settings,
            SpaceView view, SpaceType spaceType, String? parentId)
        box,
    required TResult Function(bool selected) boxSettings,
    required TResult Function(bool selected, bool onHovered) view,
  }) {
    return view(selected, onHovered);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String id, String name, SpaceView view,
            SpaceType spaceType, List<Space>? subSpaces)?
        $default, {
    TResult Function(String id, String name, SpaceBoxSettings settings,
            SpaceView view, SpaceType spaceType, String? parentId)?
        box,
    TResult Function(bool selected)? boxSettings,
    TResult Function(bool selected, bool onHovered)? view,
  }) {
    return view?.call(selected, onHovered);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, SpaceView view,
            SpaceType spaceType, List<Space>? subSpaces)?
        $default, {
    TResult Function(String id, String name, SpaceBoxSettings settings,
            SpaceView view, SpaceType spaceType, String? parentId)?
        box,
    TResult Function(bool selected)? boxSettings,
    TResult Function(bool selected, bool onHovered)? view,
    required TResult orElse(),
  }) {
    if (view != null) {
      return view(selected, onHovered);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Space value) $default, {
    required TResult Function(SpaceBox value) box,
    required TResult Function(SpaceBoxSettings value) boxSettings,
    required TResult Function(SpaceView value) view,
  }) {
    return view(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_Space value)? $default, {
    TResult Function(SpaceBox value)? box,
    TResult Function(SpaceBoxSettings value)? boxSettings,
    TResult Function(SpaceView value)? view,
  }) {
    return view?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Space value)? $default, {
    TResult Function(SpaceBox value)? box,
    TResult Function(SpaceBoxSettings value)? boxSettings,
    TResult Function(SpaceView value)? view,
    required TResult orElse(),
  }) {
    if (view != null) {
      return view(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SpaceViewToJson(
      this,
    );
  }
}

abstract class SpaceView extends Space {
  factory SpaceView({bool selected, bool onHovered}) = _$SpaceView;
  SpaceView._() : super._();

  factory SpaceView.fromJson(Map<String, dynamic> json) = _$SpaceView.fromJson;

  bool get selected;
  set selected(bool value);
  bool get onHovered;
  set onHovered(bool value);
  @JsonKey(ignore: true)
  _$$SpaceViewCopyWith<_$SpaceView> get copyWith =>
      throw _privateConstructorUsedError;
}
