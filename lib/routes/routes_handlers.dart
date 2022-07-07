import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:cat_app/models/cat_model.dart';

import 'package:cat_app/ui/pages/home_page.dart';
import 'package:cat_app/ui/pages/detail_page.dart';

Widget homePageBuilder(BuildContext context, GoRouterState state) {
  return const HomePage();
}

Widget detailPageBuilder(BuildContext context, GoRouterState state) {
  return DetailPage(
    catInfo: state.extra! as Cat,
  );
}

Widget notFoundPage(BuildContext context, GoRouterState state) {
  return Container();
}
