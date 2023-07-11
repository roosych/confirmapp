import 'package:json_annotation/json_annotation.dart';

part 'env_config.g.dart';

@JsonSerializable()
class EnvConfig {
  final Config dev;
  final Config prod;

  const EnvConfig({
    required this.dev,
    required this.prod,
  });

  factory EnvConfig.fromJson(Map<String, dynamic> json) =>
      _$EnvConfigFromJson(json);

  Map<String, dynamic> toJson() => _$EnvConfigToJson(this);

  @override
  String toString() {
    return '{\n'
        ' => dev $dev\n'
        ' => prod $prod\n'
        '}';
  }
}

@JsonSerializable()
class Config {
  @JsonKey(name: 'SERVER_URL', defaultValue: '')
  final String serverUrl;

  const Config({
    required this.serverUrl,
  });

  factory Config.fromJson(Map<String, dynamic> json) =>
      _$ConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigToJson(this);

  @override
  String toString() {
    return '{\n'
        '   => serverUrl = $serverUrl\n'
        '}';
  }
}