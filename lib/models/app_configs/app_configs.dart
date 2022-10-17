import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../user/user.dart';

part 'app_configs.freezed.dart';
part 'app_configs.g.dart';

@freezed
class AppConfigs with _$AppConfigs {
  const AppConfigs._();

  @HiveType(typeId: 0, adapterName: 'AppConfigsDB')
  const factory AppConfigs({
    @HiveField(0)
        required String id,
    @HiveField(1)
    @Default(false)
        bool splashShowed,
    @HiveField(2)
    @Default(false)
        bool initialized,
    @JsonKey(
      fromJson: string2Locale,
      toJson: locale2String,
    )
    @HiveField(3)
    @Default(Locale('en', 'EN'))
        Locale locale,
    @HiveField(4)
        User? me,
  }) = _AppConfigs;

  factory AppConfigs.fromJson(Map<String, dynamic> json) =>
      _$AppConfigsFromJson(json);
}

Locale string2Locale(String value) {
  return Locale(value);
}

String locale2String(Locale value) {
  return value.languageCode;
}
