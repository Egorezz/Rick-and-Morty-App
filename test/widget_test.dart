import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/characters/domain/repositories/character_repository.dart';
import 'package:rick_and_morty_app/main.dart';

class FakeCharacterRepository implements CharacterRepository {
  @override
  Future<List<Character>> getCharacters(int page) async => [];

  @override
  Future<Character> getCharacterDetails(int id) async {
    return const Character(
      id: 1,
      name: 'Rick Sanchez',
      status: 'Alive',
      image: '',
      species: 'Human',
      gender: 'Male',
      originName: 'Earth',
      locationName: 'Earth',
    );
  }
}

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    final fakeRepository = FakeCharacterRepository();
    await tester.pumpWidget(
      RickAndMortyApp(characterRepository: fakeRepository),
    );
  });
}
