// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:rick_and_morty_app/features/characters/presentation/screens/favourites_screen.dart'
    as _i1;
import 'package:rick_and_morty_app/features/characters/presentation/screens/home_screen.dart'
    as _i2;
import 'package:rick_and_morty_app/features/characters/presentation/screens/tabs_screen.dart'
    as _i3;

/// generated route for
/// [_i1.FavouritesScreen]
class FavouritesRoute extends _i4.PageRouteInfo<void> {
  const FavouritesRoute({List<_i4.PageRouteInfo>? children})
    : super(FavouritesRoute.name, initialChildren: children);

  static const String name = 'FavouritesRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.FavouritesScreen();
    },
  );
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.TabsScreen]
class TabsRoute extends _i4.PageRouteInfo<void> {
  const TabsRoute({List<_i4.PageRouteInfo>? children})
    : super(TabsRoute.name, initialChildren: children);

  static const String name = 'TabsRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.TabsScreen();
    },
  );
}
