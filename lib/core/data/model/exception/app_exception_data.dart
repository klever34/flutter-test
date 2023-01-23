import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freebank/core/data/model/app_exception.f.dart';
import 'package:freebank/core/logging/app_logger.dart';

class AppExceptionData {
  AppExceptionData({
    required this.code,
    required this.message,
  });

  final String code;
  final String message;

  @override
  String toString() {
    return 'AppExceptionData (code: $code, message: $message)';
  }
}

extension AppExceptionDetailsX on AppException {
  AppExceptionData get details {
    return when(
      requestTimeOut: () {
        return AppExceptionData(
          code: '--',
          message: 'Please check your internet and retry',
        );
      },
      generic: () {
        return AppExceptionData(
          code: '--',
          message: 'Oops an error occurred',
        );
      },
    );
  }
}

class AppExceptionFormatter {
  static AppException formatException({
    required String tag,
    required Exception exception,
    StackTrace? stackTrace,
  }) {
    AppLogger().logError(
      tag: tag,
      message: 'An error occurred',
      error: exception,
      stackTrace: stackTrace,
    );
    if (exception is DioError) {
      return _formatDioError(exception);
    }

    // Handle other exceptions here...
    return const AppException.requestTimeOut();
  }

  static AppException _formatDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return const AppException.requestTimeOut();
      case DioErrorType.response:
      case DioErrorType.cancel:
        return const AppException.requestTimeOut();
      case DioErrorType.other:
        final error = dioError.error;
        if (error is SocketException) {
          return const AppException.requestTimeOut();
        }
        return const AppException.requestTimeOut();
    }
  }
}
