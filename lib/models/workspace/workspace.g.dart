// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Workspace _$$_WorkspaceFromJson(Map<String, dynamic> json) => _$_Workspace(
      id: json['id'] as String,
      name: json['name'] as String,
      belongsTo: User.fromJson(json['belongsTo'] as Map<String, dynamic>),
      projects: (json['projects'] as List<dynamic>?)
              ?.map((e) => Project.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_WorkspaceToJson(_$_Workspace instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'belongsTo': instance.belongsTo,
      'projects': instance.projects,
    };
