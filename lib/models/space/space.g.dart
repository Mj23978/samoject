// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'space.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Space _$$_SpaceFromJson(Map<String, dynamic> json) => _$_Space(
      id: json['id'] as String,
      name: json['name'] as String,
      view: SpaceView.fromJson(json['view'] as Map<String, dynamic>),
      projectId: json['projectId'] as String,
      spaceType: $enumDecode(_$SpaceTypeEnumMap, json['spaceType']),
      settings:
          SpaceSettings.fromJson(json['settings'] as Map<String, dynamic>),
      subSpaces: (json['subSpaces'] as List<dynamic>?)
          ?.map((e) => Space.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_SpaceToJson(_$_Space instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'view': instance.view,
      'projectId': instance.projectId,
      'spaceType': _$SpaceTypeEnumMap[instance.spaceType]!,
      'settings': instance.settings,
      'subSpaces': instance.subSpaces,
      'runtimeType': instance.$type,
    };

const _$SpaceTypeEnumMap = {
  SpaceType.box: 'box',
  SpaceType.list: 'list',
  SpaceType.board: 'board',
  SpaceType.none: 'none',
};

_$SpaceBox _$$SpaceBoxFromJson(Map<String, dynamic> json) => _$SpaceBox(
      id: json['id'] as String,
      name: json['name'] as String,
      projectId: json['projectId'] as String,
      settings:
          SpaceSettings.fromJson(json['settings'] as Map<String, dynamic>),
      view: SpaceViewBox.fromJson(json['view'] as Map<String, dynamic>),
      spaceType: $enumDecodeNullable(_$SpaceTypeEnumMap, json['spaceType']) ??
          SpaceType.box,
      parentId: json['parentId'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SpaceBoxToJson(_$SpaceBox instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'projectId': instance.projectId,
      'settings': instance.settings,
      'view': instance.view,
      'spaceType': _$SpaceTypeEnumMap[instance.spaceType]!,
      'parentId': instance.parentId,
      'runtimeType': instance.$type,
    };

_$_SpaceSettings _$$_SpaceSettingsFromJson(Map<String, dynamic> json) =>
    _$_SpaceSettings(
      selected: json['selected'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_SpaceSettingsToJson(_$_SpaceSettings instance) =>
    <String, dynamic>{
      'selected': instance.selected,
      'runtimeType': instance.$type,
    };

_$SpaceSettingsBox _$$SpaceSettingsBoxFromJson(Map<String, dynamic> json) =>
    _$SpaceSettingsBox(
      selected: json['selected'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SpaceSettingsBoxToJson(_$SpaceSettingsBox instance) =>
    <String, dynamic>{
      'selected': instance.selected,
      'runtimeType': instance.$type,
    };

_$_SpaceView _$$_SpaceViewFromJson(Map<String, dynamic> json) => _$_SpaceView(
      onHovered: json['onHovered'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_SpaceViewToJson(_$_SpaceView instance) =>
    <String, dynamic>{
      'onHovered': instance.onHovered,
      'runtimeType': instance.$type,
    };

_$SpaceViewBox _$$SpaceViewBoxFromJson(Map<String, dynamic> json) =>
    _$SpaceViewBox(
      onHovered: json['onHovered'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SpaceViewBoxToJson(_$SpaceViewBox instance) =>
    <String, dynamic>{
      'onHovered': instance.onHovered,
      'runtimeType': instance.$type,
    };
