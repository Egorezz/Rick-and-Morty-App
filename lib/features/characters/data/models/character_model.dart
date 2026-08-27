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

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'] as int,
      name: json['name']?.toString() ?? 'Unknown',
      status: json['status']?.toString() ?? 'Unknown',
      image: json['image']?.toString() ?? '',
      species: json['species']?.toString() ?? 'Unknown',
      gender: json['gender']?.toString() ?? 'Unknown',
      originName:
          (json['origin'] as Map<String, dynamic>?)?['name']?.toString() ??
          'Unknown',
      locationName:
          (json['location'] as Map<String, dynamic>?)?['name']?.toString() ??
          'Unknown',
    );
  }
}
