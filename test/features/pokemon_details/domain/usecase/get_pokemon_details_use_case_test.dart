import 'package:dartz/dartz.dart';
import 'package:etiya_assignment/features/pokemon_details/domain/repository/pokemon_details_repository.dart';
import 'package:etiya_assignment/features/pokemon_details/domain/usecase/get_pokemon_details_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../base_setup.dart';

class MockPokemonDetailsRepository extends Mock implements PokemonDetailsRepository {}

void main() {
  late MockPokemonDetailsRepository mockPokemonDetailsRepository;
  late GetPokemonDetailsUseCase getPokemonDetailsUseCase;

  setUp(() {
    mockPokemonDetailsRepository = MockPokemonDetailsRepository();
    getPokemonDetailsUseCase = GetPokemonDetailsUseCase(mockPokemonDetailsRepository);
  });

  test('should get pokemon details from the repository', () async {
    when(() => mockPokemonDetailsRepository.getPokemonDetails(id: tId)).thenAnswer((_) async => Right(tPokemonDetails));

    final result = await getPokemonDetailsUseCase(const GetPokemonDetailsUseCaseParams(id: tId));
    verify(() => mockPokemonDetailsRepository.getPokemonDetails(id: tId));
    expect(result, (Right(tPokemonDetails)));
  });
}
