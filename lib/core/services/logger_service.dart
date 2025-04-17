import 'package:logger/logger.dart';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

final logger = Logger(
  filter: MyFilter(),
  printer: MyPrinter(),
  output: ConsoleOutput(),
);

class MyFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) => kDebugMode;
}

class MyPrinter extends LogPrinter {
  static final levelPrefixes = {
    Level.trace: '[TRACE]',
    Level.debug: '[DEBUG]',
    Level.info: '[INFO]',
    Level.warning: '[WARNING]',
    Level.error: '[ERROR]',
    Level.fatal: '[FATAL]',
  };

  static final levelColors = {
    Level.trace: AnsiColor.none(),
    Level.debug: AnsiColor.fg(8),
    Level.info: AnsiColor.fg(12),
    Level.warning: AnsiColor.fg(208),
    Level.error: AnsiColor.fg(196),
    Level.fatal: AnsiColor.fg(199),
  };

  final DateFormat _timeFormat = DateFormat.Hms();

  @override
  List<String> log(LogEvent event) {
    final prefix = levelPrefixes[event.level] ?? '[LOG]';
    final color = levelColors[event.level] ?? AnsiColor.none();
    final time = _timeFormat.format(DateTime.now());

    final message = '$time $prefix ${event.message}';
    final colored = color(message);

    final output = <String>[colored];

    if (event.error != null) {
      output.add(color('⚠️ ERROR: ${event.error}'));
    }

    if (event.stackTrace != null) {
      output.add(color('📍 STACK TRACE:\n${event.stackTrace}'));
    }

    return output;
  }
}

class ConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    for (var line in event.lines) {
      debugPrint(line);
    }
  }
}
