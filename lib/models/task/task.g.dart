// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$$_TaskFromJson(Map<String, dynamic> json) => _$_Task(
      id: json['id'] as String,
      taskName: json['taskName'] as String,
      status: json['status'] as String? ?? "starting",
      taskDetailsId: json['taskDetailsId'] as String? ?? "",
      taskDetailsHash: json['taskDetailsHash'] as String? ?? "",
      subTaks: (json['subTaks'] as List<dynamic>?)
              ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      attributes: json['attributes'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$_TaskToJson(_$_Task instance) => <String, dynamic>{
      'id': instance.id,
      'taskName': instance.taskName,
      'status': instance.status,
      'taskDetailsId': instance.taskDetailsId,
      'taskDetailsHash': instance.taskDetailsHash,
      'subTaks': instance.subTaks,
      'attributes': instance.attributes,
    };
