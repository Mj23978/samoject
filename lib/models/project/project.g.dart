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
      spaceIds: (json['spaceIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      tasks: (json['tasks'] as List<dynamic>?)
              ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      taskIds: (json['taskIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      users: (json['users'] as List<dynamic>?)
              ?.map((e) => User.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      userIds: (json['userIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      workspaceId: json['workspaceId'] as String,
    );

Map<String, dynamic> _$$_ProjectToJson(_$_Project instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'settings': instance.settings,
      'spaces': instance.spaces,
      'spaceIds': instance.spaceIds,
      'tasks': instance.tasks,
      'taskIds': instance.taskIds,
      'users': instance.users,
      'userIds': instance.userIds,
      'workspaceId': instance.workspaceId,
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
