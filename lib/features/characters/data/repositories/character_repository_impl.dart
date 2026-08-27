import 'package:rick_and_morty_app/features/characters/data/datasources/character_remote_data_source.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/characters/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;

  CharacterRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Character>> getCharacters(int page) async {
    return await remoteDataSource.getCharacters(page);
  }

  @override
  Future<Character> getCharacterDetails(int id) async {
    return await remoteDataSource.getCharacterDetails(id);
  }
}
