import 'package:freezed_annotation/freezed_annotation.dart';

import '../project/project.dart';
import '../user/user.dart';

part 'workspace.freezed.dart';
part 'workspace.g.dart';

@freezed
class Workspace with _$Workspace {
  const Workspace._();

  const factory Workspace({
    required String id,
    required String name,
    required User belongsTo,
    @Default([]) List<Project> projects,
    @Default([]) List<String> projectIds,
  }) = _Workspace;

  factory Workspace.fromJson(Map<String, dynamic> json) => _$WorkspaceFromJson(json);

}
