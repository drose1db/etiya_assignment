import 'package:dartz/dartz.dart';
import 'package:etiya_assignment/features/pokemon_details/data/datasource/pokemon_details_remote_data_source.dart';
import 'package:etiya_assignment/features/pokemon_details/data/repository/pokemon_details_repository_impl.dart';
import 'package:etiya_assignment/features/pokemon_details/domain/model/pokemon_details_model.dart';
import 'package:etiya_assignment/features/pokemon_details/domain/repository/pokemon_details_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../base_setup.dart';

class MockPokemonDetailsRemoteDataSource extends Mock implements PokemonDetailsRemoteDataSource {}

void main() {
  late PokemonDetailsRemoteDataSource mockPokemonDetailsRemoteDataSource;
  late PokemonDetailsRepository pokemonDetailsRepository;
  late PokemonDetails pokemonDetails;

  setUp(() {
    mockPokemonDetailsRemoteDataSource = MockPokemonDetailsRemoteDataSource();
    pokemonDetailsRepository = PokemonDetailsRepositoryImpl(mockPokemonDetailsRemoteDataSource);
    pokemonDetails = tPokemonDetails;
  });

  group("getPokemonDetails", () {
    test("should return pokemon details response on a successful call", () async {
      when(() => mockPokemonDetailsRemoteDataSource.getPokemonDetails(id: tId)).thenAnswer((_) async => pokemonDetails);

      final result = await pokemonDetailsRepository.getPokemonDetails(id: tId);
      expect(result, Right(pokemonDetails));
    });
  });
}
