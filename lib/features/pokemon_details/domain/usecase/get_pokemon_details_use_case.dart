import 'package:dartz/dartz.dart';
import 'package:etiya_assignment/core/usecase.dart';
import 'package:etiya_assignment/failures/failures.dart';
import 'package:etiya_assignment/features/pokemon_details/domain/model/pokemon_details_model.dart';
import 'package:etiya_assignment/features/pokemon_details/domain/repository/pokemon_details_repository.dart';

class GetPokemonDetailsUseCase extends UseCase<PokemonDetails, GetPokemonDetailsUseCaseParams> {
  final PokemonDetailsRepository pokemonDetailsRepository;

  GetPokemonDetailsUseCase(this.pokemonDetailsRepository);

  @override
  Future<Either<Failure, PokemonDetails>> call(GetPokemonDetailsUseCaseParams params) async {
    final response = await pokemonDetailsRepository.getPokemonDetails(id: params.id);
    return await response.fold(
      (l) async => Left(l),
      (pokemonDetailsResponse) {
        return Right(pokemonDetailsResponse);
      },
    );
  }
}

class GetPokemonDetailsUseCaseParams {
  final int id;

  const GetPokemonDetailsUseCaseParams({
    required this.id,
  });
}
