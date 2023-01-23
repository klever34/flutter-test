import 'package:json_annotation/json_annotation.dart';

part 'weather_response.gen.g.dart';

@JsonSerializable()
class WeatherResponse {
  const WeatherResponse({
    required this.currentWeather,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);

  @JsonKey(name: 'current_weather')
  final CurrentWeather? currentWeather;
}

@JsonSerializable()
class CurrentWeather {
  CurrentWeather({
    required this.temperature,
    required this.weatherCode,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);

  final double? temperature;
  @JsonKey(name: 'weathercode')
  final int? weatherCode;
}

enum WeatherCondition {
  clear,
  rainy,
  cloudy,
  snowy,
  unknown,
}
