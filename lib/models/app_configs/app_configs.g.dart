// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_configs.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppConfigsDB extends TypeAdapter<_$_AppConfigs> {
  @override
  final int typeId = 0;

  @override
  _$_AppConfigs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_AppConfigs(
      id: fields[0] as String,
      splashShowed: fields[1] as bool,
      initialized: fields[2] as bool,
      locale: fields[3] as Locale,
      me: fields[4] as User?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_AppConfigs obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.splashShowed)
      ..writeByte(2)
      ..write(obj.initialized)
      ..writeByte(3)
      ..write(obj.locale)
      ..writeByte(4)
      ..write(obj.me);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppConfigsDB &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppConfigs _$$_AppConfigsFromJson(Map<String, dynamic> json) =>
    _$_AppConfigs(
      id: json['id'] as String,
      splashShowed: json['splashShowed'] as bool? ?? false,
      initialized: json['initialized'] as bool? ?? false,
      locale: json['locale'] == null
          ? const Locale('en', 'EN')
          : string2Locale(json['locale'] as String),
      me: json['me'] == null
          ? null
          : User.fromJson(json['me'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AppConfigsToJson(_$_AppConfigs instance) =>
    <String, dynamic>{
      'id': instance.id,
      'splashShowed': instance.splashShowed,
      'initialized': instance.initialized,
      'locale': locale2String(instance.locale),
      'me': instance.me,
    };
