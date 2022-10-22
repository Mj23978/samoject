import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums.dart';

part 'space.freezed.dart';
part 'space.g.dart';

@unfreezed
class Space with _$Space {
  const Space._();

  factory Space({
    required String id,
    required String name,
    required SpaceView view,
    required SpaceType spaceType,
    List<Space>? subSpaces,
  }) = _Space;

  factory Space.box({
    required String id,
    required String name,
    required SpaceBoxSettings settings,
    required SpaceView view,
    @Default(SpaceType.box) SpaceType spaceType,
    String? parentId,
  }) = SpaceBox;

  factory Space.boxSettings({
    @Default(false) bool selected,
  }) = SpaceBoxSettings;

  factory Space.view({
    @Default(false) bool selected,
    @Default(false) bool onHovered,
  }) = SpaceView;

  factory Space.fromJson(Map<String, dynamic> json) => _$SpaceFromJson(json);
}

extension SpaceExtensions on Space {
  bool isHovered() {
    return map<bool>(
      (v) => v.view.onHovered,
      box: (v) => v.view.onHovered,
      boxSettings: (v) => false,
      view: (v) => false,
    );
  }

  bool isSelected() {
    return map<bool>(
      (v) => v.view.selected,
      box: (v) => v.view.selected,
      boxSettings: (v) => false,
      view: (v) => false,
    );
  }
}
