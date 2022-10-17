import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../project/project.dart';
import '../space/space.dart';

part 'workspace.freezed.dart';
part 'workspace.g.dart';

@freezed
class Workspace with _$Workspace {
  const Workspace._();

  const factory Workspace({
    required String id,
    required String name,
    @Default([]) List<Project> project,
    @Default([]) List<Space> spaces,
  }) = _Workspace;

  factory Workspace.fromJson(Map<String, dynamic> json) => _$WorkspaceFromJson(json);

}
