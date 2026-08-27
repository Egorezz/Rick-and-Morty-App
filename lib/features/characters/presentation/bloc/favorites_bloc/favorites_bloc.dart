import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/characters/domain/repositories/character_repository.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final CharacterRepository repository;

  FavoritesBloc({required this.repository}) : super(FavoritesInitialState()) {
    on<LoadFavoritesEvent>(_onLoadFavorites);
    on<ToggleFavoriteEvent>(_onToggleFavorite);
  }

  Future<void> _onLoadFavorites(
    LoadFavoritesEvent event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(FavoritesLoadingState());
    try {
      final favorites = await repository.getFavoriteCharacters();
      final favoriteIds = favorites.map((c) => c.id).toList();
      emit(
        FavoritesLoadedState(favorites: favorites, favoriteIds: favoriteIds),
      );
    } catch (e) {
      emit(FavoritesErrorState(e.toString()));
    }
  }

  Future<void> _onToggleFavorite(
    ToggleFavoriteEvent event,
    Emitter<FavoritesState> emit,
  ) async {
    try {
      await repository.toggleFavorite(event.character);
      add(LoadFavoritesEvent());
    } catch (e) {
      emit(FavoritesErrorState(e.toString()));
    }
  }
}
