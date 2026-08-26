import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  int _currentPage = 1;
  bool _isFetching = false;

  CharacterBloc() : super(const CharacterState()) {
    on<FetchCharactersEvent>(_onFetchCharacters);
  }

  Future<void> _onFetchCharacters(
    FetchCharactersEvent event,
    Emitter<CharacterState> emit,
  ) async {
    if (state.hasReachedMax || _isFetching) return;
    _isFetching = true;

    if (state.status == CharacterStatus.initial) {
      emit(state.copyWith(status: CharacterStatus.loading));
    }

    try {
      final newItems = await _fetchMockCharacters(_currentPage);

      if (newItems.isEmpty) {
        emit(state.copyWith(hasReachedMax: true));
      } else {
        _currentPage++;
        emit(
          state.copyWith(
            status: CharacterStatus.loaded,
            characters: List.of(state.characters)..addAll(newItems),
            hasReachedMax: false,
          ),
        );
      }
    } catch (_) {
      emit(state.copyWith(status: CharacterStatus.error));
    } finally {
      _isFetching = false;
    }
  }

  //mock data
  Future<List<Character>> _fetchMockCharacters(
    int page, {
    int limit = 15,
  }) async {
    await Future.delayed(const Duration(milliseconds: 800));
    if (page > 4) return [];

    return List.generate(
      limit,
      (index) => Character(
        id: (page - 1) * limit + index + 1,
        name: 'Character #${(page - 1) * limit + index + 1}',
        status: index % 2 == 0 ? 'Alive' : 'Dead',
      ),
    );
  }
}
