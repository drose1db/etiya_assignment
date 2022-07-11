abstract class PokemonListEvent {}

class GetPokemonListInitialDataEvent extends PokemonListEvent {}

class RefreshPokemonList extends PokemonListEvent {
  RefreshPokemonList();
}

class LoadNextPage extends PokemonListEvent {
  LoadNextPage();
}

class SearchIconTappedEvent extends PokemonListEvent {}

class SearchClosedTappedEvent extends PokemonListEvent {}

class SearchQueryChangedEvent extends PokemonListEvent {
  final String searchQuery;

  SearchQueryChangedEvent(this.searchQuery);
}
