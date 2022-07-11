import 'package:dartz/dartz.dart';
import 'package:etiya_assignment/failures/failures.dart';
import 'package:etiya_assignment/features/pokemon_details/data/datasource/pokemon_details_remote_data_source.dart';
import 'package:etiya_assignment/features/pokemon_details/domain/model/pokemon_details_model.dart';
import 'package:etiya_assignment/features/pokemon_details/domain/repository/pokemon_details_repository.dart';

class PokemonDetailsRepositoryImpl implements PokemonDetailsRepository {
  final PokemonDetailsRemoteDataSource _pokemonDetailsRemoteDataSource;

  PokemonDetailsRepositoryImpl(this._pokemonDetailsRemoteDataSource);

  @override
  Future<Either<Failure, PokemonDetails>> getPokemonDetails({required int id}) async {
    try {
      return Right(
        await _pokemonDetailsRemoteDataSource.getPokemonDetails(id: id),
      );
    } catch (e) {
      return const Left(PokemonServerExceptionFailure());
    }
  }
}
