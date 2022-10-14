// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskStatus _$$_TaskStatusFromJson(Map<String, dynamic> json) =>
    _$_TaskStatus(
      name: json['name'] as String,
      color: string2Color(json['color'] as String),
      attributes: json['attributes'] as Map<String, dynamic>? ?? const {},
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_TaskStatusToJson(_$_TaskStatus instance) =>
    <String, dynamic>{
      'name': instance.name,
      'color': color2String(instance.color),
      'attributes': instance.attributes,
      'runtimeType': instance.$type,
    };

_$Complete _$$CompleteFromJson(Map<String, dynamic> json) => _$Complete(
      name: json['name'] as String? ?? 'Complete',
      color: json['color'] == null
          ? Colors.lightGreen
          : string2Color(json['color'] as String),
      attributes: json['attributes'] as Map<String, dynamic>? ?? const {},
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CompleteToJson(_$Complete instance) =>
    <String, dynamic>{
      'name': instance.name,
      'color': color2String(instance.color),
      'attributes': instance.attributes,
      'runtimeType': instance.$type,
    };

_$TODO _$$TODOFromJson(Map<String, dynamic> json) => _$TODO(
      name: json['name'] as String? ?? 'Todo',
      color: json['color'] == null
          ? const Color(0xffaeea00)
          : string2Color(json['color'] as String),
      attributes: json['attributes'] as Map<String, dynamic>? ?? const {},
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TODOToJson(_$TODO instance) => <String, dynamic>{
      'name': instance.name,
      'color': color2String(instance.color),
      'attributes': instance.attributes,
      'runtimeType': instance.$type,
    };

_$IDEA _$$IDEAFromJson(Map<String, dynamic> json) => _$IDEA(
      name: json['name'] as String? ?? 'Idea',
      color: json['color'] == null
          ? Colors.grey
          : string2Color(json['color'] as String),
      attributes: json['attributes'] as Map<String, dynamic>? ?? const {},
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$IDEAToJson(_$IDEA instance) => <String, dynamic>{
      'name': instance.name,
      'color': color2String(instance.color),
      'attributes': instance.attributes,
      'runtimeType': instance.$type,
    };

_$UnderReview _$$UnderReviewFromJson(Map<String, dynamic> json) =>
    _$UnderReview(
      name: json['name'] as String? ?? 'Under Review',
      color: json['color'] == null
          ? const Color(0xffffb74d)
          : string2Color(json['color'] as String),
      attributes: json['attributes'] as Map<String, dynamic>? ?? const {},
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UnderReviewToJson(_$UnderReview instance) =>
    <String, dynamic>{
      'name': instance.name,
      'color': color2String(instance.color),
      'attributes': instance.attributes,
      'runtimeType': instance.$type,
    };

_$Starting _$$StartingFromJson(Map<String, dynamic> json) => _$Starting(
      name: json['name'] as String? ?? 'Starting',
      color: json['color'] == null
          ? Colors.indigoAccent
          : string2Color(json['color'] as String),
      attributes: json['attributes'] as Map<String, dynamic>? ?? const {},
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$StartingToJson(_$Starting instance) =>
    <String, dynamic>{
      'name': instance.name,
      'color': color2String(instance.color),
      'attributes': instance.attributes,
      'runtimeType': instance.$type,
    };

_$Planned _$$PlannedFromJson(Map<String, dynamic> json) => _$Planned(
      name: json['name'] as String? ?? 'Planned',
      color: json['color'] == null
          ? Colors.green
          : string2Color(json['color'] as String),
      attributes: json['attributes'] as Map<String, dynamic>? ?? const {},
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PlannedToJson(_$Planned instance) => <String, dynamic>{
      'name': instance.name,
      'color': color2String(instance.color),
      'attributes': instance.attributes,
      'runtimeType': instance.$type,
    };

_$InProgress _$$InProgressFromJson(Map<String, dynamic> json) => _$InProgress(
      name: json['name'] as String? ?? 'Planned',
      color: json['color'] == null
          ? Colors.blue
          : string2Color(json['color'] as String),
      attributes: json['attributes'] as Map<String, dynamic>? ?? const {},
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$InProgressToJson(_$InProgress instance) =>
    <String, dynamic>{
      'name': instance.name,
      'color': color2String(instance.color),
      'attributes': instance.attributes,
      'runtimeType': instance.$type,
    };
