import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:test_app_v2/src/utilities/global_var.dart';
import '../../../generated/locale_base.dart';

class LocalDelegate extends LocalizationsDelegate<LocaleBase> {
  const LocalDelegate();
  static const idMap = {
    'ar': 'locales/ar.json',
    'en': 'locales/en.json',
  };

  static const Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    LocalDelegate(),
    GlobalCupertinoLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  // Returns a locale which will be used by the app
  static Locale? localeResolutionCallback(Locale? local, Iterable<Locale> supportedLocales) {
    // AppStateManager appStateManager = locator<AppStateManager>();
    // if (appStateManager.appLanguage.isNotEmpty) {
    //   for (var supportedLocale in supportedLocales) {
    //     if (supportedLocale.languageCode == appStateManager.appLanguage) return supportedLocale;
    //   }
    // }
    // If the locale of the device is not supported, use the first one
    // from the list (English, in this case).
    return supportedLocales.last;
  }

  // List all of the app's supported locales here
  static const supportedLocales = [
    Locale('ar'),
    Locale('en'),
  ];

  @override
  bool isSupported(Locale locale) => ['ar', 'en'].contains(locale.languageCode);

  @override
  Future<LocaleBase> load(Locale locale) async {
    var lang = 'en';
    if (isSupported(locale)) lang = locale.languageCode;
    final loc = LocaleBase();
    try {
      await loc.load(idMap[lang] ?? lang);
    } catch (err) {
      GlobalVar.log(err.toString());
      lang = 'en';
      await loc.load(idMap[lang] ?? lang);
    }
    return loc;
  }

  @override
  bool shouldReload(LocalDelegate old) => true;
}
