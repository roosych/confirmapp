// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:logging/logging.dart';

setupLogger({Level level = Level.OFF}) {
  Logger.root.level = level;
  if (level == Level.OFF) {
    return;
  }
  Logger.root.onRecord.listen((record) async {
    print('${record.loggerName}: ${record.time}: ${record.message}');
    if (record.error != null) {
      print('${record.loggerName}: ${record.time}: ${record.error}');
    }
    if (record.stackTrace != null) {
      print('${record.loggerName}: ${record.time}: ${record.stackTrace}');
    }
  });
}

Logger getLogger(Type type) => Logger(type.toString());
