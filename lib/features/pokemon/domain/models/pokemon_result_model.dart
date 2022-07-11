import 'package:etiya_assignment/features/pokemon/domain/models/pokemon_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_result_model.g.dart';

@JsonSerializable()
class PokemonResult {
  int? count;
  @JsonKey(name: "results")
  List<Pokemon> pokemon;

  PokemonResult({
    required this.pokemon,
    this.count,
  });

  Map<String, dynamic> toJson() => _$PokemonResultToJson(this);

  factory PokemonResult.fromJson(Map<String, dynamic> json) => _$PokemonResultFromJson(json);
}
