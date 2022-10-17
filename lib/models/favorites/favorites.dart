import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorites.freezed.dart';
part 'favorites.g.dart';

@freezed
class Favorites with _$Favorites {
  const Favorites._();

  const factory Favorites({
    required String id,
    required String name,
    @Default(false) bool onHovered,
  }) = _Favorites;

  factory Favorites.fromJson(Map<String, dynamic> json) => _$FavoritesFromJson(json);

}
