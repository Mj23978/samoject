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
    case 'settings':
      return SpaceSettings.fromJson(json);
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
  String get name => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, List<Space>? subSpaces) $default, {
    required TResult Function(
            String id, String name, bool onHovered, bool selected)
        settings,
    required TResult Function(String id, String name, int? parentId) box,
    required TResult Function(
            String id, String name, bool onHovered, bool selected)
        boxSettings,
    required TResult Function(String name, bool onHovered, bool selected) view,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String id, String name, List<Space>? subSpaces)?
        $default, {
    TResult Function(String id, String name, bool onHovered, bool selected)?
        settings,
    TResult Function(String id, String name, int? parentId)? box,
    TResult Function(String id, String name, bool onHovered, bool selected)?
        boxSettings,
    TResult Function(String name, bool onHovered, bool selected)? view,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, List<Space>? subSpaces)?
        $default, {
    TResult Function(String id, String name, bool onHovered, bool selected)?
        settings,
    TResult Function(String id, String name, int? parentId)? box,
    TResult Function(String id, String name, bool onHovered, bool selected)?
        boxSettings,
    TResult Function(String name, bool onHovered, bool selected)? view,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Space value) $default, {
    required TResult Function(SpaceSettings value) settings,
    required TResult Function(SpaceBox value) box,
    required TResult Function(SpaceBoxSettings value) boxSettings,
    required TResult Function(SpaceView value) view,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_Space value)? $default, {
    TResult Function(SpaceSettings value)? settings,
    TResult Function(SpaceBox value)? box,
    TResult Function(SpaceBoxSettings value)? boxSettings,
    TResult Function(SpaceView value)? view,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Space value)? $default, {
    TResult Function(SpaceSettings value)? settings,
    TResult Function(SpaceBox value)? box,
    TResult Function(SpaceBoxSettings value)? boxSettings,
    TResult Function(SpaceView value)? view,
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
  $Res call({String name});
}

/// @nodoc
class _$SpaceCopyWithImpl<$Res> implements $SpaceCopyWith<$Res> {
  _$SpaceCopyWithImpl(this._value, this._then);

  final Space _value;
  // ignore: unused_field
  final $Res Function(Space) _then;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_SpaceCopyWith<$Res> implements $SpaceCopyWith<$Res> {
  factory _$$_SpaceCopyWith(_$_Space value, $Res Function(_$_Space) then) =
      __$$_SpaceCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, List<Space>? subSpaces});
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
      subSpaces: subSpaces == freezed
          ? _value._subSpaces
          : subSpaces // ignore: cast_nullable_to_non_nullable
              as List<Space>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Space extends _Space {
  const _$_Space(
      {required this.id,
      required this.name,
      final List<Space>? subSpaces,
      final String? $type})
      : _subSpaces = subSpaces,
        $type = $type ?? 'default',
        super._();

  factory _$_Space.fromJson(Map<String, dynamic> json) =>
      _$$_SpaceFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final List<Space>? _subSpaces;
  @override
  List<Space>? get subSpaces {
    final value = _subSpaces;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Space(id: $id, name: $name, subSpaces: $subSpaces)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Space &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other._subSpaces, _subSpaces));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(_subSpaces));

  @JsonKey(ignore: true)
  @override
  _$$_SpaceCopyWith<_$_Space> get copyWith =>
      __$$_SpaceCopyWithImpl<_$_Space>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, List<Space>? subSpaces) $default, {
    required TResult Function(
            String id, String name, bool onHovered, bool selected)
        settings,
    required TResult Function(String id, String name, int? parentId) box,
    required TResult Function(
            String id, String name, bool onHovered, bool selected)
        boxSettings,
    required TResult Function(String name, bool onHovered, bool selected) view,
  }) {
    return $default(id, name, subSpaces);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String id, String name, List<Space>? subSpaces)?
        $default, {
    TResult Function(String id, String name, bool onHovered, bool selected)?
        settings,
    TResult Function(String id, String name, int? parentId)? box,
    TResult Function(String id, String name, bool onHovered, bool selected)?
        boxSettings,
    TResult Function(String name, bool onHovered, bool selected)? view,
  }) {
    return $default?.call(id, name, subSpaces);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, List<Space>? subSpaces)?
        $default, {
    TResult Function(String id, String name, bool onHovered, bool selected)?
        settings,
    TResult Function(String id, String name, int? parentId)? box,
    TResult Function(String id, String name, bool onHovered, bool selected)?
        boxSettings,
    TResult Function(String name, bool onHovered, bool selected)? view,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, name, subSpaces);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Space value) $default, {
    required TResult Function(SpaceSettings value) settings,
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
    TResult Function(SpaceSettings value)? settings,
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
    TResult Function(SpaceSettings value)? settings,
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
  const factory _Space(
      {required final String id,
      required final String name,
      final List<Space>? subSpaces}) = _$_Space;
  const _Space._() : super._();

  factory _Space.fromJson(Map<String, dynamic> json) = _$_Space.fromJson;

  String get id;
  @override
  String get name;
  List<Space>? get subSpaces;
  @override
  @JsonKey(ignore: true)
  _$$_SpaceCopyWith<_$_Space> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SpaceSettingsCopyWith<$Res> implements $SpaceCopyWith<$Res> {
  factory _$$SpaceSettingsCopyWith(
          _$SpaceSettings value, $Res Function(_$SpaceSettings) then) =
      __$$SpaceSettingsCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, bool onHovered, bool selected});
}

