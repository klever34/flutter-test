import 'package:flutter_dotenv/flutter_dotenv.dart';

enum AppEnvironment { feature, test, prod }

class AppEnvironmentConfig {
  AppEnvironmentConfig._();

  static bool get isFeature => environment == AppEnvironment.feature.name;

  static bool get isTest => environment == AppEnvironment.test.name;

  static bool get isProd => environment == AppEnvironment.prod.name;
  static String environment = dotenv.env['environment'] ?? '';

  static String get sentryDsn => dotenv.env['sentryDsn'] ?? '';

  static String get baseUrl => dotenv.env['apiBaseUrl'] ?? '';
}
