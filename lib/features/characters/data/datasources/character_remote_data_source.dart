import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_app/features/characters/data/models/character_model.dart';

abstract class CharacterRemoteDataSource {
  Future<List<CharacterModel>> getCharacters(int page);
  Future<CharacterModel> getCharacterDetails(int id);
}

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final http.Client client;

  CharacterRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CharacterModel>> getCharacters(int page) async {
    final response = await client.get(
      Uri.parse('https://rickandmortyapi.com/api/character/?page=$page'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      final List<dynamic> results = jsonMap['results'];
      return results
          .map((e) => CharacterModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception(
        'Ошибка загрузки списка персонажей: ${response.statusCode}',
      );
    }
  }

  @override
  Future<CharacterModel> getCharacterDetails(int id) async {
    final response = await client.get(
      Uri.parse('https://rickandmortyapi.com/api/character/$id'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      return CharacterModel.fromJson(jsonMap);
    } else {
      throw Exception('Ошибка загрузки деталей: ${response.statusCode}');
    }
  }
}
