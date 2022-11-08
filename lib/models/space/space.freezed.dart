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

/// @nodoc
mixin _$Space {
  @Id()
  int get oid => throw _privateConstructorUsedError;
  @Id()
  set oid(int value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  ToOne<SpaceView> get view => throw _privateConstructorUsedError;
  set view(ToOne<SpaceView> value) => throw _privateConstructorUsedError;
  ToOne<Project> get projectId => throw _privateConstructorUsedError;
  set projectId(ToOne<Project> value) => throw _privateConstructorUsedError;
  String get spaceType => throw _privateConstructorUsedError;
  set spaceType(String value) => throw _privateConstructorUsedError;
  ToOne<SpaceSettings> get settings => throw _privateConstructorUsedError;
  set settings(ToOne<SpaceSettings> value) =>
      throw _privateConstructorUsedError;
  ToMany<Space> get subSpaces => throw _privateConstructorUsedError;
  set subSpaces(ToMany<Space> value) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @Id() int oid,
            String id,
            String name,
            ToOne<SpaceView> view,
            ToOne<Project> projectId,
            String spaceType,
            ToOne<SpaceSettings> settings,
            ToMany<Space> subSpaces)
        $default, {
    required TResult Function(
            @Id() int oid,
            String id,
            String name,
            ToOne<Project> projectId,
            ToOne<SpaceSettings> settings,
            ToOne<SpaceView> view,
            String spaceType,
            ToMany<Space> subSpaces)
        box,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            @Id() int oid,
            String id,
            String name,
            ToOne<SpaceView> view,
            ToOne<Project> projectId,
            String spaceType,
            ToOne<SpaceSettings> settings,
            ToMany<Space> subSpaces)?
        $default, {
    TResult Function(
            @Id() int oid,
            String id,
            String name,
            ToOne<Project> projectId,
            ToOne<SpaceSettings> settings,
            ToOne<SpaceView> view,
            String spaceType,
            ToMany<Space> subSpaces)?
        box,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @Id() int oid,
            String id,
            String name,
            ToOne<SpaceView> view,
            ToOne<Project> projectId,
            String spaceType,
            ToOne<SpaceSettings> settings,
            ToMany<Space> subSpaces)?
        $default, {
    TResult Function(
            @Id() int oid,
            String id,
            String name,
            ToOne<Project> projectId,
            ToOne<SpaceSettings> settings,
            ToOne<SpaceView> view,
            String spaceType,
            ToMany<Space> subSpaces)?
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

  @JsonKey(ignore: true)
  $SpaceCopyWith<Space> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpaceCopyWith<$Res> {
  factory $SpaceCopyWith(Space value, $Res Function(Space) then) =
      _$SpaceCopyWithImpl<$Res>;
  $Res call(
      {@Id() int oid,
      String id,
      String name,
      ToOne<SpaceView> view,
      ToOne<Project> projectId,
      String spaceType,
      ToOne<SpaceSettings> settings,
      ToMany<Space> subSpaces});
}

/// @nodoc
class _$SpaceCopyWithImpl<$Res> implements $SpaceCopyWith<$Res> {
  _$SpaceCopyWithImpl(this._value, this._then);

  final Space _value;
  // ignore: unused_field
  final $Res Function(Space) _then;

  @override
  $Res call({
    Object? oid = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? view = freezed,
    Object? projectId = freezed,
    Object? spaceType = freezed,
    Object? settings = freezed,
    Object? subSpaces = freezed,
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
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      view: view == freezed
          ? _value.view
          : view // ignore: cast_nullable_to_non_nullable
              as ToOne<SpaceView>,
      projectId: projectId == freezed
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as ToOne<Project>,
      spaceType: spaceType == freezed
          ? _value.spaceType
          : spaceType // ignore: cast_nullable_to_non_nullable
              as String,
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as ToOne<SpaceSettings>,
      subSpaces: subSpaces == freezed
          ? _value.subSpaces
          : subSpaces // ignore: cast_nullable_to_non_nullable
              as ToMany<Space>,
    ));
  }
}

/// @nodoc
abstract class _$$_SpaceCopyWith<$Res> implements $SpaceCopyWith<$Res> {
  factory _$$_SpaceCopyWith(_$_Space value, $Res Function(_$_Space) then) =
      __$$_SpaceCopyWithImpl<$Res>;
  @override
  $Res call(
      {@Id() int oid,
      String id,
      String name,
      ToOne<SpaceView> view,
      ToOne<Project> projectId,
      String spaceType,
      ToOne<SpaceSettings> settings,
      ToMany<Space> subSpaces});
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
    Object? oid = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? view = freezed,
    Object? projectId = freezed,
    Object? spaceType = freezed,
    Object? settings = freezed,
    Object? subSpaces = freezed,
  }) {
    return _then(_$_Space(
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as int,
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
              as ToOne<SpaceView>,
      projectId: projectId == freezed
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as ToOne<Project>,
      spaceType: spaceType == freezed
          ? _value.spaceType
          : spaceType // ignore: cast_nullable_to_non_nullable
              as String,
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as ToOne<SpaceSettings>,
      subSpaces: subSpaces == freezed
          ? _value.subSpaces
          : subSpaces // ignore: cast_nullable_to_non_nullable
              as ToMany<Space>,
    ));
  }
}

