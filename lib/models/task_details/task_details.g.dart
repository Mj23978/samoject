// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskDetails _$$_TaskDetailsFromJson(Map<String, dynamic> json) =>
    _$_TaskDetails(
      id: json['id'] as String,
      hash: json['hash'] as String,
      content: json['content'] as String? ?? "",
      attributes: json['attributes'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$_TaskDetailsToJson(_$_TaskDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hash': instance.hash,
      'content': instance.content,
      'attributes': instance.attributes,
    };
