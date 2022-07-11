import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:etiya_assignment/core/injection_container.dart';
import 'package:etiya_assignment/features/pokemon_details/domain/usecase/get_pokemon_details_use_case.dart';
import 'package:etiya_assignment/features/pokemon_details/presentation/cubit/pokemon_details_cubit.dart';
import 'package:etiya_assignment/features/pokemon_details/presentation/cubit/pokemon_details_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../base_setup.dart';

class MockGetPokemonDetailsUseCase extends Mock implements GetPokemonDetailsUseCase {}

void main() {
  late PokemonDetailsCubit pokemonDetailsCubit;
  late MockGetPokemonDetailsUseCase mockGetPokemonDetailsUseCase;
  setUpAll(() {
    registerTestsFallbackValues();
    baseSetUp();
    mockGetPokemonDetailsUseCase = MockGetPokemonDetailsUseCase();
    getIt.registerFactory<GetPokemonDetailsUseCase>(() => mockGetPokemonDetailsUseCase);
  });

  tearDownAll(() => baseTearDown());

  setUp(() {
    baseSetUp();

    pokemonDetailsCubit = PokemonDetailsCubit();
  });

  group("PokemonDetailsCubit test", () {
    test("Check initial state for pokemon details cubit", () {
      expect(pokemonDetailsCubit.state, const PokemonDetailsState(mode: PokemonDetailsMode.loading));
    });
    blocTest<PokemonDetailsCubit, PokemonDetailsState>(
      'Should get pokemon details',
      setUp: () async {
        when(() => mockGetPokemonDetailsUseCase.call(captureAny())).thenAnswer((_) async => Right(tPokemonDetails));
      },
      build: () => pokemonDetailsCubit,
      act: (cubit) {
        cubit.init(1);
      },
      expect: () => <PokemonDetailsState>[
        PokemonDetailsState.initial().copyWith(mode: PokemonDetailsMode.loading),
        PokemonDetailsState.initial().copyWith(mode: PokemonDetailsMode.loaded, pokemonDetails: tPokemonDetails),
      ],
    );
  });
}
