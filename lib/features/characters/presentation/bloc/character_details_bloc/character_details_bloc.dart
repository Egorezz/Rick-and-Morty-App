import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/characters/domain/repositories/character_repository.dart';

part 'character_details_event.dart';
part 'character_details_state.dart';

class CharacterDetailsBloc
    extends Bloc<CharacterDetailsEvent, CharacterDetailsState> {
  final CharacterRepository repository;

  CharacterDetailsBloc({required this.repository})
    : super(CharacterDetailsInitial()) {
    on<GetCharacterDetailsEvent>(_onGetCharacterDetails);
  }

  Future<void> _onGetCharacterDetails(
    GetCharacterDetailsEvent event,
    Emitter<CharacterDetailsState> emit,
  ) async {
    emit(CharacterDetailsLoading());
    try {
      final character = await repository.getCharacterDetails(event.id);
      emit(CharacterDetailsLoaded(character));
    } catch (e) {
      emit(CharacterDetailsError(e.toString()));
    }
  }
}