/// @nodoc
class __$$SpaceSettingsCopyWithImpl<$Res> extends _$SpaceCopyWithImpl<$Res>
    implements _$$SpaceSettingsCopyWith<$Res> {
  __$$SpaceSettingsCopyWithImpl(
      _$SpaceSettings _value, $Res Function(_$SpaceSettings) _then)
      : super(_value, (v) => _then(v as _$SpaceSettings));

  @override
  _$SpaceSettings get _value => super._value as _$SpaceSettings;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? onHovered = freezed,
    Object? selected = freezed,
  }) {
    return _then(_$SpaceSettings(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      onHovered: onHovered == freezed
          ? _value.onHovered
          : onHovered // ignore: cast_nullable_to_non_nullable
              as bool,
      selected: selected == freezed
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpaceSettings extends SpaceSettings {
  const _$SpaceSettings(
      {required this.id,
      required this.name,
      this.onHovered = false,
      this.selected = false,
      final String? $type})
      : $type = $type ?? 'settings',
        super._();

  factory _$SpaceSettings.fromJson(Map<String, dynamic> json) =>
      _$$SpaceSettingsFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey()
  final bool onHovered;
  @override
  @JsonKey()
  final bool selected;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Space.settings(id: $id, name: $name, onHovered: $onHovered, selected: $selected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpaceSettings &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.onHovered, onHovered) &&
            const DeepCollectionEquality().equals(other.selected, selected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(onHovered),
      const DeepCollectionEquality().hash(selected));

  @JsonKey(ignore: true)
  @override
  _$$SpaceSettingsCopyWith<_$SpaceSettings> get copyWith =>
      __$$SpaceSettingsCopyWithImpl<_$SpaceSettings>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, List<Space>? subSpaces) $default, {
    required TResult Function(
            String id, String name, bool onHovered, bool selected)
        settings,
    required TResult Function(String id, String name, int? parentId) box,
    required TResult Function(
            String id, String name, bool onHovered, bool selected)
        boxSettings,
    required TResult Function(String name, bool onHovered, bool selected) view,
  }) {
    return settings(id, name, onHovered, selected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String id, String name, List<Space>? subSpaces)?
        $default, {
    TResult Function(String id, String name, bool onHovered, bool selected)?
        settings,
    TResult Function(String id, String name, int? parentId)? box,
    TResult Function(String id, String name, bool onHovered, bool selected)?
        boxSettings,
    TResult Function(String name, bool onHovered, bool selected)? view,
  }) {
    return settings?.call(id, name, onHovered, selected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, List<Space>? subSpaces)?
        $default, {
    TResult Function(String id, String name, bool onHovered, bool selected)?
        settings,
    TResult Function(String id, String name, int? parentId)? box,
    TResult Function(String id, String name, bool onHovered, bool selected)?
        boxSettings,
    TResult Function(String name, bool onHovered, bool selected)? view,
    required TResult orElse(),
  }) {
    if (settings != null) {
      return settings(id, name, onHovered, selected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Space value) $default, {
    required TResult Function(SpaceSettings value) settings,
    required TResult Function(SpaceBox value) box,
    required TResult Function(SpaceBoxSettings value) boxSettings,
    required TResult Function(SpaceView value) view,
  }) {
    return settings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_Space value)? $default, {
    TResult Function(SpaceSettings value)? settings,
    TResult Function(SpaceBox value)? box,
    TResult Function(SpaceBoxSettings value)? boxSettings,
    TResult Function(SpaceView value)? view,
  }) {
    return settings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Space value)? $default, {
    TResult Function(SpaceSettings value)? settings,
    TResult Function(SpaceBox value)? box,
    TResult Function(SpaceBoxSettings value)? boxSettings,
    TResult Function(SpaceView value)? view,
    required TResult orElse(),
  }) {
    if (settings != null) {
      return settings(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SpaceSettingsToJson(
      this,
    );
  }
}

abstract class SpaceSettings extends Space {
  const factory SpaceSettings(
      {required final String id,
      required final String name,
      final bool onHovered,
      final bool selected}) = _$SpaceSettings;
  const SpaceSettings._() : super._();

  factory SpaceSettings.fromJson(Map<String, dynamic> json) =
      _$SpaceSettings.fromJson;

  String get id;
  @override
  String get name;
  bool get onHovered;
  bool get selected;
  @override
  @JsonKey(ignore: true)
  _$$SpaceSettingsCopyWith<_$SpaceSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SpaceBoxCopyWith<$Res> implements $SpaceCopyWith<$Res> {
  factory _$$SpaceBoxCopyWith(
          _$SpaceBox value, $Res Function(_$SpaceBox) then) =
      __$$SpaceBoxCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, int? parentId});
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
      parentId: parentId == freezed
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpaceBox extends SpaceBox {
  const _$SpaceBox(
      {required this.id,
      required this.name,
      this.parentId,
      final String? $type})
      : $type = $type ?? 'box',
        super._();

  factory _$SpaceBox.fromJson(Map<String, dynamic> json) =>
      _$$SpaceBoxFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int? parentId;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Space.box(id: $id, name: $name, parentId: $parentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpaceBox &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.parentId, parentId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(parentId));

  @JsonKey(ignore: true)
  @override
  _$$SpaceBoxCopyWith<_$SpaceBox> get copyWith =>
      __$$SpaceBoxCopyWithImpl<_$SpaceBox>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, List<Space>? subSpaces) $default, {
    required TResult Function(
            String id, String name, bool onHovered, bool selected)
        settings,
    required TResult Function(String id, String name, int? parentId) box,
    required TResult Function(
            String id, String name, bool onHovered, bool selected)
        boxSettings,
    required TResult Function(String name, bool onHovered, bool selected) view,
  }) {
    return box(id, name, parentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String id, String name, List<Space>? subSpaces)?
        $default, {
    TResult Function(String id, String name, bool onHovered, bool selected)?
        settings,
    TResult Function(String id, String name, int? parentId)? box,
    TResult Function(String id, String name, bool onHovered, bool selected)?
        boxSettings,
    TResult Function(String name, bool onHovered, bool selected)? view,
  }) {
    return box?.call(id, name, parentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, List<Space>? subSpaces)?
        $default, {
    TResult Function(String id, String name, bool onHovered, bool selected)?
        settings,
    TResult Function(String id, String name, int? parentId)? box,
    TResult Function(String id, String name, bool onHovered, bool selected)?
        boxSettings,
    TResult Function(String name, bool onHovered, bool selected)? view,
    required TResult orElse(),
  }) {
    if (box != null) {
      return box(id, name, parentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Space value) $default, {
    required TResult Function(SpaceSettings value) settings,
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
    TResult Function(SpaceSettings value)? settings,
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
    TResult Function(SpaceSettings value)? settings,
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
  const factory SpaceBox(
      {required final String id,
      required final String name,
      final int? parentId}) = _$SpaceBox;
  const SpaceBox._() : super._();

  factory SpaceBox.fromJson(Map<String, dynamic> json) = _$SpaceBox.fromJson;

  String get id;
  @override
  String get name;
  int? get parentId;
  @override
  @JsonKey(ignore: true)
  _$$SpaceBoxCopyWith<_$SpaceBox> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SpaceBoxSettingsCopyWith<$Res>
    implements $SpaceCopyWith<$Res> {
  factory _$$SpaceBoxSettingsCopyWith(
          _$SpaceBoxSettings value, $Res Function(_$SpaceBoxSettings) then) =
      __$$SpaceBoxSettingsCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, bool onHovered, bool selected});
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
    Object? id = freezed,
    Object? name = freezed,
    Object? onHovered = freezed,
    Object? selected = freezed,
  }) {
    return _then(_$SpaceBoxSettings(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      onHovered: onHovered == freezed
          ? _value.onHovered
          : onHovered // ignore: cast_nullable_to_non_nullable
              as bool,
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
  const _$SpaceBoxSettings(
      {required this.id,
      required this.name,
      this.onHovered = false,
      this.selected = false,
      final String? $type})
      : $type = $type ?? 'boxSettings',
        super._();

  factory _$SpaceBoxSettings.fromJson(Map<String, dynamic> json) =>
      _$$SpaceBoxSettingsFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey()
  final bool onHovered;
  @override
  @JsonKey()
  final bool selected;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Space.boxSettings(id: $id, name: $name, onHovered: $onHovered, selected: $selected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpaceBoxSettings &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.onHovered, onHovered) &&
            const DeepCollectionEquality().equals(other.selected, selected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(onHovered),
      const DeepCollectionEquality().hash(selected));

  @JsonKey(ignore: true)
  @override
  _$$SpaceBoxSettingsCopyWith<_$SpaceBoxSettings> get copyWith =>
      __$$SpaceBoxSettingsCopyWithImpl<_$SpaceBoxSettings>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, List<Space>? subSpaces) $default, {
    required TResult Function(
            String id, String name, bool onHovered, bool selected)
        settings,
    required TResult Function(String id, String name, int? parentId) box,
    required TResult Function(
            String id, String name, bool onHovered, bool selected)
        boxSettings,
    required TResult Function(String name, bool onHovered, bool selected) view,
  }) {
    return boxSettings(id, name, onHovered, selected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String id, String name, List<Space>? subSpaces)?
        $default, {
    TResult Function(String id, String name, bool onHovered, bool selected)?
        settings,
    TResult Function(String id, String name, int? parentId)? box,
    TResult Function(String id, String name, bool onHovered, bool selected)?
        boxSettings,
    TResult Function(String name, bool onHovered, bool selected)? view,
  }) {
    return boxSettings?.call(id, name, onHovered, selected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, List<Space>? subSpaces)?
        $default, {
    TResult Function(String id, String name, bool onHovered, bool selected)?
        settings,
    TResult Function(String id, String name, int? parentId)? box,
    TResult Function(String id, String name, bool onHovered, bool selected)?
        boxSettings,
    TResult Function(String name, bool onHovered, bool selected)? view,
    required TResult orElse(),
  }) {
    if (boxSettings != null) {
      return boxSettings(id, name, onHovered, selected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Space value) $default, {
    required TResult Function(SpaceSettings value) settings,
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
    TResult Function(SpaceSettings value)? settings,
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
    TResult Function(SpaceSettings value)? settings,
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
  const factory SpaceBoxSettings(
      {required final String id,
      required final String name,
      final bool onHovered,
      final bool selected}) = _$SpaceBoxSettings;
  const SpaceBoxSettings._() : super._();

  factory SpaceBoxSettings.fromJson(Map<String, dynamic> json) =
      _$SpaceBoxSettings.fromJson;

  String get id;
  @override
  String get name;
  bool get onHovered;
  bool get selected;
  @override
  @JsonKey(ignore: true)
  _$$SpaceBoxSettingsCopyWith<_$SpaceBoxSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SpaceViewCopyWith<$Res> implements $SpaceCopyWith<$Res> {
  factory _$$SpaceViewCopyWith(
          _$SpaceView value, $Res Function(_$SpaceView) then) =
      __$$SpaceViewCopyWithImpl<$Res>;
  @override
  $Res call({String name, bool onHovered, bool selected});
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
    Object? name = freezed,
    Object? onHovered = freezed,
    Object? selected = freezed,
  }) {
    return _then(_$SpaceView(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      onHovered: onHovered == freezed
          ? _value.onHovered
          : onHovered // ignore: cast_nullable_to_non_nullable
              as bool,
      selected: selected == freezed
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpaceView extends SpaceView {
  const _$SpaceView(
      {required this.name,
      this.onHovered = false,
      this.selected = false,
      final String? $type})
      : $type = $type ?? 'view',
        super._();

  factory _$SpaceView.fromJson(Map<String, dynamic> json) =>
      _$$SpaceViewFromJson(json);

  @override
  final String name;
  @override
  @JsonKey()
  final bool onHovered;
  @override
  @JsonKey()
  final bool selected;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Space.view(name: $name, onHovered: $onHovered, selected: $selected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpaceView &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.onHovered, onHovered) &&
            const DeepCollectionEquality().equals(other.selected, selected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(onHovered),
      const DeepCollectionEquality().hash(selected));

  @JsonKey(ignore: true)
  @override
  _$$SpaceViewCopyWith<_$SpaceView> get copyWith =>
      __$$SpaceViewCopyWithImpl<_$SpaceView>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, List<Space>? subSpaces) $default, {
    required TResult Function(
            String id, String name, bool onHovered, bool selected)
        settings,
    required TResult Function(String id, String name, int? parentId) box,
    required TResult Function(
            String id, String name, bool onHovered, bool selected)
        boxSettings,
    required TResult Function(String name, bool onHovered, bool selected) view,
  }) {
    return view(name, onHovered, selected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String id, String name, List<Space>? subSpaces)?
        $default, {
    TResult Function(String id, String name, bool onHovered, bool selected)?
        settings,
    TResult Function(String id, String name, int? parentId)? box,
    TResult Function(String id, String name, bool onHovered, bool selected)?
        boxSettings,
    TResult Function(String name, bool onHovered, bool selected)? view,
  }) {
    return view?.call(name, onHovered, selected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, List<Space>? subSpaces)?
        $default, {
    TResult Function(String id, String name, bool onHovered, bool selected)?
        settings,
    TResult Function(String id, String name, int? parentId)? box,
    TResult Function(String id, String name, bool onHovered, bool selected)?
        boxSettings,
    TResult Function(String name, bool onHovered, bool selected)? view,
    required TResult orElse(),
  }) {
    if (view != null) {
      return view(name, onHovered, selected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Space value) $default, {
    required TResult Function(SpaceSettings value) settings,
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
    TResult Function(SpaceSettings value)? settings,
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
    TResult Function(SpaceSettings value)? settings,
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
  const factory SpaceView(
      {required final String name,
      final bool onHovered,
      final bool selected}) = _$SpaceView;
  const SpaceView._() : super._();

  factory SpaceView.fromJson(Map<String, dynamic> json) = _$SpaceView.fromJson;

  @override
  String get name;
  bool get onHovered;
  bool get selected;
  @override
  @JsonKey(ignore: true)
  _$$SpaceViewCopyWith<_$SpaceView> get copyWith =>
      throw _privateConstructorUsedError;
}
