import 'package:json_annotation/json_annotation.dart';

part 'pokemon_details_model.g.dart';

@JsonSerializable()
class PokemonDetails {
  int? id;
  @JsonKey(name: "base_happiness")
  int? baseHappiness;
  @JsonKey(name: "capture_rate")
  int? captureRate;
  String? name;
  Habitat? habitat;
  Color? color;
  Shape? shape;
  @JsonKey(name: "flavor_text_entries")
  List<FlavorTextEntries>? flavorTextEntries;

  PokemonDetails(
    this.id,
    this.name,
    this.baseHappiness,
    this.captureRate,
    this.color,
    this.habitat,
    this.shape,
    this.flavorTextEntries,
  );

  Map<String, dynamic> toJson() => _$PokemonDetailsToJson(this);

  factory PokemonDetails.fromJson(Map<String, dynamic> json) => _$PokemonDetailsFromJson(json);
}

@JsonSerializable()
class Shape {
  String? name;

  Shape(this.name);

  Map<String, dynamic> toJson() => _$ShapeToJson(this);

  factory Shape.fromJson(Map<String, dynamic> json) => _$ShapeFromJson(json);
}

@JsonSerializable()
class Color {
  String? name;

  Color(this.name);

  Map<String, dynamic> toJson() => _$ColorToJson(this);

  factory Color.fromJson(Map<String, dynamic> json) => _$ColorFromJson(json);
}

@JsonSerializable()
class Habitat {
  String? name;

  Habitat(this.name);

  Map<String, dynamic> toJson() => _$HabitatToJson(this);

  factory Habitat.fromJson(Map<String, dynamic> json) => _$HabitatFromJson(json);
}

@JsonSerializable()
class FlavorTextEntries {
  @JsonKey(name: "flavor_text")
  String? flavorText;

  FlavorTextEntries(this.flavorText);

  Map<String, dynamic> toJson() => _$FlavorTextEntriesToJson(this);

  factory FlavorTextEntries.fromJson(Map<String, dynamic> json) => _$FlavorTextEntriesFromJson(json);
}
