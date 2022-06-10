// To parse this JSON data, do
//
//     final pokemon = pokemonFromMap(jsonString);

import 'dart:convert';

class Pokemon {
  Pokemon({
    required this.abilities,
    required this.baseExperience,
    required this.forms,
    required this.gameIndices,
    required this.height,
    required this.heldItems,
    required this.id,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.moves,
    required this.name,
    required this.order,
    required this.pastTypes,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });

  List<dynamic> abilities;
  int baseExperience;
  List<Form> forms;
  List<dynamic> gameIndices;
  int height;
  List<dynamic> heldItems;
  int id;
  bool isDefault;
  String locationAreaEncounters;
  List<dynamic> moves;
  String name;
  int order;
  List<dynamic> pastTypes;
  Species species;
  Species sprites;
  List<dynamic> stats;
  List<dynamic> types;
  int weight;

  factory Pokemon.fromJson(String str) => Pokemon.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pokemon.fromMap(Map<String, dynamic> json) => Pokemon(
        abilities: List<dynamic>.from(json["abilities"].map((x) => x)),
        baseExperience: json["base_experience"],
        forms: List<Form>.from(json["forms"].map((x) => Form.fromMap(x))),
        gameIndices: List<dynamic>.from(json["game_indices"].map((x) => x)),
        height: json["height"],
        heldItems: List<dynamic>.from(json["held_items"].map((x) => x)),
        id: json["id"],
        isDefault: json["is_default"],
        locationAreaEncounters: json["location_area_encounters"],
        moves: List<dynamic>.from(json["moves"].map((x) => x)),
        name: json["name"],
        order: json["order"],
        pastTypes: List<dynamic>.from(json["past_types"].map((x) => x)),
        species: Species.fromMap(json["species"]),
        sprites: Species.fromMap(json["sprites"]),
        stats: List<dynamic>.from(json["stats"].map((x) => x)),
        types: List<dynamic>.from(json["types"].map((x) => x)),
        weight: json["weight"],
      );

  Map<String, dynamic> toMap() => {
        "abilities": List<dynamic>.from(abilities.map((x) => x)),
        "base_experience": baseExperience,
        "forms": List<dynamic>.from(forms.map((x) => x.toMap())),
        "game_indices": List<dynamic>.from(gameIndices.map((x) => x)),
        "height": height,
        "held_items": List<dynamic>.from(heldItems.map((x) => x)),
        "id": id,
        "is_default": isDefault,
        "location_area_encounters": locationAreaEncounters,
        "moves": List<dynamic>.from(moves.map((x) => x)),
        "name": name,
        "order": order,
        "past_types": List<dynamic>.from(pastTypes.map((x) => x)),
        "species": species.toMap(),
        "sprites": sprites.toMap(),
        "stats": List<dynamic>.from(stats.map((x) => x)),
        "types": List<dynamic>.from(types.map((x) => x)),
        "weight": weight,
      };
}

class Form {
  Form({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Form.fromJson(String str) => Form.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Form.fromMap(Map<String, dynamic> json) => Form(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}

class Species {
  Species();

  factory Species.fromJson(String str) => Species.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Species.fromMap(Map<String, dynamic> json) => Species();

  Map<String, dynamic> toMap() => {};
}
