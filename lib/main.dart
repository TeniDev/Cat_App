import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:cat_app/routes/router.dart';
import 'package:cat_app/services/services.dart';
import 'package:cat_app/utils/utils.dart';

part './config/app_config.dart';

Future<void> main() async {
  await initConfig();
  runApp(const ProviderScope(child: CatApp()));
}

class CatApp extends StatelessWidget {
  const CatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Cat App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: colors.white,
      ),
      localizationsDelegates: const [
        AppLocalizationService.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
      ],
      localeResolutionCallback: _localeCallback,
      routeInformationProvider: RouterConfig.router.routeInformationProvider,
      routeInformationParser: RouterConfig.router.routeInformationParser,
      routerDelegate: RouterConfig.router.routerDelegate,
      scrollBehavior: _AppScrollBehavior(),
    );
  }
}
