import 'dart:async';

import 'package:etiya_assignment/core/injection_container.dart';
import 'package:etiya_assignment/core/keyboard_util.dart';
import 'package:etiya_assignment/features/pokemon/domain/models/pokemon_model.dart';
import 'package:etiya_assignment/features/pokemon/domain/usecase/get_pokemon_list_use_case.dart';
import 'package:etiya_assignment/features/pokemon/presentation/bloc/pokemon_event.dart';
import 'package:etiya_assignment/features/pokemon/presentation/bloc/pokemon_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  PokemonListBloc() : super(PokemonListState.initial()) {
    on<GetPokemonListInitialDataEvent>(_getData);
    on<RefreshPokemonList>(_refreshPokemonList);
    on<LoadNextPage>(_loadNextPage);
    on<SearchIconTappedEvent>(_searchMode);
    on<SearchClosedTappedEvent>(_closeSearch);
    on<SearchQueryChangedEvent>(_onSearchQueryChanged);
  }

  Future<void> _getData(PokemonListEvent event, Emitter<PokemonListState> emit) async {
    await _getPokemonList().then((pokemonListResponse) {
      pokemonListResponse.fold((l) {
        emit(state.copyWith(status: PokemonListStatus.error, isLoadingNewPage: false));
      }, (List<Pokemon> pokemonList) {
        for (int i = 0; i < pokemonList.length; i++) {
          pokemonList[i].id = i + 1;
        }
        emit(state.copyWith(
          status: PokemonListStatus.loaded,
          pokemonList: pokemonList,
        ));
      });
    });
  }

  _onSearchQueryChanged(SearchQueryChangedEvent event, Emitter<PokemonListState> emit) {
    List<Pokemon> filteredList = [];
    final searchQuery = event.searchQuery;
    if (searchQuery.isEmpty) {
      emit(state.copyWith(isSearchOpened: true, searchResults: state.pokemonList!));
    }
    for (var element in state.pokemonList!) {
      if (element.name!.contains(searchQuery.toLowerCase())) {
        filteredList.add(element);
      }
      emit(state.copyWith(
        searchQuery: searchQuery,
        searchResults: filteredList,
      ));
    }
  }

  _closeSearch(PokemonListEvent event, Emitter<PokemonListState> emit) {
    closeKeyboard();
    emit(state.copyWith(isSearchOpened: false, searchQuery: "", status: PokemonListStatus.loaded));
  }

  _searchMode(PokemonListEvent event, Emitter<PokemonListState> emit) {
    emit(state.copyWith(isSearchOpened: true));
  }

  Future<void> _refreshPokemonList(PokemonListEvent event, Emitter<PokemonListState> emit) async {
    emit(state.copyWith(limit: 20, status: PokemonListStatus.loading));
    await _getData(event, emit);
  }

  Future<void> _loadNextPage(PokemonListEvent event, Emitter<PokemonListState> emit) async {
    emit(state.copyWith(isLoadingNewPage: true, limit: state.limit + 20));
    await _getData(event, emit);
    emit(state.copyWith(isLoadingNewPage: false));
  }

  _getPokemonList() async {
    return await getIt<GetPokemonListUseCase>().call(GetPokemonListUseCaseParams(limit: state.limit));
  }
}
