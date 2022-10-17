// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favorites.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Favorites _$FavoritesFromJson(Map<String, dynamic> json) {
  return _Favorites.fromJson(json);
}

/// @nodoc
mixin _$Favorites {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get onHovered => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoritesCopyWith<Favorites> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritesCopyWith<$Res> {
  factory $FavoritesCopyWith(Favorites value, $Res Function(Favorites) then) =
      _$FavoritesCopyWithImpl<$Res>;
  $Res call({String id, String name, bool onHovered});
}

/// @nodoc
class _$FavoritesCopyWithImpl<$Res> implements $FavoritesCopyWith<$Res> {
  _$FavoritesCopyWithImpl(this._value, this._then);

  final Favorites _value;
  // ignore: unused_field
  final $Res Function(Favorites) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? onHovered = freezed,
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
      onHovered: onHovered == freezed
          ? _value.onHovered
          : onHovered // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_FavoritesCopyWith<$Res> implements $FavoritesCopyWith<$Res> {
  factory _$$_FavoritesCopyWith(
          _$_Favorites value, $Res Function(_$_Favorites) then) =
      __$$_FavoritesCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, bool onHovered});
}

/// @nodoc
class __$$_FavoritesCopyWithImpl<$Res> extends _$FavoritesCopyWithImpl<$Res>
    implements _$$_FavoritesCopyWith<$Res> {
  __$$_FavoritesCopyWithImpl(
      _$_Favorites _value, $Res Function(_$_Favorites) _then)
      : super(_value, (v) => _then(v as _$_Favorites));

  @override
  _$_Favorites get _value => super._value as _$_Favorites;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? onHovered = freezed,
  }) {
    return _then(_$_Favorites(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Favorites extends _Favorites {
  const _$_Favorites(
      {required this.id, required this.name, this.onHovered = false})
      : super._();

  factory _$_Favorites.fromJson(Map<String, dynamic> json) =>
      _$$_FavoritesFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey()
  final bool onHovered;

  @override
  String toString() {
    return 'Favorites(id: $id, name: $name, onHovered: $onHovered)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Favorites &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.onHovered, onHovered));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(onHovered));

  @JsonKey(ignore: true)
  @override
  _$$_FavoritesCopyWith<_$_Favorites> get copyWith =>
      __$$_FavoritesCopyWithImpl<_$_Favorites>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavoritesToJson(
      this,
    );
  }
}

abstract class _Favorites extends Favorites {
  const factory _Favorites(
      {required final String id,
      required final String name,
      final bool onHovered}) = _$_Favorites;
  const _Favorites._() : super._();

  factory _Favorites.fromJson(Map<String, dynamic> json) =
      _$_Favorites.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  bool get onHovered;
  @override
  @JsonKey(ignore: true)
  _$$_FavoritesCopyWith<_$_Favorites> get copyWith =>
      throw _privateConstructorUsedError;
}
