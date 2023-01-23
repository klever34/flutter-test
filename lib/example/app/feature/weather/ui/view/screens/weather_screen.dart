import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freebank/core/design_system/app_colors.dart';
import 'package:freebank/example/app/feature/weather/di/di.dart';
import 'package:freebank/example/app/feature/weather/ui/view/screens/weather_search_screen.dart';
import 'package:freebank/example/app/feature/weather/ui/view/widgets/weather_empty.dart';
import 'package:freebank/example/app/feature/weather/ui/view/widgets/weather_error.dart';
import 'package:freebank/example/app/feature/weather/ui/view/widgets/weather_loading.dart';
import 'package:freebank/example/app/feature/weather/ui/view/widgets/weather_success.dart';
import 'package:freebank/example/app/feature/weather/ui/view_model/weather_ui_state.f.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Handle UI logic like navigation, showing dialogs, and other stuff doesn't relate to showing the ui
    ref.listen(weatherViewModelProvider, (previousState, currentState) {
      if (currentState.isSuccess) {
        // Do something here

      }
    });

    final uiState = ref.watch(weatherViewModelProvider);
    final ui = uiState.when(
      initial: () => const WeatherEmpty(),
      loading: () => const WeatherLoading(),
      success: (weather, temperatureUnit) => WeatherSuccess(
        weather: weather,
        unit: temperatureUnit,
        onRefresh: () async {},
      ),
      failure: (errorMessage) => const WeatherError(),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: const Text('Text'),
              onFocusChange: (bool value) {},
              onHover: (bool value) {},
              onPressed: () {},
              onLongPress: () {},
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.hovered)) {
                    return AppColors.primaryColor;
                  }
                  if (states.contains(MaterialState.pressed) ||
                      states.contains(MaterialState.focused)) {

                  }
                  return null;
                }),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search, semanticLabel: 'Search'),
        onPressed: () async {
          final city = await Navigator.push<String>(
            context,
            MaterialPageRoute(
              builder: (context) => const WeatherSearchScreen(),
            ),
          );
          await ref.read(weatherViewModelProvider.notifier).fetchWeather(city);
        },
      ),
    );
  }
}
