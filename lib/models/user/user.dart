import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

import '../comment/comment.dart';
import '../project/project.dart';
import '../task/task.dart';

part 'user.freezed.dart';
// part 'user.g.dart';

@unfreezed
class User with _$User {

  const User._();

  @Entity(realClass: User)
  factory User({
    @Id() @Default(0) int oid,
    required String id,
    required String username,
    @Property(type: PropertyType.date)
    required DateTime date,
    String? firstName,
    String? lastName,
    String? password,
    String? email,
    @Default(true) bool active,
    required ToMany<Task> createdTasks,
    required ToMany<Task> assignedTasks,
    required ToMany<Comment> comments,
    required ToMany<Project> projects,
    String? roleName,
  }) = _User;

  // factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

}