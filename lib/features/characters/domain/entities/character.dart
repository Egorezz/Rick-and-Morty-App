class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String image;
  final String gender;
  final String originName;
  final String locationName;

  const Character({
    required this.id,
    required this.name,
    required this.status,
    this.species = '',
    this.image = '',
    this.gender = '',
    this.originName = '',
    this.locationName = '',
  });
}
