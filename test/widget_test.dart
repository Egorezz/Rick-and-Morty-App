import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/characters/domain/repositories/character_repository.dart';

class MockCharacterRepository implements CharacterRepository {
  @override
  Future<List<Character>> getCharacters(int page) async {
    return [];
  }

  @override
  Future<Character> getCharacterDetails(int id) async {
    return const Character(
      id: 1,
      name: 'Rick Sanchez',
      status: 'Alive',
      species: 'Human',
      gender: 'Male',
      image: '',
      originName: 'Earth',
      locationName: 'Earth',
    );
  }

  @override
  Future<List<Character>> getFavoriteCharacters() async {
    return [];
  }

  @override
  Future<bool> isFavorite(int id) async {
    return false;
  }

  @override
  Future<void> toggleFavorite(Character character) async {}
}

void main() {
  testWidgets('Basic repository mock test', (WidgetTester tester) async {
    final mockRepository = MockCharacterRepository();
    expect(mockRepository, isNotNull);
  });
}
