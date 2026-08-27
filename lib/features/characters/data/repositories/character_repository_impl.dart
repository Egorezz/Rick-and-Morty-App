import 'package:rick_and_morty_app/features/characters/data/datasources/character_local_data_source.dart';
import 'package:rick_and_morty_app/features/characters/data/datasources/character_remote_data_source.dart';
import 'package:rick_and_morty_app/features/characters/data/models/character_model.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/characters/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;
  final CharacterLocalDataSource localDataSource;

  CharacterRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<Character>> getCharacters(int page) async {
    final models = await remoteDataSource.getCharacters(page);
    return models;
  }

  @override
  Future<Character> getCharacterDetails(int id) async {
    final model = await remoteDataSource.getCharacterDetails(id);
    return model;
  }

  @override
  Future<List<Character>> getFavoriteCharacters() async {
    final models = await localDataSource.getFavoriteCharacters();
    return models;
  }

  @override
  Future<bool> isFavorite(int id) async {
    final favorites = await localDataSource.getFavoriteCharacters();
    return favorites.any((item) => item.id == id);
  }

  @override
  Future<void> toggleFavorite(Character character) async {
    final favorites = await localDataSource.getFavoriteCharacters();
    final isFav = favorites.any((item) => item.id == character.id);

    final model = (character is CharacterModel)
        ? character
        : CharacterModel.fromEntity(character);

    if (isFav) {
      await localDataSource.removeFavoriteCharacter(character.id);
    } else {
      await localDataSource.saveFavoriteCharacter(model);
    }
  }
}
