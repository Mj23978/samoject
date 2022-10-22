import 'package:freezed_annotation/freezed_annotation.dart';

import '../comment/comment.dart';
import '../project/project.dart';
import '../task/task.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {

  const User._();

  const factory User({
    required String id,
    required String username,
    required DateTime date,
    String? firstName,
    String? lastName,
    String? password,
    String? email,
    @Default(true) bool active,
    @Default([]) List<Task> createdTasks,
    @Default([]) List<Task> assignedTasks,
    @Default([]) List<Comment> comments,
    @Default([]) List<Project> projects,
    String? roleName,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

}