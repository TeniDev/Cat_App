part of '../main.dart';

Future<void> initConfig() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: colors.primary,
    ),
  );
}

Locale? _localeCallback(locale, supportedLocales) {
  for (final supportedLocale in supportedLocales) {
    if (supportedLocale.languageCode == locale!.languageCode) {
      return supportedLocale;
    }
  }
  return supportedLocales.first;
}

class _AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
