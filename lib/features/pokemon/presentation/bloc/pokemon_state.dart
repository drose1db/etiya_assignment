import 'package:etiya_assignment/features/pokemon/domain/models/pokemon_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_state.freezed.dart';

enum PokemonListStatus {
  loading,
  loaded,
  error,
}

@freezed
class PokemonListState with _$PokemonListState {
  const factory PokemonListState({
    required PokemonListStatus status,
    required String searchQuery,
    List<Pokemon>? pokemonList,
    @Default([]) List<Pokemon> searchResults,
    @Default(false) bool isLoadingNewPage,
    @Default(20) int limit,
    @Default(false) isSearchOpened,
  }) = _PokemonListState;

  factory PokemonListState.initial() =>
      const PokemonListState(isSearchOpened: false, status: PokemonListStatus.loading, searchQuery: '');
}
