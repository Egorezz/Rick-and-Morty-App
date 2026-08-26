// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/foundation.dart' as _i6;
import 'package:rick_and_morty_app/features/characters/domain/entities/character.dart'
    as _i7;
import 'package:rick_and_morty_app/features/characters/presentation/screens/characer_details_screen.dart'
    as _i1;
import 'package:rick_and_morty_app/features/characters/presentation/screens/favourites_screen.dart'
    as _i2;
import 'package:rick_and_morty_app/features/characters/presentation/screens/home_screen.dart'
    as _i3;
import 'package:rick_and_morty_app/features/characters/presentation/screens/tabs_screen.dart'
    as _i4;

/// generated route for
/// [_i1.CharacterDetailsScreen]
class CharacterDetailsRoute
    extends _i5.PageRouteInfo<CharacterDetailsRouteArgs> {
  CharacterDetailsRoute({
    _i6.Key? key,
    required _i7.Character character,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         CharacterDetailsRoute.name,
         args: CharacterDetailsRouteArgs(key: key, character: character),
         initialChildren: children,
       );

  static const String name = 'CharacterDetailsRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CharacterDetailsRouteArgs>();
      return _i1.CharacterDetailsScreen(
        key: args.key,
        character: args.character,
      );
    },
  );
}

class CharacterDetailsRouteArgs {
  const CharacterDetailsRouteArgs({this.key, required this.character});

  final _i6.Key? key;

  final _i7.Character character;

  @override
  String toString() {
    return 'CharacterDetailsRouteArgs{key: $key, character: $character}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CharacterDetailsRouteArgs) return false;
    return key == other.key && character == other.character;
  }

  @override
  int get hashCode => key.hashCode ^ character.hashCode;
}

/// generated route for
/// [_i2.FavouritesScreen]
class FavouritesRoute extends _i5.PageRouteInfo<void> {
  const FavouritesRoute({List<_i5.PageRouteInfo>? children})
    : super(FavouritesRoute.name, initialChildren: children);

  static const String name = 'FavouritesRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.FavouritesScreen();
    },
  );
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeScreen();
    },
  );
}

/// generated route for
/// [_i4.TabsScreen]
class TabsRoute extends _i5.PageRouteInfo<void> {
  const TabsRoute({List<_i5.PageRouteInfo>? children})
    : super(TabsRoute.name, initialChildren: children);

  static const String name = 'TabsRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.TabsScreen();
    },
  );
}
