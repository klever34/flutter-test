import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freebank/app/app.dart';
import 'package:freebank/app/feature/notifications/data/notification_repository.dart';
import 'package:freebank/core/environment_config/app_environment_config.dart';
import 'package:freebank/core/logging/app_logger.dart';
import 'package:freebank/core/logging/provider_logger.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sentry_logging/sentry_logging.dart';

void main() async {
  await _setupApp();
}

Future<void> _setupApp() async {
  await dotenv.load();
  await SentryFlutter.init(
    _configureSentryOptions,
    appRunner: () async => _startApp(),
  );
  // Do other config stuff here...
}

Future<void> _startApp() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  unawaited(NotificationRepository().init());
  _registerUiErrorHandler();

  final providerOverrides = <Override>[];
  final providerObservers = <ProviderObserver>[
    ProviderLogger(
      appLogger: AppLogger(),
    )
  ];

  await Future.delayed(const Duration(seconds: 3), FlutterNativeSplash.remove);

  runApp(
    DefaultAssetBundle(
      bundle: SentryAssetBundle(),
      child: ProviderScope(
        overrides: providerOverrides,
        observers: providerObservers,
        child: const App(),
      ),
    ),
  );
}

Future<void> _configureSentryOptions(SentryFlutterOptions sentryOptions) async {
  sentryOptions
    ..environment = AppEnvironmentConfig.environment
    ..dsn = AppEnvironmentConfig.sentryDsn
    ..addIntegration(LoggingIntegration())
    // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
    // We recommend adjusting this value in production.
    ..tracesSampleRate = 1.0;
}

void _registerUiErrorHandler({AppLogger? errorLogger}) {
  // Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('An error occurred'),
      ),
      body: Center(child: Text(details.toString())),
    );
  };
}
