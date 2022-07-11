import 'package:etiya_assignment/features/pokemon_details/domain/model/pokemon_details_model.dart';

abstract class PokemonDetailsRemoteDataSource {
  Future<PokemonDetails> getPokemonDetails({required int id});
}
