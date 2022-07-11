// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonResult _$PokemonResultFromJson(Map<String, dynamic> json) =>
    PokemonResult(
      pokemon: (json['results'] as List<dynamic>)
          .map((e) => Pokemon.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: json['count'] as int?,
    );

Map<String, dynamic> _$PokemonResultToJson(PokemonResult instance) =>
    <String, dynamic>{
      'count': instance.count,
      'results': instance.pokemon,
    };
