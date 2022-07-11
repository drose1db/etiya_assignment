import 'package:dio/dio.dart';
import 'package:etiya_assignment/features/pokemon_details/data/datasource/pokemon_details_remote_data_source.dart';
import 'package:etiya_assignment/features/pokemon_details/domain/model/pokemon_details_model.dart';
import 'package:etiya_assignment/network/endpoints.dart';

class PokemonDetailsRemoteDataSourceImpl implements PokemonDetailsRemoteDataSource {
  final Dio dio;

  PokemonDetailsRemoteDataSourceImpl(this.dio);

  @override
  Future<PokemonDetails> getPokemonDetails({required int id}) async {
    final response = await dio.get(Endpoints.getPokemonSpeciesById(id: id));
    return PokemonDetails.fromJson(response.data);
  }
}
