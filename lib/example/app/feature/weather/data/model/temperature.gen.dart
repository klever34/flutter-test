import 'package:json_annotation/json_annotation.dart';

part 'temperature.gen.g.dart';

enum TemperatureUnit { fahrenheit, celsius }

@JsonSerializable()
class Temperature {
  const Temperature({
    required this.value,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);

  final double value;

  Map<String, dynamic> toJson() => _$TemperatureToJson(this);
}

extension TemperatureUnitsX on TemperatureUnit {
  bool get isFahrenheit => this == TemperatureUnit.fahrenheit;

  bool get isCelsius => this == TemperatureUnit.celsius;
}

extension TemperatureConverterX on double {
  double toFahrenheit() => (this * 9 / 5) + 32;

  double toCelsius() => (this - 32) * 5 / 9;
}
