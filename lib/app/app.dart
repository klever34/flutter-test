import 'package:flutter/material.dart';
import 'package:freebank/core/l10n/l10n.dart';
import 'package:freebank/core/routing/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      restorationScopeId: 'app',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Hellix',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: const TextStyle(
                fontFamily: 'Hellix',
                fontSize: 18,
                color: Color.fromRGBO(20, 51, 51, 1),
                fontWeight: FontWeight.bold,
              ),
              titleLarge: const TextStyle(
                fontFamily: 'Hellix',
                fontSize: 22,
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleSmall: const TextStyle(
                fontFamily: 'Hellix',
                fontSize: 16,
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
            ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context).counterAppBarTitle,
    );
  }
}
