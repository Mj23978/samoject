import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

import '../user/user.dart';

part 'configs.freezed.dart';
// part 'configs.g.dart';

@unfreezed
class AppConfigs with _$AppConfigs {
  const AppConfigs._();

  @Entity(realClass: AppConfigs)
  factory AppConfigs({
    @Id() @Default(0) int oid,
    @Default(false) bool initialized,
    @Default(false) bool showSplash,
    required ToOne<User> me,
  }) = _AppConfigs;

  // factory AppConfigs.fromJson(Map<String, dynamic> json) =>
  //     _$AppConfigsFromJson(json);
}
