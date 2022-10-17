// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Workspace _$$_WorkspaceFromJson(Map<String, dynamic> json) => _$_Workspace(
      id: json['id'] as String,
      name: json['name'] as String,
      project: (json['project'] as List<dynamic>?)
              ?.map((e) => Project.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      spaces: (json['spaces'] as List<dynamic>?)
              ?.map((e) => Space.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_WorkspaceToJson(_$_Workspace instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'project': instance.project,
      'spaces': instance.spaces,
    };
