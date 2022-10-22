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
    required SpaceSettings settings,
    List<Space>? subSpaces,
  }) = _Space;

  factory Space.box({
    required String id,
    required String name,
    required SpaceSettings settings,
    required SpaceViewBox view,
    @Default(SpaceType.box) SpaceType spaceType,
    String? parentId,
  }) = SpaceBox;

  factory Space.fromJson(Map<String, dynamic> json) => _$SpaceFromJson(json);
}


@unfreezed
class SpaceSettings with _$SpaceSettings {

  const SpaceSettings._();

  factory SpaceSettings({
    @Default(false) bool selected,
  }) = _SpaceSettings;

  factory SpaceSettings.box({
    @Default(false) bool selected,
  }) = SpaceSettingsBox;

  factory SpaceSettings.fromJson(Map<String, dynamic> json) => _$SpaceSettingsFromJson(json);
}

@unfreezed
class SpaceView with _$SpaceView {

  const SpaceView._();

  factory SpaceView({
    @Default(false) bool onHovered,
  }) = _SpaceView;

  factory SpaceView.box({
    @Default(false) bool onHovered,

  }) = SpaceViewBox;

  factory SpaceView.fromJson(Map<String, dynamic> json) => _$SpaceViewFromJson(json);
}

extension SpaceExtensions on Space {
  bool isHovered() {
    return map<bool>(
      (v) => v.view.onHovered,
      box: (v) => v.view.onHovered,
    );
  }

  bool isSelected() {
    return map<bool>(
      (v) => v.settings.selected,
      box: (v) => v.settings.selected,
    );
  }
}
