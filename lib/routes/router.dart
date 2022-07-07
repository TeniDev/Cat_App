import 'package:go_router/go_router.dart';

import 'routes_handlers.dart';

class RouterConfig {
  static final GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: <GoRoute>[
      GoRoute(
        path: '/home',
        builder: homePageBuilder,
      ),
      GoRoute(
        path: '/detail/:cat',
        builder: detailPageBuilder,
      ),
    ],
    urlPathStrategy: UrlPathStrategy.path,
  );
}
