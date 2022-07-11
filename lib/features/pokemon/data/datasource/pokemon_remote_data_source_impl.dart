import 'package:dio/dio.dart';
import 'package:etiya_assignment/features/pokemon/data/datasource/pokemon_remote_data_source.dart';
import 'package:etiya_assignment/features/pokemon/domain/models/pokemon_result_model.dart';
import 'package:etiya_assignment/network/endpoints.dart';

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final Dio dio;

  PokemonRemoteDataSourceImpl(this.dio);

  @override
  Future<PokemonResult> getPokemonList({required int limit}) async {
    final response = await dio.get(Endpoints.getPokemonList(limit: limit));
    return PokemonResult.fromJson(response.data);
  }
}
