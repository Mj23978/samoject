import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:samoject/models/task_details/task_details.dart';

import '../project/project.dart';
import '../task_status/task_status.dart';
import '../user/user.dart';

part 'task.freezed.dart';
// part 'task.g.dart';

@unfreezed
class Task with _$Task {
  const Task._();
  
  @Entity(realClass: Task)
  factory Task({
    @Id() @Default(0) int oid,
    required String id,
    required String taskName,
    required ToOne<User> creatorId,
    required ToOne<Project> projectId,
    required ToOne<TaskDetails> taskDetailsId,
    required ToMany<User> assignesId,
    required ToMany<Task> subTasks,
    required ToOne<TaskStatus> status,
    @Default("") String taskDetailsHash,
    // @Default({}) Map<String, dynamic> attributes,
  }) = _Task;

  // factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
