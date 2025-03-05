import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex_bloc/data/models/pokemon_model.dart';
import 'package:pokedex_bloc/data/repositories/pokemon_repository.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepository pokemonRepository;
  int offset = 0;
  static const int limit = 20;

  PokemonBloc(this.pokemonRepository) : super(PokemonInitial()) {
    on<LoadPokemonList>((event, emit) async {
      if (state is PokemonLoading) return;

      final currentState = state;
      List<PokemonModel> oldPokemons = [];
      if (currentState is PokemonLoaded) {
        oldPokemons = currentState.pokemones;
      }

      emit(PokemonLoading(oldPokemons, isFirstFetch: offset == 0));

      try {
        final newPokemons =
            await pokemonRepository.fetchPokemonList(offset, limit);
        offset += limit;
        emit(PokemonLoaded(oldPokemons + newPokemons));
      } catch (e) {
        emit(PokemonError("Error en obtener Pokemones"));
      }
    });
  }
}
