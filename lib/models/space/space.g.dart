// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'space.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Space _$$_SpaceFromJson(Map<String, dynamic> json) => _$_Space(
      id: json['id'] as String,
      name: json['name'] as String,
      subSpaces: (json['subSpaces'] as List<dynamic>?)
          ?.map((e) => Space.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_SpaceToJson(_$_Space instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'subSpaces': instance.subSpaces,
      'runtimeType': instance.$type,
    };

_$SpaceSettings _$$SpaceSettingsFromJson(Map<String, dynamic> json) =>
    _$SpaceSettings(
      id: json['id'] as String,
      name: json['name'] as String,
      onHovered: json['onHovered'] as bool? ?? false,
      selected: json['selected'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SpaceSettingsToJson(_$SpaceSettings instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'onHovered': instance.onHovered,
      'selected': instance.selected,
      'runtimeType': instance.$type,
    };

_$SpaceBox _$$SpaceBoxFromJson(Map<String, dynamic> json) => _$SpaceBox(
      id: json['id'] as String,
      name: json['name'] as String,
      parentId: json['parentId'] as int?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SpaceBoxToJson(_$SpaceBox instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'parentId': instance.parentId,
      'runtimeType': instance.$type,
    };

_$SpaceBoxSettings _$$SpaceBoxSettingsFromJson(Map<String, dynamic> json) =>
    _$SpaceBoxSettings(
      id: json['id'] as String,
      name: json['name'] as String,
      onHovered: json['onHovered'] as bool? ?? false,
      selected: json['selected'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SpaceBoxSettingsToJson(_$SpaceBoxSettings instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'onHovered': instance.onHovered,
      'selected': instance.selected,
      'runtimeType': instance.$type,
    };

_$SpaceView _$$SpaceViewFromJson(Map<String, dynamic> json) => _$SpaceView(
      id: json['id'] as String,
      name: json['name'] as String,
      onHovered: json['onHovered'] as bool? ?? false,
      selected: json['selected'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SpaceViewToJson(_$SpaceView instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'onHovered': instance.onHovered,
      'selected': instance.selected,
      'runtimeType': instance.$type,
    };
