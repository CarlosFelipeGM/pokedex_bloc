part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  @override
  List<Object> get props => [];
}

class PokemonInitial extends PokemonState {}

class PokemonLoading extends PokemonState {
  final List<PokemonModel> oldPokemons;
  final bool isFirstFetch;

  PokemonLoading(this.oldPokemons, {this.isFirstFetch = false});
}

class PokemonLoaded extends PokemonState {
  final List<PokemonModel> pokemones;

  PokemonLoaded(this.pokemones);
}

class PokemonError extends PokemonState {
  final String message;

  PokemonError(this.message);
}
