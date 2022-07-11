import 'package:json_annotation/json_annotation.dart';

part 'pokemon_model.g.dart';

@JsonSerializable()
class Pokemon {
  int? id;
  String? name;
  String? url;

  Pokemon(this.id, this.name, this.url);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);

  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);
}