/// @nodoc

@Entity(realClass: Space)
class _$_Space extends _Space {
  _$_Space(
      {@Id() this.oid = 0,
      required this.id,
      required this.name,
      required this.view,
      required this.projectId,
      required this.spaceType,
      required this.settings,
      required this.subSpaces})
      : super._();

  @override
  @JsonKey()
  @Id()
  int oid;
  @override
  String id;
  @override
  String name;
  @override
  ToOne<SpaceView> view;
  @override
  ToOne<Project> projectId;
  @override
  String spaceType;
  @override
  ToOne<SpaceSettings> settings;
  @override
  ToMany<Space> subSpaces;

  @override
  String toString() {
    return 'Space(oid: $oid, id: $id, name: $name, view: $view, projectId: $projectId, spaceType: $spaceType, settings: $settings, subSpaces: $subSpaces)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_SpaceCopyWith<_$_Space> get copyWith =>
      __$$_SpaceCopyWithImpl<_$_Space>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @Id() int oid,
            String id,
            String name,
            ToOne<SpaceView> view,
            ToOne<Project> projectId,
            String spaceType,
            ToOne<SpaceSettings> settings,
            ToMany<Space> subSpaces)
        $default, {
    required TResult Function(
            @Id() int oid,
            String id,
            String name,
            ToOne<Project> projectId,
            ToOne<SpaceSettings> settings,
            ToOne<SpaceView> view,
            String spaceType,
            ToMany<Space> subSpaces)
        box,
  }) {
    return $default(
        oid, id, name, view, projectId, spaceType, settings, subSpaces);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            @Id() int oid,
            String id,
            String name,
            ToOne<SpaceView> view,
            ToOne<Project> projectId,
            String spaceType,
            ToOne<SpaceSettings> settings,
            ToMany<Space> subSpaces)?
        $default, {
    TResult Function(
            @Id() int oid,
            String id,
            String name,
            ToOne<Project> projectId,
            ToOne<SpaceSettings> settings,
            ToOne<SpaceView> view,
            String spaceType,
            ToMany<Space> subSpaces)?
        box,
  }) {
    return $default?.call(
        oid, id, name, view, projectId, spaceType, settings, subSpaces);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @Id() int oid,
            String id,
            String name,
            ToOne<SpaceView> view,
            ToOne<Project> projectId,
            String spaceType,
            ToOne<SpaceSettings> settings,
            ToMany<Space> subSpaces)?
        $default, {
    TResult Function(
            @Id() int oid,
            String id,
            String name,
            ToOne<Project> projectId,
            ToOne<SpaceSettings> settings,
            ToOne<SpaceView> view,
            String spaceType,
            ToMany<Space> subSpaces)?
        box,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
          oid, id, name, view, projectId, spaceType, settings, subSpaces);
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
}

