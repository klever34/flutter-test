
import 'package:flutter/material.dart';


/// observer used to notify the caller when the locale changes
class LocaleObserver extends WidgetsBindingObserver {
  LocaleObserver(this._didChangeLocales);
  final void Function(List<Locale>? locales) _didChangeLocales;
  @override
  void didChangeLocales(List<Locale>? locales) {
    _didChangeLocales(locales);
  }
}
