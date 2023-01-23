import 'package:dio/dio.dart' hide Headers;
import 'package:freebank/example/app/feature/weather/data/remote/response/location_response.gen.dart';
import 'package:freebank/example/app/feature/weather/data/remote/response/weather_response.gen.dart';
import 'package:retrofit/retrofit.dart';

part 'weather_api_client.gen.g.dart';

@RestApi()
abstract class WeatherApiClient {
  factory WeatherApiClient(Dio dio, {String baseUrl}) =
      _WeatherApiClient;

  @GET('https://api.open-meteo.com/v1/forecast')
  Future<WeatherResponse> getWeather(
    @Query('latitude') double latitude,
    @Query('longitude') double longitude, {
    @Query('current_weather') String currentWeather = 'true',
  });

  @GET('https://geocoding-api.open-meteo.com/v1/search')
  Future<LocationResponse> getLocation(
    @Query('name') String city, {
    @Query('count') String count = '1',
  });
}
