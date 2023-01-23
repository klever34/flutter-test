import 'package:freebank/example/app/feature/weather/data/model/temperature.gen.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.gen.g.dart';

enum WeatherCondition {
  clear,
  rainy,
  cloudy,
  snowy,
  unknown,
}

@JsonSerializable()
class Weather {
  const Weather({
    required this.lastUpdated,
    required this.location,
    required this.temperature,
    required this.condition,
  });

  factory Weather.empty() {
    return Weather(
      condition: WeatherCondition.unknown,
      lastUpdated: DateTime(0),
      temperature: const Temperature(value: 0),
      location: '--',
    );
  }

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  final String location;
  final WeatherCondition condition;
  final DateTime lastUpdated;
  final Temperature temperature;

  Weather copyWith({
    WeatherCondition? condition,
    DateTime? lastUpdated,
    String? location,
    Temperature? temperature,
  }) {
    return Weather(
      condition: condition ?? this.condition,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      location: location ?? this.location,
      temperature: temperature ?? this.temperature,
    );
  }
}

extension WeatherIntX on int {
  WeatherCondition get toCondition {
    switch (this) {
      case 0:
        return WeatherCondition.clear;
      case 1:
      case 2:
      case 3:
      case 45:
      case 48:
        return WeatherCondition.cloudy;
      case 51:
      case 53:
      case 55:
      case 56:
      case 57:
      case 61:
      case 63:
      case 65:
      case 66:
      case 67:
      case 80:
      case 81:
      case 82:
      case 95:
      case 96:
      case 99:
        return WeatherCondition.rainy;
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        return WeatherCondition.snowy;
      default:
        return WeatherCondition.unknown;
    }
  }
}