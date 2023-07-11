// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnvConfig _$EnvConfigFromJson(Map<String, dynamic> json) => EnvConfig(
      dev: Config.fromJson(json['dev'] as Map<String, dynamic>),
      prod: Config.fromJson(json['prod'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EnvConfigToJson(EnvConfig instance) => <String, dynamic>{
      'dev': instance.dev,
      'prod': instance.prod,
    };

Config _$ConfigFromJson(Map<String, dynamic> json) => Config(
      serverUrl: json['SERVER_URL'] as String? ?? '',
    );

Map<String, dynamic> _$ConfigToJson(Config instance) => <String, dynamic>{
      'SERVER_URL': instance.serverUrl,
    };
