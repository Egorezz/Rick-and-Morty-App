import 'package:rick_and_morty_app/features/characters/domain/entities/character.dart';

class CharacterModel extends Character {
  const CharacterModel({
    required super.id,
    required super.name,
    required super.status,
    required super.image,
    required super.species,
    required super.gender,
    required super.originName,
    required super.locationName,
  });

  factory CharacterModel.fromEntity(Character character) {
    return CharacterModel(
      id: character.id,
      name: character.name,
      status: character.status,
      species: character.species,
      gender: character.gender,
      image: character.image,
      originName: character.originName,
      locationName: character.locationName,
    );
  }

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as String? ?? '',
      species: json['species'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      image: json['image'] as String? ?? '',
      originName: json['origin'] != null
          ? (json['origin']['name'] as String? ?? '')
          : (json['originName'] as String? ?? ''),
      locationName: json['location'] != null
          ? (json['location']['name'] as String? ?? '')
          : (json['locationName'] as String? ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'gender': gender,
      'image': image,
      'originName': originName,
      'locationName': locationName,
    };
  }
}
