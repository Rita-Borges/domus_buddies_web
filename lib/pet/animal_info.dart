class AnimalInfo {
  final String uniqueId;
  final String? microchip;
  final String name;
  final String? gender;
  final String? breed;
  final String? specie;
  final String? owner;
  final DateTime? birthDate;
  final DateTime? deathDate;

  AnimalInfo({
    required this.uniqueId,
    this.microchip,
    required this.name,
    this.gender,
    this.breed,
    this.specie,
    this.owner,
    this.birthDate,
    this.deathDate,
  });

  factory AnimalInfo.fromJson(Map<String?, dynamic> json) {
    return AnimalInfo(
      uniqueId: json['uniqueId'] ,
      microchip: json['microchip'],
      name: json['name'],
      gender: json['gender'],
      breed: json['breed'],
      specie: json['specie'],
      owner: json['owner'],
      birthDate: json['birthDate'] != null ? DateTime.parse(json['birthDate']) : null,
      deathDate: json['deathDate'] != null ? DateTime.parse(json['deathDate']) : null,
    );
  }

  String calculateAge() {
    if (birthDate != null) {
      final today = DateTime.now();
      final difference = today.difference(birthDate!);
      return (difference.inDays / 30).floor().toString(); // Assuming a month has 30 days
    } else {
      return "0";
    }
  }
}
