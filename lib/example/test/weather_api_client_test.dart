import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freebank/example/app/feature/weather/data/remote/response/location_response.gen.dart';
import 'package:freebank/example/app/feature/weather/data/remote/response/weather_response.gen.dart';
import 'package:freebank/example/app/feature/weather/data/remote/weather_api_client.gen.dart';
import 'package:freebank/example/test/weather_api_client_test.mocks.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<HttpClientAdapter>()])
void main() {
  late WeatherApiClient weatherApiClient;
  late MockHttpClientAdapter mockHttpClientAdapter;
  late Dio dio;

  setUp(() {
    // arrange
    dio = Dio();
    mockHttpClientAdapter = MockHttpClientAdapter();
    dio.httpClientAdapter = mockHttpClientAdapter;
    weatherApiClient = WeatherApiClient(dio);
  });

  group('WeatherApiClient', () {
    group('getWeather', () {
      test('is called only once', () async {
        //arrange
        final responseBody = ResponseBody.fromString(
          jsonEncode(dummyWeatherResponse),
          200,
          headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType]
          },
        );
        when(mockHttpClientAdapter.fetch(any, any, any))
            .thenAnswer((_) async => responseBody);

        //act
        await weatherApiClient.getWeather(0, 0);

        // assert
        verify(mockHttpClientAdapter.fetch(any, any, any)).called(1);
      });

      test('returns a weather response on valid response', () async {
        //arrange
        final responseBody = ResponseBody.fromString(
          jsonEncode(dummyWeatherResponse),
          200,
          headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType]
          },
        );

        when(mockHttpClientAdapter.fetch(any, any, any))
            .thenAnswer((_) async => responseBody);

        //act
        final response = await weatherApiClient.getWeather(0, 0);

        // assert
        expect(
          response,
          isA<WeatherResponse>()
              .having((w) => w.currentWeather?.weatherCode, 'weatherCode', 3)
              .having((w) => w.currentWeather?.temperature, 'temperature', 2.1),
        );
      });

      test('returns null values for missing fields in json response', () async {
        //arrange
        final responseBody = ResponseBody.fromString(
          jsonEncode({}),
          200,
          headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType]
          },
        );

        when(mockHttpClientAdapter.fetch(any, any, any))
            .thenAnswer((_) async => responseBody);

        //act
        final response = await weatherApiClient.getWeather(0, 0);

        // assert
        expect(
          response,
          isA<WeatherResponse>()
              .having((w) => w.currentWeather?.weatherCode, 'weatherCode', null)
              .having(
                (w) => w.currentWeather?.temperature,
                'temperature',
                null,
              ),
        );
      });

      test('throws a dio error with type response for non-200 responses', () async {
        //arrange
        final responseBody = ResponseBody.fromString(
          jsonEncode({}),
          300,
          headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType]
          },
        );

        when(mockHttpClientAdapter.fetch(any, any, any))
            .thenAnswer((_) async => responseBody);

        // assert
        expect(
          weatherApiClient.getWeather(0, 0),
          throwsA(isA<DioError>()
              .having((e) => e.type, 'response type', DioErrorType.response)
              .having((e) => e.response?.statusCode, 'status code', greaterThanOrEqualTo(300)),
          ),
        );
      });
    });

    group('getLocation', () {
      test('is called only once', () async {
        //arrange
        final responseBody = ResponseBody.fromString(
          jsonEncode(dummyWeatherResponse),
          200,
          headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType]
          },
        );
        when(mockHttpClientAdapter.fetch(any, any, any))
            .thenAnswer((_) async => responseBody);

        //act
        await weatherApiClient.getLocation('');

        // assert
        verify(mockHttpClientAdapter.fetch(any, any, any)).called(1);
      });

      test('returns a location response on valid response', () async {
        //arrange
        final responseBody = ResponseBody.fromString(
          jsonEncode(dummyLocationResponse),
          200,
          headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType]
          },
        );

        when(mockHttpClientAdapter.fetch(any, any, any))
            .thenAnswer((_) async => responseBody);

        //act
        final response = await weatherApiClient.getLocation('');

        // assert
        expect(
          response,
          isA<LocationResponse>()
              .having((l) => l.results?.first?.name, 'name', 'Chicago')
              .having((l) => l.results?.first?.id, 'id', 4887398)
              .having((l) => l.results?.first?.latitude, 'latitude', 41.85003)
              .having((l) => l.results?.first?.longitude, 'longitude', -87.65005),
        );
      });

      test('returns null values for missing fields in json response', () async {
        //arrange
        final responseBody = ResponseBody.fromString(
          jsonEncode({}),
          200,
          headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType]
          },
        );

        when(mockHttpClientAdapter.fetch(any, any, any))
            .thenAnswer((_) async => responseBody);

        //act
        final response = await weatherApiClient.getLocation('');

        // assert
        expect(
          response,
          isA<LocationResponse>()
              .having((l) => l.results?.first?.latitude, 'latitude', null)
              .having((l) => l.results?.first?.longitude, 'longitude', null),
        );
      });

      test('throws a dio error with type response for non-200 responses', () async {
        //arrange
        final responseBody = ResponseBody.fromString(
          jsonEncode({}),
          300,
          headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType]
          },
        );

        when(mockHttpClientAdapter.fetch(any, any, any))
            .thenAnswer((_) async => responseBody);

        // assert
        expect(
          weatherApiClient.getLocation(''),
          throwsA(isA<DioError>()
              .having((e) => e.type, 'response type', DioErrorType.response)
              .having((e) => e.response?.statusCode, 'status code', greaterThanOrEqualTo(300)),
          ),
        );
      });
    });
  });
}

const dummyLocationResponse = {
  'results': [
    {
      'id': 4887398,
      'name': 'Chicago',
      'latitude': 41.85003,
      'longitude': -87.65005
    }
  ]
};

const dummyWeatherResponse = {
  'latitude': 43.037556,
  'longitude': -87.923645,
  'generationtime_ms': 0.4429817199707031,
  'utc_offset_seconds': 0,
  'timezone': 'GMT',
  'timezone_abbreviation': 'GMT',
  'elevation': 189,
  'current_weather': {
    'temperature': 2.1,
    'windspeed': 19,
    'winddirection': 153,
    'weathercode': 3,
    'time': '2023-01-16T00:00'
  }
};
