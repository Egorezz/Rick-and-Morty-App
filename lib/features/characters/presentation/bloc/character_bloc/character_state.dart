part of 'character_bloc.dart';

enum CharacterStatus { initial, loading, loaded, error }

class CharacterState {
  final CharacterStatus status;
  final List<Character> characters;
  final bool hasReachedMax;

  const CharacterState({
    this.status = CharacterStatus.initial,
    this.characters = const <Character>[],
    this.hasReachedMax = false,
  });

  CharacterState copyWith({
    CharacterStatus? status,
    List<Character>? characters,
    bool? hasReachedMax,
  }) {
    return CharacterState(
      status: status ?? this.status,
      characters: characters ?? this.characters,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
