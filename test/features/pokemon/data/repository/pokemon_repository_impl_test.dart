import 'package:dartz/dartz.dart';
import 'package:etiya_assignment/features/pokemon/data/datasource/pokemon_remote_data_source.dart';
import 'package:etiya_assignment/features/pokemon/data/repository/pokemon_repository_impl.dart';
import 'package:etiya_assignment/features/pokemon/domain/repository/pokemon_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../base_setup.dart';

class MockPokemonRemoteDataSource extends Mock implements PokemonRemoteDataSource {}

void main() {
  late PokemonRemoteDataSource mockRemoteDataSource;
  late PokemonRepository pokemonRepository;
  setUp(() {
    mockRemoteDataSource = MockPokemonRemoteDataSource();
    pokemonRepository = PokemonRepositoryImpl(mockRemoteDataSource);
  });
  group("getPokemonList", () {
    test("should return pokemon list response on a successful call", () async {
      when(() => mockRemoteDataSource.getPokemonList(limit: tLimit)).thenAnswer((_) async => tPokemonResult);

      final result = await pokemonRepository.getPokemonList(limit: tLimit);
      expect(result, Right(tPokemonResult));
    });
  });
}
