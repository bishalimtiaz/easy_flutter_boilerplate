import 'package:logger/logger.dart';

class Log {
  static final Log _instance = Log._internal();
  late final Logger _prettyLogger;
  late final Logger _logger;

  factory Log() {
    return _instance;
  }

  Log._internal() {
    _prettyLogger = Logger(
      printer: PrettyPrinter(
        stackTraceBeginIndex: 1,
        methodCount: 8,
        // number of method calls to be displayed
        errorMethodCount: 8,
        // number of method calls if stacktrace is provided
        lineLength: 120,
        // width of the output
        colors: true,
        // Colorful log messages
        printEmojis: true,
        // Print an emoji for each log message
        dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart, // Should each log print contain a timestamp
      ),
    );
    _logger = Logger(
      printer: PrettyPrinter(
        methodCount: 0,
      ),
    );
  }

  static void debug(dynamic message) =>
      _instance._prettyLogger.log(Level.debug, message);

  static void info(dynamic message) =>
      _instance._prettyLogger.log(Level.info, message);

  static void print(dynamic message) {
    _instance._logger.log(Level.info, message);
  }

  static void warning(dynamic message) =>
      _instance._prettyLogger.log(Level.warning, message);

  static void error(dynamic message) =>
      _instance._prettyLogger.log(Level.error, message);
}