abstract class _Space extends Space {
  factory _Space(
      {@Id() int oid,
      required String id,
      required String name,
      required ToOne<SpaceView> view,
      required ToOne<Project> projectId,
      required String spaceType,
      required ToOne<SpaceSettings> settings,
      required ToMany<Space> subSpaces}) = _$_Space;
  _Space._() : super._();

  @override
  @Id()
  int get oid;
  @Id()
  set oid(int value);
  @override
  String get id;
  set id(String value);
  @override
  String get name;
  set name(String value);
  @override
  ToOne<SpaceView> get view;
  set view(ToOne<SpaceView> value);
  @override
  ToOne<Project> get projectId;
  set projectId(ToOne<Project> value);
  @override
  String get spaceType;
  set spaceType(String value);
  @override
  ToOne<SpaceSettings> get settings;
  set settings(ToOne<SpaceSettings> value);
  @override
  ToMany<Space> get subSpaces;
  set subSpaces(ToMany<Space> value);
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
      {@Id() int oid,
      String id,
      String name,
      ToOne<Project> projectId,
      ToOne<SpaceSettings> settings,
      ToOne<SpaceView> view,
      String spaceType,
      ToMany<Space> subSpaces});
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
    Object? oid = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? projectId = freezed,
    Object? settings = freezed,
    Object? view = freezed,
    Object? spaceType = freezed,
    Object? subSpaces = freezed,
  }) {
    return _then(_$SpaceBox(
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: projectId == freezed
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as ToOne<Project>,
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as ToOne<SpaceSettings>,
      view: view == freezed
          ? _value.view
          : view // ignore: cast_nullable_to_non_nullable
              as ToOne<SpaceView>,
      spaceType: spaceType == freezed
          ? _value.spaceType
          : spaceType // ignore: cast_nullable_to_non_nullable
              as String,
      subSpaces: subSpaces == freezed
          ? _value.subSpaces
          : subSpaces // ignore: cast_nullable_to_non_nullable
              as ToMany<Space>,
    ));
  }
}

/// @nodoc

@Entity(realClass: SpaceBox)
class _$SpaceBox extends SpaceBox {
  _$SpaceBox(
      {@Id() this.oid = 0,
      required this.id,
      required this.name,
      required this.projectId,
      required this.settings,
      required this.view,
      this.spaceType = 'box',
      required this.subSpaces})
      : super._();

  @override
  @JsonKey()
  @Id()
  int oid;
  @override
  String id;
  @override
  String name;
  @override
  ToOne<Project> projectId;
  @override
  ToOne<SpaceSettings> settings;
  @override
  ToOne<SpaceView> view;
  @override
  @JsonKey()
  String spaceType;
  @override
  ToMany<Space> subSpaces;

  @override
  String toString() {
    return 'Space.box(oid: $oid, id: $id, name: $name, projectId: $projectId, settings: $settings, view: $view, spaceType: $spaceType, subSpaces: $subSpaces)';
  }

