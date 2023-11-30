import 'package:naruto_app/models/debut_character.dart';
import 'package:naruto_app/models/personal_character.dart';

class Characters {
  List<Character> characters;

  Characters({
    required this.characters,
  });

  factory Characters.fromJson(Map<String, dynamic> json) => Characters(
        characters: List<Character>.from(
            json["characters"].map((x) => Character.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "characters": List<dynamic>.from(characters.map((x) => x.toJson())),
      };
}

class Character {
  int id;
  String name;
  List<String>? images;
  Debut? debut;
  List<String>? jutsu;
  Personal personal;
  List<String>? uniqueTraits;

  Character({
    required this.id,
    required this.name,
    required this.images,
    this.debut,
    this.jutsu,
    required this.personal,
    this.uniqueTraits,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: json["name"],
        images: json["images"] != null
            ? List<String>.from(json["images"].map((x) => x))
            : null,
        debut: json["debut"] != null ? Debut.fromJson(json["debut"]) : null,
        jutsu: json["jutsu"] != null
            ? List<String>.from(json["jutsu"].map((x) => x))
            : null,
        personal: Personal.fromJson(json["personal"]),
        uniqueTraits: json["uniqueTraits"] != null
            ? List<String>.from(json["uniqueTraits"].map((x) => x))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "images":
            images != null ? List<dynamic>.from(images!.map((x) => x)) : [],
        "debut": debut?.toJson(),
        "jutsu": jutsu != null ? List<dynamic>.from(jutsu!.map((x) => x)) : [],
        "personal": personal.toJson(),
        "uniqueTraits": uniqueTraits != null
            ? List<dynamic>.from(uniqueTraits!.map((x) => x))
            : [],
      };

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name};
  }
}
