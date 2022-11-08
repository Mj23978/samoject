import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'task_details.freezed.dart';
// part 'task_details.g.dart';

@unfreezed
class TaskDetails with _$TaskDetails {
  const TaskDetails._();

  @Entity(realClass: TaskDetails)
  factory TaskDetails({
    @Id() @Default(0) int oid,
    required String id,
    required String hash,
    @Default("") String content,
    // @Default({}) Map<String, dynamic> attributes,
  }) = _TaskDetails;

  // factory TaskDetails.fromJson(Map<String, dynamic> json) => _$TaskDetailsFromJson(json);
}
