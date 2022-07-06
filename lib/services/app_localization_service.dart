import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizationService {
  AppLocalizationService(this.locale);

  final Locale locale;

  static AppLocalizationService of(BuildContext context) {
    return Localizations.of<AppLocalizationService>(
      context,
      AppLocalizationService,
    )!;
  }

  static const LocalizationsDelegate<AppLocalizationService> delegate = _AppLocalizationDelegate();

  late Map<String, dynamic> _localizedStrings;

  Future<void> load() async {
    final jsonString = await rootBundle.loadString('assets/i18n/${locale.languageCode}.json');
    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;

    _localizedStrings = jsonMap.map<String, dynamic>((key, dynamic value) {
      return MapEntry<String, dynamic>(key, value);
    });
  }

  String? translate(String screen, String? key) {
    if (key != null) {
      final returnedScreen = _localizedStrings[screen]! as Map<String, dynamic>;
      final returnedKey = returnedScreen[key] as String?;
      return returnedKey;
    } else {
      return null;
    }
  }
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizationService> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<AppLocalizationService> load(Locale locale) async {
    final localizationService = AppLocalizationService(locale);
    await localizationService.load();
    return localizationService;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizationService> old) => false;
}
