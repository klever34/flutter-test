import 'package:logging/logging.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class AppLogger {
  factory AppLogger() => _instance;

  AppLogger._(){
    _logger = Logger('AppLogger');
  }

  static final AppLogger _instance = AppLogger._();

  late final Logger _logger;

  /// Use this when you want to log an error or exception
  void logError({
    required String tag,
    required String message,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.severe('ERROR: $tag - $message', error, stackTrace);
    Sentry.captureException(error, stackTrace: stackTrace);
  }


  /// Use this when you want to log some information
  void logInfo({
    required String message,
    required String tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.info('INFO: $tag - $message', error, stackTrace);
    Sentry.addBreadcrumb(Breadcrumb(message: message));
  }
}
