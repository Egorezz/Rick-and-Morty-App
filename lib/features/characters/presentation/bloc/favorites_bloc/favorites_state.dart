part of 'favorites_bloc.dart';

abstract class FavoritesState {
  const FavoritesState();
}

class FavoritesInitialState extends FavoritesState {}

class FavoritesLoadingState extends FavoritesState {}

class FavoritesLoadedState extends FavoritesState {
  final List<Character> favorites;
  final List<int> favoriteIds;

  const FavoritesLoadedState({
    required this.favorites,
    required this.favoriteIds,
  });
}

class FavoritesErrorState extends FavoritesState {
  final String message;

  const FavoritesErrorState(this.message);
}
