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
      spaces: (json['spaces'] as List<dynamic>?)
              ?.map((e) => Space.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tasks: (json['tasks'] as List<dynamic>?)
              ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      users: (json['users'] as List<dynamic>?)
              ?.map((e) => User.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      localId: json['localId'] as String?,
    );

Map<String, dynamic> _$$_ProjectToJson(_$_Project instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'settings': instance.settings,
      'spaces': instance.spaces,
      'tasks': instance.tasks,
      'users': instance.users,
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
