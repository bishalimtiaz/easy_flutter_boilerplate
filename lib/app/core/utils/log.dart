import 'package:logger/logger.dart';

class Log {
  static final Log _instance = Log._internal();
  late Logger _logger;

  factory Log() {
    return _instance;
  }

  Log._internal() {
    _logger = Logger(
      printer: PrettyPrinter(
          methodCount: 2,
          // number of method calls to be displayed
          errorMethodCount: 8,
          // number of method calls if stacktrace is provided
          lineLength: 120,
          // width of the output
          colors: true,
          // Colorful log messages
          printEmojis: true,
          // Print an emoji for each log message
          printTime: false // Should each log print contain a timestamp
          ),
    );
  }

  static void debug(dynamic message) =>
      _instance._logger.log(Level.debug, message);

  static void info(dynamic message) =>
      _instance._logger.log(Level.info, message);

  static void warning(dynamic message) =>
      _instance._logger.log(Level.warning, message);

  static void error(dynamic message) =>
      _instance._logger.log(Level.error, message);
}
