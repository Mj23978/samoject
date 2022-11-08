import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

import '../space/space.dart';
import '../task/task.dart';
import '../user/user.dart';
import '../workspace/workspace.dart';

part 'project.freezed.dart';
// part 'project.g.dart';

@unfreezed
class Project with _$Project {
  const Project._();

  @Entity(realClass: Project)
  factory Project({
    @Id() @Default(0) int oid,
    required String id,
    required String name,
    required ToOne<ProjectSettings> settings,
    required ToOne<Workspace> workspaceId,
    required ToMany<Space> spaces,
    required ToMany<Task> tasks,
    required ToMany<User> users,
  }) = _Project;

  // factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);
}

@unfreezed
class ProjectSettings with _$ProjectSettings {
  const ProjectSettings._();

  @Entity(realClass: ProjectSettings)
  factory ProjectSettings({
    @Id() @Default(0) int oid,
    required String id,
    String? localId,
  }) = _ProjectSettings;

  // factory ProjectSettings.fromJson(Map<String, dynamic> json) => _$ProjectSettingsFromJson(json);
}
