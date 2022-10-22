import 'package:freezed_annotation/freezed_annotation.dart';

import '../task_status/task_status.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const Task._();
  
  const factory Task({
    required String id,
    required String taskName,
    required String creatorId,
    String? projectId,
    @Default([]) List<String> assignesId,
    @Default(TaskStatus.idea()) TaskStatus status,
    @Default("") String taskDetailsId,
    @Default("") String taskDetailsHash,
    @Default([]) List<Task> subTasks,
    @Default({}) Map<String, dynamic> attributes,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
