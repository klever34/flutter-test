import 'package:flutter_test/flutter_test.dart';
import 'package:freebank/example/app/feature/weather/data/remote/response/location_response.gen.dart';

void main() {
  group(
    'Location', () {
      group('fromJson', () {
        test('returns correct Location object', () {
          final json = <String, dynamic>{
            'results': [
              {
                'id': 4887398,
                'name': 'Chicago',
                'latitude': 41.85003,
                'longitude': -87.65005,
              },
            ],
            'generationtimeMs': 4.99
          };
          final location = LocationResponse.fromJson(json);
          expect(location,
            isA<LocationResponse>().having(
              (response) => response.results?.first?.id,
              'id',
              4887398,
            ),
          );
        });
      });
    },
  );
}
