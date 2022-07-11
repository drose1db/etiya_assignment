import 'package:etiya_assignment/core/injection_container.dart';
import 'package:etiya_assignment/features/pokemon_details/domain/usecase/get_pokemon_details_use_case.dart';
import 'package:etiya_assignment/features/pokemon_details/presentation/cubit/pokemon_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetailsState> {
  PokemonDetailsCubit() : super(PokemonDetailsState.initial());

  Future<void> init(int id) async {
    emit(state.copyWith(mode: PokemonDetailsMode.loading));
    final pokemonDetails = await getIt<GetPokemonDetailsUseCase>().call(GetPokemonDetailsUseCaseParams(id: id));
    pokemonDetails.fold((l) {
      emit(state.copyWith(mode: PokemonDetailsMode.error));
    }, (pokemonDetails) {
      emit(state.copyWith(mode: PokemonDetailsMode.loaded, pokemonDetails: pokemonDetails));
    });
  }
}
