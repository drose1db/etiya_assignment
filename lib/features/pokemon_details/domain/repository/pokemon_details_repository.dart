import 'package:dartz/dartz.dart';
import 'package:etiya_assignment/failures/failures.dart';
import 'package:etiya_assignment/features/pokemon_details/domain/model/pokemon_details_model.dart';

abstract class PokemonDetailsRepository {
  Future<Either<Failure, PokemonDetails>> getPokemonDetails({required int id});
}
