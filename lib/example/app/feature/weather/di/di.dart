import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freebank/core/di/di.dart';
import 'package:freebank/core/environment_config/app_environment_config.dart';
import 'package:freebank/example/app/feature/weather/ui/view_model/weather_ui_state.f.dart';

import '../data/remote/weather_api_client.gen.dart';
import '../data/repository/weather_repository.dart';
import '../ui/view_model/weather_view_model.dart';


// WeatherApi Client
final weatherApiClientProvider = Provider((ref) {
  final dio = ref.read(dioProvider);
  return WeatherApiClient(dio, baseUrl: AppEnvironmentConfig.baseUrl);
});

// Weather Repository
final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  final apiClient = ref.read(weatherApiClientProvider);
  return WeatherRepository(apiClient: apiClient);
});

// Weather ViewModel
final weatherViewModelProvider =
StateNotifierProvider<WeatherViewModel, WeatherUiState>((ref) {
  final weatherRepository = ref.read(weatherRepositoryProvider);
  return WeatherViewModel(weatherRepository: weatherRepository);
});
