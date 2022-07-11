import 'package:dartz/dartz.dart';
import 'package:etiya_assignment/failures/failures.dart';
import 'package:etiya_assignment/features/pokemon/data/datasource/pokemon_remote_data_source.dart';
import 'package:etiya_assignment/features/pokemon/domain/models/pokemon_result_model.dart';
import 'package:etiya_assignment/features/pokemon/domain/repository/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource _pokemonRemoteDataSource;

  PokemonRepositoryImpl(this._pokemonRemoteDataSource);

  @override
  Future<Either<Failure, PokemonResult>> getPokemonList({required int limit}) async {
    try {
      return Right(
        await _pokemonRemoteDataSource.getPokemonList(limit: limit),
      );
    } catch (e) {
      return const Left(PokemonServerExceptionFailure());
    }
  }
}
