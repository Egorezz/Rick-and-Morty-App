import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rick_and_morty_app/features/characters/data/models/character_model.dart';

abstract class CharacterLocalDataSource {
  Future<List<CharacterModel>> getFavoriteCharacters();
  Future<void> saveFavoriteCharacter(CharacterModel character);
  Future<void> removeFavoriteCharacter(int id);
}

class CharacterLocalDataSourceImpl implements CharacterLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const String _favoritesKey = 'CACHED_FAVORITE_CHARACTERS';

  CharacterLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<CharacterModel>> getFavoriteCharacters() async {
    final jsonStringList = sharedPreferences.getStringList(_favoritesKey) ?? [];
    return jsonStringList
        .map((jsonStr) => CharacterModel.fromJson(json.decode(jsonStr)))
        .toList();
  }

  @override
  Future<void> saveFavoriteCharacter(CharacterModel character) async {
    final favorites = await getFavoriteCharacters();
    if (!favorites.any((item) => item.id == character.id)) {
      favorites.add(character);
      await _saveList(favorites);
    }
  }

  @override
  Future<void> removeFavoriteCharacter(int id) async {
    final favorites = await getFavoriteCharacters();
    favorites.removeWhere((item) => item.id == id);
    await _saveList(favorites);
  }

  Future<void> _saveList(List<CharacterModel> list) async {
    final jsonStringList = list
        .map((character) => json.encode(character.toJson()))
        .toList();
    await sharedPreferences.setStringList(_favoritesKey, jsonStringList);
  }
}
