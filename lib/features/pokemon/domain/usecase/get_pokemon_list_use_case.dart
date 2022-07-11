import 'package:dartz/dartz.dart';
import 'package:etiya_assignment/core/usecase.dart';
import 'package:etiya_assignment/failures/failures.dart';
import 'package:etiya_assignment/features/pokemon/domain/models/pokemon_model.dart';
import 'package:etiya_assignment/features/pokemon/domain/repository/pokemon_repository.dart';

class GetPokemonListUseCase extends UseCase<List<Pokemon>, GetPokemonListUseCaseParams> {
  final PokemonRepository pokemonRepository;

  GetPokemonListUseCase(this.pokemonRepository);

  @override
  Future<Either<Failure, List<Pokemon>>> call(GetPokemonListUseCaseParams params) async {
    final response = await pokemonRepository.getPokemonList(limit: params.limit);
    return await response.fold(
      (l) async => Left(l),
      (pokemonResponse) {
        return Right(pokemonResponse.pokemon);
      },
    );
  }
}

class GetPokemonListUseCaseParams {
  final int limit;

  const GetPokemonListUseCaseParams({
    required this.limit,
  });
}
