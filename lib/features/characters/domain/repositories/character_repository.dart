import 'package:rick_and_morty_app/features/characters/domain/entities/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> getCharacters(int page);
  Future<Character> getCharacterDetails(int id);

  Future<List<Character>> getFavoriteCharacters();
  Future<bool> isFavorite(int id);
  Future<void> toggleFavorite(Character character);
}
