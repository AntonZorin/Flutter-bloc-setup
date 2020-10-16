import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
/*
Create localized json files aka en.json, ru.json etc;
In method provideLangPath return valid path to resources aka'lang/${locale.languageCode}.json';
Use extension getString(key) in Widgets to get localized string;
*/

class AppLocalizations extends _LocalePathProvider {
  final Locale locale;

  AppLocalizations(this.locale);

  // Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  Map<String, String> _localizedStrings;

  // Load the language JSON file from the "lang" folder
  Future<bool> load() async {
    String jsonString = await rootBundle.loadString(provideLangPath(locale));
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  @override
  String provideLangPath(Locale locale) {
    return 'lang/${locale.languageCode}.json';
  }

  // List all of the app's supported locales here
  static const supportedLocales = [Locale('en', 'US'), Locale('ru', 'RU')];

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  // This method will be called from every widget which needs a localized text
  String translate(String key) {
    var result = _localizedStrings[key];
    if (result == null) {
      throw Exception("String res with key $key not found.");
    }
    return result;
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en', 'ru'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    AppLocalizations localizations = new AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

abstract class _LocalePathProvider {
  String provideLangPath(Locale locale);
}

extension GetLocalizedString on BuildContext {
  getString(String key) {
    return AppLocalizations.of(this).translate(key);
  }
}
