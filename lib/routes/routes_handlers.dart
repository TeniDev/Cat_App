import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:cat_app/ui/pages/home_page.dart';

Widget homePageBuilder(BuildContext context, GoRouterState state) {
  return const HomePage();
}

Widget notFoundPage(BuildContext context, GoRouterState state) {
  return Container();
}
