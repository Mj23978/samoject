import 'package:freezed_annotation/freezed_annotation.dart';

import '../comment/comment.dart';
import '../task/task.dart';
import '../workspace/workspace.dart';

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
    @Default(true) bool activ,
    @Default([]) List<Task> createdTasks,
    @Default([]) List<Task> assignedTasks,
    @Default([]) List<Comment> comments,
    @Default([]) List<Workspace> workspaces,
    String? roleName,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

}