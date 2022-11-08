import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'task_status.freezed.dart';
// part 'task_status.g.dart';

@unfreezed
class TaskStatus with _$TaskStatus {
  const TaskStatus._();

  @Entity(realClass: TaskStatus)
  factory TaskStatus({
    @Id() @Default(0) int oid,
    required String name,
    @Property() required int color,
    @Default({}) Map<String, dynamic> attributes,
  }) = _TaskStatus;

  factory TaskStatus.complete({
    @Id() @Default(0) int oid,
    @Default('Complete') String name,
    @Default(0xff8bc34a) int color,
    @Default({}) Map<String, dynamic> attributes,
  }) = Complete;

  factory TaskStatus.todo({
    @Id() @Default(0) int oid,
    @Default('Todo') String name,
    @Default(0xffffca28) int color,
    @Default({}) Map<String, dynamic> attributes,
  }) = TODO;

  factory TaskStatus.idea({
    @Id() @Default(0) int oid,
    @Default('Idea') String name,
    @Default(0xff9e9e9e) int color,
    @Default({}) Map<String, dynamic> attributes,
  }) = IDEA;

  factory TaskStatus.underReview({
    @Id() @Default(0) int oid,
    @Default('Under Review') String name,
    @Default(0xffffb74d) int color,
    @Default({}) Map<String, dynamic> attributes,
  }) = UnderReview;

  factory TaskStatus.starting({
    @Id() @Default(0) int oid,
    @Default('Starting') String name,
    @Default(0xff536dfe) int color,
    @Default({}) Map<String, dynamic> attributes,
  }) = Starting;

  factory TaskStatus.planned({
    @Id() @Default(0) int oid,
    @Default('Planned') String name,
    @Default(0xff4caf50) int color,
    @Default({}) Map<String, dynamic> attributes,
  }) = Planned;

  factory TaskStatus.inProgress({
    @Id() @Default(0) int oid,
    @Default('In Progress') String name,
    @Default(0xff2196f3) int color,
    @Default({}) Map<String, dynamic> attributes,
  }) = InProgress;

  // factory TaskStatus.fromJson(Map<String, dynamic> json) =>
  //     _$TaskStatusFromJson(json);
}

extension TaskStatusExtension on TaskStatus {
  Color getColor() {
    return Color(color);
  }
}

extension TaskStatusStrExtension on String {
  Color toTaskStatusColor() {
    if (this == "Planned") {
      return Color(0xff4caf50);
    } else if (this == "In Progress") {
      return Color(0xff2196f3);
    } else if (this == "Starting") {
      return Color(0xff536dfe);
    } else if (this == "Under Review") {
      return Color(0xffffb74d);
    } else if (this == "Idea") {
      return Color(0xff9e9e9e);
    } else if (this == "Todo") {
      return Color(0xffffca28);
    } else if (this == "Complete") {
      return Color(0xff8bc34a);
    } 
    return Colors.white;
  }
}
