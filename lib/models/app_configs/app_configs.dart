import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../user/user.dart';

part 'app_configs.freezed.dart';
part 'app_configs.g.dart';

@freezed
class AppConfigs with _$AppConfigs {
  const AppConfigs._();

  const factory AppConfigs({
    @Default(false) bool splashShowed,
    @Default(false) bool initialized,
    @Default(Locale('en', 'EN')) Locale locale,
    User? me,
  }) = _AppConfigs;

  factory AppConfigs.fromJson(Map<String, dynamic> json) =>
      _$AppConfigsFromJson(json);
}
