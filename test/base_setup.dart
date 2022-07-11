import 'package:etiya_assignment/core/injection_container.dart';
import 'package:etiya_assignment/features/pokemon/domain/models/pokemon_model.dart';
import 'package:etiya_assignment/features/pokemon/domain/models/pokemon_result_model.dart';
import 'package:etiya_assignment/features/pokemon/domain/usecase/get_pokemon_list_use_case.dart';
import 'package:etiya_assignment/features/pokemon/presentation/bloc/pokemon_state.dart';
import 'package:etiya_assignment/features/pokemon_details/domain/model/pokemon_details_model.dart';
import 'package:etiya_assignment/features/pokemon_details/domain/usecase/get_pokemon_details_use_case.dart';
import 'package:etiya_assignment/features/pokemon_details/presentation/cubit/pokemon_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

final tPokemonList = [Pokemon(1, "name", "url")];
const tLimit = 20;
const tId = 1;
final tPokemonResult = PokemonResult(pokemon: tPokemonList);
const tSearchQuery = "text";
final tPokemonDetails =
    PokemonDetails(1, "name", 0, 0, Color("name"), Habitat("name"), Shape("name"), [FlavorTextEntries("flavorText")]);

void baseSetUp() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  registerTestsFallbackValues();
}

Widget createWidgetForTesting({required Widget child}) {
  return MaterialApp(
    home: child,
  );
}

void registerTestsFallbackValues() {
  registerFallbackValue(PokemonListState.initial());
  registerFallbackValue(PokemonDetailsState.initial());
  registerFallbackValue(const GetPokemonListUseCaseParams(limit: tLimit));
  registerFallbackValue(const GetPokemonDetailsUseCaseParams(id: tId));
}

void baseTearDown() {
  getIt.reset();
}
