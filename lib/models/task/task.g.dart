// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$$_TaskFromJson(Map<String, dynamic> json) => _$_Task(
      id: json['id'] as String,
      taskName: json['taskName'] as String,
      creatorId: json['creatorId'] as String,
      projectId: json['projectId'] as String,
      assignesId: (json['assignesId'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      status: json['status'] == null
          ? const TaskStatus.idea()
          : TaskStatus.fromJson(json['status'] as Map<String, dynamic>),
      taskDetailsId: json['taskDetailsId'] as String? ?? "",
      taskDetailsHash: json['taskDetailsHash'] as String? ?? "",
      subTasks: (json['subTasks'] as List<dynamic>?)
              ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      attributes: json['attributes'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$_TaskToJson(_$_Task instance) => <String, dynamic>{
      'id': instance.id,
      'taskName': instance.taskName,
      'creatorId': instance.creatorId,
      'projectId': instance.projectId,
      'assignesId': instance.assignesId,
      'status': instance.status,
      'taskDetailsId': instance.taskDetailsId,
      'taskDetailsHash': instance.taskDetailsHash,
      'subTasks': instance.subTasks,
      'attributes': instance.attributes,
    };
