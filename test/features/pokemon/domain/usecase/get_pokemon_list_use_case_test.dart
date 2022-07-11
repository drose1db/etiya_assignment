import 'package:dartz/dartz.dart';
import 'package:etiya_assignment/features/pokemon/domain/repository/pokemon_repository.dart';
import 'package:etiya_assignment/features/pokemon/domain/usecase/get_pokemon_list_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../base_setup.dart';

class MockPokemonRepository extends Mock implements PokemonRepository {}

void main() {
  late MockPokemonRepository mockPokemonRepository;
  late GetPokemonListUseCase getPokemonListUseCase;
  setUp(() {
    mockPokemonRepository = MockPokemonRepository();
    getPokemonListUseCase = GetPokemonListUseCase(mockPokemonRepository);
  });

  test('should get pokemon list from the repository', () async {
    when(() => mockPokemonRepository.getPokemonList(limit: tLimit)).thenAnswer((_) async => Right(tPokemonResult));

    final result = await getPokemonListUseCase(const GetPokemonListUseCaseParams(limit: tLimit));
    verify(() => mockPokemonRepository.getPokemonList(limit: tLimit));
    expect(result, (Right(tPokemonList)));
  });
}
