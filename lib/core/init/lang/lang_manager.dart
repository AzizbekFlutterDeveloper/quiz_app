import 'package:flutter/material.dart';

class LanguageManager {
  static LanguageManager? _instance;
  static LanguageManager get instance {
    _instance ??= LanguageManager._init();
    return _instance!;
  }

  LanguageManager._init();

  final uzLocale = const Locale("uz","UZ");
  final enLocale = const Locale("en","US");
  final ruLocale = const Locale("ru","RU");

  List<Locale> get suppprtedLocales => [
        uzLocale,
        enLocale,
        ruLocale,
      ];
}
