class FigmaSyncLogger {
  FigmaSyncLogger._();
  static var _logLevel = LogLevel.normal;

  static void log(String message) {
    print(message);
  }

  static void verbose(String message) {
    if (_logLevel == LogLevel.normal) return;
    print(message);
  }

  static void setLogLevel(LogLevel logLevel) {
    _logLevel = logLevel;
  }
}

enum LogLevel {
  verbose,
  normal;
}
