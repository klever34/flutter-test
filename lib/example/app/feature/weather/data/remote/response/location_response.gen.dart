import 'package:json_annotation/json_annotation.dart';

part 'location_response.gen.g.dart';

@JsonSerializable()
class LocationResponse {
  LocationResponse({
    this.results,
    this.generationtimeMs,
  });

  factory LocationResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationResponseFromJson(json);

  final List<Result?>? results;
  final double? generationtimeMs;
}

@JsonSerializable()
class Result {
  Result({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  final int? id;
  final String? name;
  final double? latitude;
  final double? longitude;
}
