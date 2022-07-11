import 'package:dio/dio.dart';
import 'package:etiya_assignment/features/pokemon/data/datasource/pokemon_remote_data_source.dart';
import 'package:etiya_assignment/features/pokemon/data/datasource/pokemon_remote_data_source_impl.dart';
import 'package:etiya_assignment/features/pokemon/data/repository/pokemon_repository_impl.dart';
import 'package:etiya_assignment/features/pokemon/domain/repository/pokemon_repository.dart';
import 'package:etiya_assignment/features/pokemon/domain/usecase/get_pokemon_list_use_case.dart';
import 'package:etiya_assignment/features/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'package:etiya_assignment/features/pokemon_details/data/datasource/pokemon_details_remote_data_source.dart';
import 'package:etiya_assignment/features/pokemon_details/data/datasource/pokemon_details_remote_data_source_impl.dart';
import 'package:etiya_assignment/features/pokemon_details/data/repository/pokemon_details_repository_impl.dart';
import 'package:etiya_assignment/features/pokemon_details/domain/repository/pokemon_details_repository.dart';
import 'package:etiya_assignment/features/pokemon_details/domain/usecase/get_pokemon_details_use_case.dart';
import 'package:etiya_assignment/features/pokemon_details/presentation/cubit/pokemon_details_cubit.dart';
import 'package:etiya_assignment/network/dio_client.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerLazySingleton<PokemonRepository>(() => PokemonRepositoryImpl(getIt()));
  getIt.registerLazySingleton<PokemonRemoteDataSource>(() => PokemonRemoteDataSourceImpl(getIt<Dio>()));
  getIt.registerFactory<GetPokemonListUseCase>(() => GetPokemonListUseCase(getIt<PokemonRepository>()));
  getIt.registerFactory<PokemonListBloc>(() => PokemonListBloc());
  getIt.registerLazySingleton<PokemonDetailsRepository>(() => PokemonDetailsRepositoryImpl(getIt()));
  getIt.registerLazySingleton<PokemonDetailsRemoteDataSource>(() => PokemonDetailsRemoteDataSourceImpl(getIt<Dio>()));
  getIt.registerFactory<GetPokemonDetailsUseCase>(() => GetPokemonDetailsUseCase(getIt<PokemonDetailsRepository>()));
  getIt.registerFactory<PokemonDetailsCubit>(() => PokemonDetailsCubit());
}
