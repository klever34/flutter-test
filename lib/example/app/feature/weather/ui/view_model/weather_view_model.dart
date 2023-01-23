import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freebank/core/data/model/app_exception.f.dart';
import 'package:freebank/core/data/model/exception/app_exception_data.dart';
import 'package:freebank/example/app/feature/weather/data/model/temperature.gen.dart';
import 'package:freebank/example/app/feature/weather/data/model/weather.gen.dart';
import 'package:freebank/example/app/feature/weather/data/repository/weather_repository.dart';
import 'package:freebank/example/app/feature/weather/ui/view_model/weather_ui_state.f.dart';

class WeatherViewModel extends StateNotifier<WeatherUiState> {
  WeatherViewModel({
    required WeatherRepository weatherRepository,
  })  : _weatherRepository = weatherRepository,
        super(const WeatherUiState.initial());

  final WeatherRepository _weatherRepository;

  Future<void> fetchWeather(String? city) async {
    if (city == null || city.isEmpty) {
      return;
    }

    state = const WeatherUiState.loading();
    final weatherResult = await _weatherRepository.getWeather(city: city);

    weatherResult.when(
      onSuccess: (Weather weather) {
        return state = WeatherUiState.success(
          weather: weather,
          temperatureUnit: TemperatureUnit.celsius,
        );
      },
      onFailure: (AppException exception) {
        return state = WeatherUiState.failure(exception.details.message);
      },
    );
  }

  Future<void> refreshWeather() async {
    if (!state.isSuccess) {
      return;
    }

    final currentState = state as Success;
    final currentLocation = currentState.weather.location;
    final currentTempUnit = currentState.temperatureUnit;

    final weatherResult = await _weatherRepository.getWeather(
      city: currentLocation,
    );

    weatherResult.when(
      onSuccess: (Weather weather) {
        return state = WeatherUiState.success(
          weather: Weather.empty(),
          temperatureUnit: currentTempUnit,
        );
      },
      onFailure: (AppException exception) {
        return WeatherUiState.failure(exception.details.message);
      },
    );
  }
}
