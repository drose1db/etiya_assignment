import 'package:dartz/dartz.dart';
import 'package:etiya_assignment/failures/failures.dart';
import 'package:etiya_assignment/features/pokemon/domain/models/pokemon_result_model.dart';

abstract class PokemonRepository {
  Future<Either<Failure, PokemonResult>> getPokemonList({required int limit});
}
