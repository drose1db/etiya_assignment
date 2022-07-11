class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "https://pokeapi.co/api/v2";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;

  static String getPokemonImageUrl(int? id) {
    return "https://cdn.traction.one/pokedex/pokemon/$id.png";
  }

  static String getPokemonList({required int limit}) => Uri(
        path: "/pokemon",
        queryParameters: {
          "limit": limit.toString(),
        },
      ).toString();

  static String getPokemonSpeciesById({required int id}) => Uri(
        path: "/pokemon-species/$id",
      ).toString();
}
