// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'space.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Space _$$_SpaceFromJson(Map<String, dynamic> json) => _$_Space(
      id: json['id'] as String,
      name: json['name'] as String,
      view: SpaceView.fromJson(json['view'] as Map<String, dynamic>),
      spaceType: $enumDecode(_$SpaceTypeEnumMap, json['spaceType']),
      subSpaces: (json['subSpaces'] as List<dynamic>?)
          ?.map((e) => Space.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_SpaceToJson(_$_Space instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'view': instance.view,
      'spaceType': _$SpaceTypeEnumMap[instance.spaceType]!,
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
      settings:
          SpaceBoxSettings.fromJson(json['settings'] as Map<String, dynamic>),
      view: SpaceView.fromJson(json['view'] as Map<String, dynamic>),
      spaceType: $enumDecodeNullable(_$SpaceTypeEnumMap, json['spaceType']) ??
          SpaceType.box,
      parentId: json['parentId'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SpaceBoxToJson(_$SpaceBox instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'settings': instance.settings,
      'view': instance.view,
      'spaceType': _$SpaceTypeEnumMap[instance.spaceType]!,
      'parentId': instance.parentId,
      'runtimeType': instance.$type,
    };

_$SpaceBoxSettings _$$SpaceBoxSettingsFromJson(Map<String, dynamic> json) =>
    _$SpaceBoxSettings(
      selected: json['selected'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SpaceBoxSettingsToJson(_$SpaceBoxSettings instance) =>
    <String, dynamic>{
      'selected': instance.selected,
      'runtimeType': instance.$type,
    };

_$SpaceView _$$SpaceViewFromJson(Map<String, dynamic> json) => _$SpaceView(
      selected: json['selected'] as bool? ?? false,
      onHovered: json['onHovered'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SpaceViewToJson(_$SpaceView instance) =>
    <String, dynamic>{
      'selected': instance.selected,
      'onHovered': instance.onHovered,
      'runtimeType': instance.$type,
    };
