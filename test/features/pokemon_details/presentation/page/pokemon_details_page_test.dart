import 'package:dartz/dartz.dart';
import 'package:etiya_assignment/core/injection_container.dart';
import 'package:etiya_assignment/core/widgets/base_error_widget.dart';
import 'package:etiya_assignment/features/pokemon_details/domain/usecase/get_pokemon_details_use_case.dart';
import 'package:etiya_assignment/features/pokemon_details/presentation/cubit/pokemon_details_cubit.dart';
import 'package:etiya_assignment/features/pokemon_details/presentation/page/pokemon_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../base_setup.dart';

class MockGetPokemonDetailsUseCase extends Mock implements GetPokemonDetailsUseCase {}

void main() {
  late final PokemonDetailsCubit mockCubit;
  late final GetPokemonDetailsUseCase mockGetPokemonDetailsUseCase;

  setUpAll(() {
    registerTestsFallbackValues();
    mockGetPokemonDetailsUseCase = MockGetPokemonDetailsUseCase();
    getIt.registerSingleton<GetPokemonDetailsUseCase>(mockGetPokemonDetailsUseCase);
    when(() => mockGetPokemonDetailsUseCase.call(captureAny())).thenAnswer((_) async => Right(tPokemonDetails));

    mockCubit = PokemonDetailsCubit();
    getIt.registerSingleton<PokemonDetailsCubit>(mockCubit);
    baseSetUp();
  });

  tearDownAll(() => baseTearDown());

  testWidgets("Should properly display pokemon details page", (WidgetTester tester) async {
    await tester.pumpWidget(
      createWidgetForTesting(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<PokemonDetailsCubit>(create: (_) => mockCubit),
          ],
          child: const PokemonDetailsPage(id: tId),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(Stack), findsWidgets);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(BaseErrorWidget), findsNothing);
    expect(find.byType(Expanded), findsWidgets);
    expect(find.byType(Text), findsWidgets);
  });
}
