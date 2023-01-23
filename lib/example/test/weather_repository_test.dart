import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freebank/example/app/feature/weather/data/remote/weather_api_client.gen.dart';
import 'package:freebank/example/app/feature/weather/data/repository/weather_repository.dart';
import 'package:freebank/example/test/weather_repository_test.mocks.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks(
    [MockSpec<HttpClientAdapter>(), MockSpec<WeatherApiClient>()])
void main() {
  late WeatherRepository weatherRepository;
  late MockWeatherApiClient weatherApiClient;
  late MockHttpClientAdapter mockHttpClientAdapter;
  late Dio dio;

  setUp(() {
    // arrange
    dio = Dio();
    mockHttpClientAdapter = MockHttpClientAdapter();
    dio.httpClientAdapter = mockHttpClientAdapter;
    weatherApiClient = MockWeatherApiClient();
    weatherRepository = WeatherRepository(apiClient: weatherApiClient);
  });

  group('getWeather', () {
    const city = 'chicago';
    const latitude = 41.85003;
    const longitude = -87.65005;

    test('calls getLocation with correct city', () async {
      try {
        await weatherRepository.getWeather(city: city);
      } catch (_) {}
      verify(weatherApiClient.getLocation(city)).called(1);
    });

    // test('returns a failure when getLocation fails', () async {
    //   when(weatherApiClient.getLocation(any)).thenThrow(
    //     DioError(
    //       requestOptions: RequestOptions(path: ''),
    //     ),
    //   );
    //
    //   final resource = await weatherRepository.getWeather(city: city);
    //   // TODO(obinna): Fix this failing test
    //   expect(
    //     resource.runtimeType,
    //     isA<Failure<Weather, AppException>>(),
    //   );
    // });
  });
}
