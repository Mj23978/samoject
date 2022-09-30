import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_details.freezed.dart';
part 'task_details.g.dart';

@freezed
class TaskDetails with _$TaskDetails {
  const TaskDetails._();
  const factory TaskDetails({
    required String id,
    required String hash,
    @Default("") String content,
    @Default({}) Map<String, dynamic> attributes,
  }) = _TaskDetails;

  factory TaskDetails.fromJson(Map<String, dynamic> json) => _$TaskDetailsFromJson(json);
}
