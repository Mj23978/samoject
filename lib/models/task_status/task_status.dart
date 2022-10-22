import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/helpers.dart';

part 'task_status.freezed.dart';
part 'task_status.g.dart';

@freezed
class TaskStatus with _$TaskStatus {
  const TaskStatus._();

  const factory TaskStatus({
    required String name,
    @JsonKey(
      toJson: color2String,
      fromJson: string2Color,
    )
        required Color color,
    @Default({})
        Map<String, dynamic> attributes,
  }) = _TaskStatus;

  const factory TaskStatus.complete({
    @Default('Complete')
        String name,
    @JsonKey(
      toJson: color2String,
      fromJson: string2Color,
    )
    @Default(Colors.lightGreen)
        Color color,
    @Default({})
        Map<String, dynamic> attributes,
  }) = Complete;

  const factory TaskStatus.todo({
    @Default('Todo')
        String name,
    @JsonKey(
      toJson: color2String,
      fromJson: string2Color,
    )
    @Default(Color.fromARGB(255, 252, 232, 54))
        Color color,
    @Default({})
        Map<String, dynamic> attributes,
  }) = TODO;

  const factory TaskStatus.idea({
    @Default('Idea')
        String name,
    @JsonKey(
      toJson: color2String,
      fromJson: string2Color,
    )
    @Default(Colors.grey)
        Color color,
    @Default({})
        Map<String, dynamic> attributes,
  }) = IDEA;

  const factory TaskStatus.underReview({
    @Default('Under Review')
        String name,
    @JsonKey(
      toJson: color2String,
      fromJson: string2Color,
    )
    @Default(Color(0xffffb74d))
        Color color,
    @Default({})
        Map<String, dynamic> attributes,
  }) = UnderReview;

  const factory TaskStatus.starting({
    @Default('Starting')
        String name,
    @JsonKey(
      toJson: color2String,
      fromJson: string2Color,
    )
    @Default(Colors.indigoAccent)
        Color color,
    @Default({})
        Map<String, dynamic> attributes,
  }) = Starting;

  const factory TaskStatus.planned({
    @Default('Planned')
        String name,
    @JsonKey(
      toJson: color2String,
      fromJson: string2Color,
    )
    @Default(Colors.green)
        Color color,
    @Default({})
        Map<String, dynamic> attributes,
  }) = Planned;

  const factory TaskStatus.inProgress({
    @Default('Planned')
        String name,
    @JsonKey(
      toJson: color2String,
      fromJson: string2Color,
    )
    @Default(Colors.blue)
        Color color,
    @Default({})
        Map<String, dynamic> attributes,
  }) = InProgress;

  factory TaskStatus.fromJson(Map<String, dynamic> json) =>
      _$TaskStatusFromJson(json);
}
