import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const Task._();
  const factory Task({
    required String id,
    required String taskName,
    @Default("starting") String status,
    @Default("") String taskDetailsId,
    @Default("") String taskDetailsHash,
    @Default([]) List<Task> subTaks,
    @Default({}) Map<String, dynamic> attributes,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}