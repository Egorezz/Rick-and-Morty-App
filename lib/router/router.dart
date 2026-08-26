import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: TabsRoute.page,
      initial: true,
      children: [
        AutoRoute(page: MainRoute.page),
        AutoRoute(page: FavouritesRoute.page),
      ],
    ),
  ];
}
