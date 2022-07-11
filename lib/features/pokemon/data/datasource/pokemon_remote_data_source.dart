import 'package:etiya_assignment/features/pokemon/domain/models/pokemon_result_model.dart';

abstract class PokemonRemoteDataSource {
  Future<PokemonResult> getPokemonList({required int limit});
}
