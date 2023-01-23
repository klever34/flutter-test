import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freebank/core/logging/app_logger.dart';

class ProviderLogger extends ProviderObserver {
  ProviderLogger({
    required AppLogger appLogger,
  }) : _logger = appLogger;

  final AppLogger _logger;

  @override
  void didAddProvider(
    ProviderBase<dynamic> provider,
    Object? value,
    ProviderContainer container,
  ) {
    // TODO(Obinna): implement this logger.
  }

  @override
  void providerDidFail(
    ProviderBase<dynamic> provider,
    Object? error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    // TODO(Obinna): implement this logger.
  }

  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    // TODO(Obinna): log

    final tag = provider.name ?? provider.runtimeType;
    _logger
    ..logInfo(tag: '$tag', message: 'previousValue: $previousValue')
    ..logInfo(tag: '$tag', message: 'newValue: $newValue');
  }

  @override
  void didDisposeProvider(
    ProviderBase<dynamic> provider,
    ProviderContainer container,
  ) {
    // TODO(Obinna): implement this logger.
  }
}
