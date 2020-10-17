import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_setup_app/common/navigator.dart';
import 'package:flutter_setup_app/cubit/home/home_cubit.dart';
import 'package:flutter_setup_app/di/dependency_container.dart';
import 'package:flutter_setup_app/pages/home/home_page.dart';

import '../di/dependency_container.dart' as diFactory;
import '../locale/app_localization.dart';

void main() async {
  //init dependency injection
  await diFactory.init();
  //init routes
  AppRouter.createRoutes();
  //launch app
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: Colors.deepOrange),

      // List all of the app's supported locales here
      supportedLocales: AppLocalizations.supportedLocales,

      // These delegates make sure that the localization data for the proper language is loaded
      localizationsDelegates: [
        // A class which loads the translations from JSON files
        AppLocalizations.delegate,
        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
      ],

      // Returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return supportedLocales.first;
      },
      navigatorKey: AppRouter.instance.navigatorKey,
      onGenerateRoute: AppRouter.instance.generator(),
      home: BlocProvider(
        create: (context) => di<HomeCubit>(),
        child: HomePage(),
      ),
    );
  }
}
