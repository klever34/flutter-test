import 'package:freebank/core/data/model/app_exception.f.dart';
import 'package:freebank/core/data/model/exception/app_exception_data.dart';
import 'package:freebank/core/data/model/resource.dart';
import 'package:freebank/example/app/feature/weather/data/model/temperature.gen.dart';
import 'package:freebank/example/app/feature/weather/data/model/weather.gen.dart';
import 'package:freebank/example/app/feature/weather/data/remote/weather_api_client.gen.dart';

class WeatherRepository {
  WeatherRepository({required WeatherApiClient apiClient})
      : _apiClient = apiClient;

  final WeatherApiClient _apiClient;
  static const tag = WeatherRepository;

  Future<Resource<Weather, AppException>> getWeather({
    required String city,
  }) async {
    try {
      final locationResponse = await _apiClient.getLocation(city);
      final results = locationResponse.results;
      final weatherResponse = await _apiClient.getWeather(
        results?.first?.latitude ?? 0.0,
        results?.first?.longitude ?? 0.0,
      );

      final currentWeather = weatherResponse.currentWeather;
      final data = Weather(
        temperature: Temperature(value: currentWeather?.temperature ?? 0.0),
        condition: currentWeather?.weatherCode?.toCondition ??
            WeatherCondition.unknown,
        location: results?.first?.name ?? '--',
        lastUpdated: DateTime.now(),
      );

      return Resource.success(data);
    } on Exception catch (ex, st) {
      final exception = AppExceptionFormatter.formatException(
        tag: '$tag',
        exception: ex,
        stackTrace: st,
      );
      return Resource.failure(exception);
    }
  }
}

// Centrally handle the errors return the right exception
// Return a good result object from the repository
// Log errors

// Update the readme to give some explanation:
// Add some links

// Add some tests
// Add unit tests for the api client
// Add unit tests for the repository
// Add unit tests for the
