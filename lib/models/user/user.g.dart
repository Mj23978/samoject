// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String,
      username: json['username'] as String,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      activ: json['activ'] as bool? ?? true,
      createdTasks: (json['createdTasks'] as List<dynamic>?)
              ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      assignedTasks: (json['assignedTasks'] as List<dynamic>?)
              ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      comments: (json['comments'] as List<dynamic>?)
              ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      workspaces: (json['workspaces'] as List<dynamic>?)
              ?.map((e) => Workspace.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      roleName: json['roleName'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'activ': instance.activ,
      'createdTasks': instance.createdTasks,
      'assignedTasks': instance.assignedTasks,
      'comments': instance.comments,
      'workspaces': instance.workspaces,
      'roleName': instance.roleName,
    };
