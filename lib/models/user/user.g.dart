// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String,
      username: json['username'] as String,
      date: DateTime.parse(json['date'] as String),
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      password: json['password'] as String?,
      email: json['email'] as String?,
      active: json['active'] as bool? ?? true,
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
      projects: (json['projects'] as List<dynamic>?)
              ?.map((e) => Project.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      roleName: json['roleName'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'date': instance.date.toIso8601String(),
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'password': instance.password,
      'email': instance.email,
      'active': instance.active,
      'createdTasks': instance.createdTasks,
      'assignedTasks': instance.assignedTasks,
      'comments': instance.comments,
      'projects': instance.projects,
      'roleName': instance.roleName,
    };
