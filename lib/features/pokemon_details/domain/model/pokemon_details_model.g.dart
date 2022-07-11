// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetails _$PokemonDetailsFromJson(Map<String, dynamic> json) =>
    PokemonDetails(
      json['id'] as int?,
      json['name'] as String?,
      json['base_happiness'] as int?,
      json['capture_rate'] as int?,
      json['color'] == null
          ? null
          : Color.fromJson(json['color'] as Map<String, dynamic>),
      json['habitat'] == null
          ? null
          : Habitat.fromJson(json['habitat'] as Map<String, dynamic>),
      json['shape'] == null
          ? null
          : Shape.fromJson(json['shape'] as Map<String, dynamic>),
      (json['flavor_text_entries'] as List<dynamic>?)
          ?.map((e) => FlavorTextEntries.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonDetailsToJson(PokemonDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'base_happiness': instance.baseHappiness,
      'capture_rate': instance.captureRate,
      'name': instance.name,
      'habitat': instance.habitat,
      'color': instance.color,
      'shape': instance.shape,
      'flavor_text_entries': instance.flavorTextEntries,
    };

Shape _$ShapeFromJson(Map<String, dynamic> json) => Shape(
      json['name'] as String?,
    );

Map<String, dynamic> _$ShapeToJson(Shape instance) => <String, dynamic>{
      'name': instance.name,
    };

Color _$ColorFromJson(Map<String, dynamic> json) => Color(
      json['name'] as String?,
    );

Map<String, dynamic> _$ColorToJson(Color instance) => <String, dynamic>{
      'name': instance.name,
    };

Habitat _$HabitatFromJson(Map<String, dynamic> json) => Habitat(
      json['name'] as String?,
    );

Map<String, dynamic> _$HabitatToJson(Habitat instance) => <String, dynamic>{
      'name': instance.name,
    };

FlavorTextEntries _$FlavorTextEntriesFromJson(Map<String, dynamic> json) =>
    FlavorTextEntries(
      json['flavor_text'] as String?,
    );

Map<String, dynamic> _$FlavorTextEntriesToJson(FlavorTextEntries instance) =>
    <String, dynamic>{
      'flavor_text': instance.flavorText,
    };
