part of glue_core;

class Logger {
  static logger.Logger _logger = logger.Logger();

  static void log(LogLevel level, message, [error, StackTrace? stackTrace]) {
    _logger.log(logger.Level.values[level.index], message);
  }

  static void debug(message, [error, StackTrace? stackTrace]) {
    _logger.d(message, error, stackTrace);
  }

  static void error(message, [error, StackTrace? stackTrace]) {
    _logger.e(message, error, stackTrace);
  }

  static void info(message, [error, StackTrace? stackTrace]) {
    _logger.i(message, error, stackTrace);
  }

  static void verbose(message, [error, StackTrace? stackTrace]) {
    _logger.v(message, error, stackTrace);
  }

  static void warning(message, [error, StackTrace? stackTrace]) {
    _logger.w(message, error, stackTrace);
  }

  static void wtf(message, [error, StackTrace? stackTrace]) {
    _logger.wtf(message, error, stackTrace);
  }

  static void mute() {
    _logger = logger.Logger(level: logger.Level.nothing);
  }

  static void unmute() {
    _logger = logger.Logger();
  }

  static void level(LogLevel level) {
    _logger = logger.Logger(level: logger.Level.values[level.index]);
  }
}
