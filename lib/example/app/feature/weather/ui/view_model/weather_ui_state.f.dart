import 'package:flutter/foundation.dart';
import 'package:freebank/example/app/feature/weather/data/model/temperature.gen.dart';
import 'package:freebank/example/app/feature/weather/data/model/weather.gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_ui_state.f.freezed.dart';

@freezed
class WeatherUiState with _$WeatherUiState {
  const factory WeatherUiState.initial() = Initial;

  const factory WeatherUiState.loading() = Loading;

  const factory WeatherUiState.success({
    required Weather weather,
    required TemperatureUnit temperatureUnit,
  }) = Success;

  const factory WeatherUiState.failure([String? message]) = Failure;
}

extension WeatherUiStateX on WeatherUiState {
  bool get isInitial => this is Initial;
  bool get isLoading => this is Loading;
  bool get isSuccess => this is Success;
  bool get isFailure => this is Failure;
}
