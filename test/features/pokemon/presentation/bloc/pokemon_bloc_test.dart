import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:etiya_assignment/core/injection_container.dart';
import 'package:etiya_assignment/failures/failures.dart';
import 'package:etiya_assignment/features/pokemon/domain/usecase/get_pokemon_list_use_case.dart';
import 'package:etiya_assignment/features/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'package:etiya_assignment/features/pokemon/presentation/bloc/pokemon_event.dart';
import 'package:etiya_assignment/features/pokemon/presentation/bloc/pokemon_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../base_setup.dart';

class MockGetPokemonListUseCase extends Mock implements GetPokemonListUseCase {}

void main() {
  late PokemonListBloc pokemonListBloc;
  late MockGetPokemonListUseCase mockGetPokemonListUseCase;
  setUpAll(() {
    registerTestsFallbackValues();
    baseSetUp();
    mockGetPokemonListUseCase = MockGetPokemonListUseCase();
    getIt.registerFactory<GetPokemonListUseCase>(() => mockGetPokemonListUseCase);
  });

  tearDownAll(() => baseTearDown());

  setUp(() {
    pokemonListBloc = PokemonListBloc();
  });

  group("PokemonListBloc test", () {
    test("Check initial state for pokemon list bloc", () {
      expect(pokemonListBloc.state, PokemonListState.initial());
    });
    blocTest<PokemonListBloc, PokemonListState>(
      'Should get pokemon initial data',
      setUp: () async {
        when(() => mockGetPokemonListUseCase.call(captureAny())).thenAnswer((_) async => Right(tPokemonList));
      },
      build: () => pokemonListBloc,
      act: (bloc) {
        bloc.add(GetPokemonListInitialDataEvent());
      },
      expect: () => <PokemonListState>[
        PokemonListState.initial().copyWith(pokemonList: tPokemonList, status: PokemonListStatus.loaded),
      ],
    );

    blocTest<PokemonListBloc, PokemonListState>(
      'Should return error',
      setUp: () async {
        when(() => mockGetPokemonListUseCase.call(captureAny()))
            .thenAnswer((_) async => const Left(PokemonServerExceptionFailure()));
      },
      build: () => pokemonListBloc,
      act: (bloc) {
        bloc.add(GetPokemonListInitialDataEvent());
      },
      expect: () => <PokemonListState>[
        PokemonListState.initial().copyWith(status: PokemonListStatus.error),
      ],
    );

    blocTest<PokemonListBloc, PokemonListState>(
      'Refresh pokemon list',
      setUp: () async {
        when(() => mockGetPokemonListUseCase.call(captureAny())).thenAnswer((_) async => Right(tPokemonList));
      },
      build: () => pokemonListBloc,
      act: (bloc) {
        bloc.add(RefreshPokemonList());
      },
      expect: () => <PokemonListState>[
        PokemonListState.initial().copyWith(limit: tLimit, status: PokemonListStatus.loading),
        PokemonListState.initial().copyWith(pokemonList: tPokemonList, status: PokemonListStatus.loaded),
      ],
    );

    blocTest<PokemonListBloc, PokemonListState>(
      'Should load next page',
      setUp: () async {
        when(() => mockGetPokemonListUseCase.call(captureAny())).thenAnswer((_) async => Right(tPokemonList));
      },
      build: () => pokemonListBloc,
      act: (bloc) {
        bloc.add(LoadNextPage());
      },
      expect: () => <PokemonListState>[
        PokemonListState.initial()
            .copyWith(isLoadingNewPage: true, limit: tLimit + 20, status: PokemonListStatus.loading),
        PokemonListState.initial().copyWith(
            pokemonList: tPokemonList, isLoadingNewPage: true, limit: tLimit + 20, status: PokemonListStatus.loaded),
        PokemonListState.initial().copyWith(
            pokemonList: tPokemonList, isLoadingNewPage: false, limit: tLimit + 20, status: PokemonListStatus.loaded),
      ],
    );
  });
}