  @JsonKey(ignore: true)
  @override
  _$$SpaceBoxCopyWith<_$SpaceBox> get copyWith =>
      __$$SpaceBoxCopyWithImpl<_$SpaceBox>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @Id() int oid,
            String id,
            String name,
            ToOne<SpaceView> view,
            ToOne<Project> projectId,
            String spaceType,
            ToOne<SpaceSettings> settings,
            ToMany<Space> subSpaces)
        $default, {
    required TResult Function(
            @Id() int oid,
            String id,
            String name,
            ToOne<Project> projectId,
            ToOne<SpaceSettings> settings,
            ToOne<SpaceView> view,
            String spaceType,
            ToMany<Space> subSpaces)
        box,
  }) {
    return box(oid, id, name, projectId, settings, view, spaceType, subSpaces);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            @Id() int oid,
            String id,
            String name,
            ToOne<SpaceView> view,
            ToOne<Project> projectId,
            String spaceType,
            ToOne<SpaceSettings> settings,
            ToMany<Space> subSpaces)?
        $default, {
    TResult Function(
            @Id() int oid,
            String id,
            String name,
            ToOne<Project> projectId,
            ToOne<SpaceSettings> settings,
            ToOne<SpaceView> view,
            String spaceType,
            ToMany<Space> subSpaces)?
        box,
  }) {
    return box?.call(
        oid, id, name, projectId, settings, view, spaceType, subSpaces);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @Id() int oid,
            String id,
            String name,
            ToOne<SpaceView> view,
            ToOne<Project> projectId,
            String spaceType,
            ToOne<SpaceSettings> settings,
            ToMany<Space> subSpaces)?
        $default, {
    TResult Function(
            @Id() int oid,
            String id,
            String name,
            ToOne<Project> projectId,
            ToOne<SpaceSettings> settings,
            ToOne<SpaceView> view,
            String spaceType,
            ToMany<Space> subSpaces)?
        box,
    required TResult orElse(),
  }) {
    if (box != null) {
      return box(
          oid, id, name, projectId, settings, view, spaceType, subSpaces);
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
}

abstract class SpaceBox extends Space {
  factory SpaceBox(
      {@Id() int oid,
      required String id,
      required String name,
      required ToOne<Project> projectId,
      required ToOne<SpaceSettings> settings,
      required ToOne<SpaceView> view,
      String spaceType,
      required ToMany<Space> subSpaces}) = _$SpaceBox;
  SpaceBox._() : super._();

  @override
  @Id()
  int get oid;
  @Id()
  set oid(int value);
  @override
  String get id;
  set id(String value);
  @override
  String get name;
  set name(String value);
  @override
  ToOne<Project> get projectId;
  set projectId(ToOne<Project> value);
  @override
  ToOne<SpaceSettings> get settings;
  set settings(ToOne<SpaceSettings> value);
  @override
  ToOne<SpaceView> get view;
  set view(ToOne<SpaceView> value);
  @override
  String get spaceType;
  set spaceType(String value);
  @override
  ToMany<Space> get subSpaces;
  set subSpaces(ToMany<Space> value);
  @override
  @JsonKey(ignore: true)
  _$$SpaceBoxCopyWith<_$SpaceBox> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SpaceSettings {
  @Id()
  int get oid => throw _privateConstructorUsedError;
  @Id()
  set oid(int value) => throw _privateConstructorUsedError;
  bool get selected => throw _privateConstructorUsedError;
  set selected(bool value) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@Id() int oid, bool selected) $default, {
    required TResult Function(@Id() int oid, bool selected) box,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(@Id() int oid, bool selected)? $default, {
    TResult Function(@Id() int oid, bool selected)? box,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@Id() int oid, bool selected)? $default, {
    TResult Function(@Id() int oid, bool selected)? box,
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

  @JsonKey(ignore: true)
  $SpaceSettingsCopyWith<SpaceSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpaceSettingsCopyWith<$Res> {
  factory $SpaceSettingsCopyWith(
          SpaceSettings value, $Res Function(SpaceSettings) then) =
      _$SpaceSettingsCopyWithImpl<$Res>;
  $Res call({@Id() int oid, bool selected});
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
    Object? oid = freezed,
    Object? selected = freezed,
  }) {
    return _then(_value.copyWith(
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as int,
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
  $Res call({@Id() int oid, bool selected});
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
    Object? oid = freezed,
    Object? selected = freezed,
  }) {
    return _then(_$_SpaceSettings(
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as int,
      selected: selected == freezed
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@Entity(realClass: SpaceSettings)
class _$_SpaceSettings extends _SpaceSettings {
  _$_SpaceSettings({@Id() this.oid = 0, this.selected = false}) : super._();

  @override
  @JsonKey()
  @Id()
  int oid;
  @override
  @JsonKey()
  bool selected;

  @override
  String toString() {
    return 'SpaceSettings(oid: $oid, selected: $selected)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_SpaceSettingsCopyWith<_$_SpaceSettings> get copyWith =>
      __$$_SpaceSettingsCopyWithImpl<_$_SpaceSettings>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@Id() int oid, bool selected) $default, {
    required TResult Function(@Id() int oid, bool selected) box,
  }) {
    return $default(oid, selected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(@Id() int oid, bool selected)? $default, {
    TResult Function(@Id() int oid, bool selected)? box,
  }) {
    return $default?.call(oid, selected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@Id() int oid, bool selected)? $default, {
    TResult Function(@Id() int oid, bool selected)? box,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(oid, selected);
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
}

abstract class _SpaceSettings extends SpaceSettings {
  factory _SpaceSettings({@Id() int oid, bool selected}) = _$_SpaceSettings;
  _SpaceSettings._() : super._();

  @override
  @Id()
  int get oid;
  @Id()
  set oid(int value);
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
  $Res call({@Id() int oid, bool selected});
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
    Object? oid = freezed,
    Object? selected = freezed,
  }) {
    return _then(_$SpaceSettingsBox(
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as int,
      selected: selected == freezed
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@Entity(realClass: SpaceSettingsBox)
class _$SpaceSettingsBox extends SpaceSettingsBox {
  _$SpaceSettingsBox({@Id() this.oid = 0, this.selected = false}) : super._();

  @override
  @JsonKey()
  @Id()
  int oid;
  @override
  @JsonKey()
  bool selected;

  @override
  String toString() {
    return 'SpaceSettings.box(oid: $oid, selected: $selected)';
  }

  @JsonKey(ignore: true)
  @override
  _$$SpaceSettingsBoxCopyWith<_$SpaceSettingsBox> get copyWith =>
      __$$SpaceSettingsBoxCopyWithImpl<_$SpaceSettingsBox>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@Id() int oid, bool selected) $default, {
    required TResult Function(@Id() int oid, bool selected) box,
  }) {
    return box(oid, selected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(@Id() int oid, bool selected)? $default, {
    TResult Function(@Id() int oid, bool selected)? box,
  }) {
    return box?.call(oid, selected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@Id() int oid, bool selected)? $default, {
    TResult Function(@Id() int oid, bool selected)? box,
    required TResult orElse(),
  }) {
    if (box != null) {
      return box(oid, selected);
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
}

abstract class SpaceSettingsBox extends SpaceSettings {
  factory SpaceSettingsBox({@Id() int oid, bool selected}) = _$SpaceSettingsBox;
  SpaceSettingsBox._() : super._();

  @override
  @Id()
  int get oid;
  @Id()
  set oid(int value);
  @override
  bool get selected;
  set selected(bool value);
  @override
  @JsonKey(ignore: true)
  _$$SpaceSettingsBoxCopyWith<_$SpaceSettingsBox> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SpaceView {
  @Id()
  int get oid => throw _privateConstructorUsedError;
  @Id()
  set oid(int value) => throw _privateConstructorUsedError;
  bool get onHovered => throw _privateConstructorUsedError;
  set onHovered(bool value) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@Id() int oid, bool onHovered) $default, {
    required TResult Function(@Id() int oid, bool onHovered) box,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(@Id() int oid, bool onHovered)? $default, {
    TResult Function(@Id() int oid, bool onHovered)? box,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@Id() int oid, bool onHovered)? $default, {
    TResult Function(@Id() int oid, bool onHovered)? box,
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

  @JsonKey(ignore: true)
  $SpaceViewCopyWith<SpaceView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpaceViewCopyWith<$Res> {
  factory $SpaceViewCopyWith(SpaceView value, $Res Function(SpaceView) then) =
      _$SpaceViewCopyWithImpl<$Res>;
  $Res call({@Id() int oid, bool onHovered});
}

/// @nodoc
class _$SpaceViewCopyWithImpl<$Res> implements $SpaceViewCopyWith<$Res> {
  _$SpaceViewCopyWithImpl(this._value, this._then);

  final SpaceView _value;
  // ignore: unused_field
  final $Res Function(SpaceView) _then;

  @override
  $Res call({
    Object? oid = freezed,
    Object? onHovered = freezed,
  }) {
    return _then(_value.copyWith(
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as int,
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
  $Res call({@Id() int oid, bool onHovered});
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
    Object? oid = freezed,
    Object? onHovered = freezed,
  }) {
    return _then(_$_SpaceView(
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as int,
      onHovered: onHovered == freezed
          ? _value.onHovered
          : onHovered // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@Entity(realClass: SpaceView)
class _$_SpaceView extends _SpaceView {
  _$_SpaceView({@Id() this.oid = 0, this.onHovered = false}) : super._();

  @override
  @JsonKey()
  @Id()
  int oid;
  @override
  @JsonKey()
  bool onHovered;

  @override
  String toString() {
    return 'SpaceView(oid: $oid, onHovered: $onHovered)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_SpaceViewCopyWith<_$_SpaceView> get copyWith =>
      __$$_SpaceViewCopyWithImpl<_$_SpaceView>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@Id() int oid, bool onHovered) $default, {
    required TResult Function(@Id() int oid, bool onHovered) box,
  }) {
    return $default(oid, onHovered);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(@Id() int oid, bool onHovered)? $default, {
    TResult Function(@Id() int oid, bool onHovered)? box,
  }) {
    return $default?.call(oid, onHovered);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@Id() int oid, bool onHovered)? $default, {
    TResult Function(@Id() int oid, bool onHovered)? box,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(oid, onHovered);
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
}

abstract class _SpaceView extends SpaceView {
  factory _SpaceView({@Id() int oid, bool onHovered}) = _$_SpaceView;
  _SpaceView._() : super._();

  @override
  @Id()
  int get oid;
  @Id()
  set oid(int value);
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
  $Res call({@Id() int oid, bool onHovered});
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
    Object? oid = freezed,
    Object? onHovered = freezed,
  }) {
    return _then(_$SpaceViewBox(
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as int,
      onHovered: onHovered == freezed
          ? _value.onHovered
          : onHovered // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@Entity(realClass: SpaceViewBox)
class _$SpaceViewBox extends SpaceViewBox {
  _$SpaceViewBox({@Id() this.oid = 0, this.onHovered = false}) : super._();

  @override
  @JsonKey()
  @Id()
  int oid;
  @override
  @JsonKey()
  bool onHovered;

  @override
  String toString() {
    return 'SpaceView.box(oid: $oid, onHovered: $onHovered)';
  }

  @JsonKey(ignore: true)
  @override
  _$$SpaceViewBoxCopyWith<_$SpaceViewBox> get copyWith =>
      __$$SpaceViewBoxCopyWithImpl<_$SpaceViewBox>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@Id() int oid, bool onHovered) $default, {
    required TResult Function(@Id() int oid, bool onHovered) box,
  }) {
    return box(oid, onHovered);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(@Id() int oid, bool onHovered)? $default, {
    TResult Function(@Id() int oid, bool onHovered)? box,
  }) {
    return box?.call(oid, onHovered);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@Id() int oid, bool onHovered)? $default, {
    TResult Function(@Id() int oid, bool onHovered)? box,
    required TResult orElse(),
  }) {
    if (box != null) {
      return box(oid, onHovered);
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
}

abstract class SpaceViewBox extends SpaceView {
  factory SpaceViewBox({@Id() int oid, bool onHovered}) = _$SpaceViewBox;
  SpaceViewBox._() : super._();

  @override
  @Id()
  int get oid;
  @Id()
  set oid(int value);
  @override
  bool get onHovered;
  set onHovered(bool value);
  @override
  @JsonKey(ignore: true)
  _$$SpaceViewBoxCopyWith<_$SpaceViewBox> get copyWith =>
      throw _privateConstructorUsedError;
}
