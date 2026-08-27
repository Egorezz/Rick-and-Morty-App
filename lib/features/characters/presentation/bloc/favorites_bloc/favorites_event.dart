part of 'favorites_bloc.dart';

abstract class FavoritesEvent {
  const FavoritesEvent();
}

class LoadFavoritesEvent extends FavoritesEvent {}

class ToggleFavoriteEvent extends FavoritesEvent {
  final Character character;

  const ToggleFavoriteEvent(this.character);
}
