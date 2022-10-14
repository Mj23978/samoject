import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:samoject/models/comment/comment.dart';

import '../task/task.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {

  const User._();
  const factory User({
    required String id,
    required String username,
    String? firstName,
    String? lastName,
    @Default(true) bool activ,
    @Default([]) List<Task> createdTasks,
    @Default([]) List<Task> assignedTasks,
    @Default([]) List<Comment> comments,
    String? roleName,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

}