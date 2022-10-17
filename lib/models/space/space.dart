import 'package:freezed_annotation/freezed_annotation.dart';

part 'space.freezed.dart';
part 'space.g.dart';

@freezed
class Space with _$Space {
  const Space._();

  const factory Space({
    required String id,
    required String name,
    List<Space>? subSpaces,
  }) = _Space;

  
  const factory Space.settings({
    required String id,
    required String name,
    @Default(false) bool onHovered,
    @Default(false) bool selected,
  }) = SpaceSettings;

  
  const factory Space.box({
    required String id,
    required String name,
    int? parentId,
  }) = SpaceBox;

  
  const factory Space.boxSettings({
    required String id,
    required String name,
    @Default(false) bool onHovered,
    @Default(false) bool selected,
  }) = SpaceBoxSettings;

  
  const factory Space.view({
    required String name,
    @Default(false) bool onHovered,
    @Default(false) bool selected,
  }) = SpaceView;

  factory Space.fromJson(Map<String, dynamic> json) => _$SpaceFromJson(json);
}
