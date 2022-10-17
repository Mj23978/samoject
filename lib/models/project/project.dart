import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  const Project._();

  const factory Project({
    required String id,
    required String name,
    required ProjectSettings settings,
    String? localId,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);
}

@freezed
class ProjectSettings with _$ProjectSettings {
  const ProjectSettings._();

  const factory ProjectSettings({
    required String id,
    String? localId,
  }) = _ProjectSettings;

  factory ProjectSettings.fromJson(Map<String, dynamic> json) => _$ProjectSettingsFromJson(json);
}
