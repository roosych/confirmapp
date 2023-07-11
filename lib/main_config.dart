import 'dart:ui';

class MainConfig {
  static const env = String.fromEnvironment('env', defaultValue: 'dev');

  static const localeRu = Locale.fromSubtags(languageCode: 'ru');
  static const localeAz = Locale.fromSubtags(languageCode: 'az');

  static const tokenKey = 'dafveb4wfvcw';
}