import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

import '../project/project.dart';

part 'space.freezed.dart';
// part 'space.g.dart';

@unfreezed
class Space with _$Space {
  const Space._();

  @Entity(realClass: Space)
  factory Space({
    @Id() @Default(0) int oid,
    required String id,
    required String name,
    required ToOne<SpaceView> view,
    required ToOne<Project> projectId,
    required String spaceType,
    required ToOne<SpaceSettings> settings,
    required ToMany<Space> subSpaces,
  }) = _Space;

  @Entity(realClass: SpaceBox)
  factory Space.box({
    @Id() @Default(0) int oid,
    required String id,
    required String name,
    required ToOne<Project> projectId,
    required ToOne<SpaceSettings> settings,
    required ToOne<SpaceView> view,
    @Default('box') String spaceType,
    required ToMany<Space> subSpaces,
  }) = SpaceBox;

  // factory Space.fromJson(Map<String, dynamic> json) => _$SpaceFromJson(json);
}


@unfreezed
class SpaceSettings with _$SpaceSettings {

  const SpaceSettings._();

  @Entity(realClass: SpaceSettings)
  factory SpaceSettings({
    @Id() @Default(0) int oid,
    @Default(false) bool selected,
  }) = _SpaceSettings;

  @Entity(realClass: SpaceSettingsBox)
  factory SpaceSettings.box({
    @Id() @Default(0) int oid,
    @Default(false) bool selected,
  }) = SpaceSettingsBox;

  // factory SpaceSettings.fromJson(Map<String, dynamic> json) => _$SpaceSettingsFromJson(json);
}

@unfreezed
class SpaceView with _$SpaceView {

  const SpaceView._();

  @Entity(realClass: SpaceView)
  factory SpaceView({
    @Id() @Default(0) int oid,
    @Default(false) bool onHovered,
  }) = _SpaceView;

  @Entity(realClass: SpaceViewBox)
  factory SpaceView.box({
    @Id() @Default(0) int oid,
    @Default(false) bool onHovered,

  }) = SpaceViewBox;

  // factory SpaceView.fromJson(Map<String, dynamic> json) => _$SpaceViewFromJson(json);
}

extension SpaceExtensions on Space {
  bool isHovered() {
    return map<bool>(
      (v) => v.view.target?.onHovered ?? false,
      box: (v) => v.view.target?.onHovered ?? false,
    );
  }

  bool isSelected() {
    return map<bool>(
      (v) => v.settings.target?.selected ?? false,
      box: (v) => v.settings.target?.selected ?? false,
    );
  }
}
