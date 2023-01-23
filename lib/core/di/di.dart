import 'dart:developer';
import 'dart:ui' as ui;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freebank/core/l10n/l10n.dart';
import 'package:freebank/core/l10n/locale_observer.dart';
import 'package:freebank/core/logging/app_logger.dart';
import 'package:sentry_dio/sentry_dio.dart';

//Logging & Monitoring
final appLoggerProvider = Provider((ref) {
  return AppLogger();
});

// Localizations
/// provider used to access the AppLocalizations object outside a build context
final appLocalizationsProvider = Provider<AppLocalizations>((ref) {
  ref.state = lookupAppLocalizations(ui.window.locale);
  final observer = LocaleObserver((locales) {
    ref.state = lookupAppLocalizations(ui.window.locale);
  });
  final binding = WidgetsBinding.instance..addObserver(observer);
  ref.onDispose(() => binding.removeObserver(observer));
  return ref.state;
});

//==============================================================================
// Network
final dioProvider = Provider((ref) {
  final baseOptions = BaseOptions();

  void logger(Object data) {
    ref.read(appLoggerProvider).logInfo(tag: '$Dio', message: data.toString());
  }

  final configuredDio = Dio(baseOptions)
    ..interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: logger,
      )
    ])
    ..addSentry(captureFailedRequests: true);
  return configuredDio;
});
