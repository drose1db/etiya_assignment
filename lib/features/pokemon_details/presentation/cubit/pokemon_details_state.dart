import 'package:etiya_assignment/features/pokemon_details/domain/model/pokemon_details_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_details_state.freezed.dart';

enum PokemonDetailsMode { loading, loaded, error }

@freezed
class PokemonDetailsState with _$PokemonDetailsState {
  const factory PokemonDetailsState({
    required PokemonDetailsMode mode,
    PokemonDetails? pokemonDetails,
  }) = _PokemonDetailsState;

  factory PokemonDetailsState.initial() => const PokemonDetailsState(mode: PokemonDetailsMode.loading);
}
