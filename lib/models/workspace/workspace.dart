import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

import '../project/project.dart';
import '../user/user.dart';

part 'workspace.freezed.dart';
// part 'workspace.g.dart';

@unfreezed
class Workspace with _$Workspace {
  const Workspace._();

  @Entity(realClass: Workspace)
  factory Workspace({
    @Id() @Default(0) int oid,
    required String id,
    required String name,
    required ToOne<User> belongsTo,
    required ToMany<Project> projects,
  }) = _Workspace;

  // factory Workspace.fromJson(Map<String, dynamic> json) => _$WorkspaceFromJson(json);

}
