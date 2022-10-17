// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Project _$$_ProjectFromJson(Map<String, dynamic> json) => _$_Project(
      id: json['id'] as String,
      name: json['name'] as String,
      settings:
          ProjectSettings.fromJson(json['settings'] as Map<String, dynamic>),
      localId: json['localId'] as String?,
    );

Map<String, dynamic> _$$_ProjectToJson(_$_Project instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'settings': instance.settings,
      'localId': instance.localId,
    };

_$_ProjectSettings _$$_ProjectSettingsFromJson(Map<String, dynamic> json) =>
    _$_ProjectSettings(
      id: json['id'] as String,
      localId: json['localId'] as String?,
    );

Map<String, dynamic> _$$_ProjectSettingsToJson(_$_ProjectSettings instance) =>
    <String, dynamic>{
      'id': instance.id,
      'localId': instance.localId,
    };
