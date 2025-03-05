import 'package:pokedex_bloc/data/services/pokemon_service.dart';
import 'package:pokedex_bloc/data/models/pokemon_model.dart';

class PokemonRepository {
  final PokemonService pokemonService;

  PokemonRepository(this.pokemonService);

  Future<List<PokemonModel>> fetchPokemonList(int offset, int limit) async {
    final data = await pokemonService.getPokemons(offset: offset, limit: limit);
    return (data['results'] as List)
        .map((json) => PokemonModel.fromJson(json))
        .toList();
  }
}
