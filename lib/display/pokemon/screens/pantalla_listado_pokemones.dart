import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_bloc/display/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokedex_bloc/display/pokemon/ui/pokemon_tile.dart';

class PantallaListadoPokemones extends StatefulWidget {
  const PantallaListadoPokemones({super.key});

  @override
  State<PantallaListadoPokemones> createState() =>
      _PantallaListadoPokemonesState();
}

class _PantallaListadoPokemonesState extends State<PantallaListadoPokemones> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    context.read<PokemonBloc>().add(LoadPokemonList());
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<PokemonBloc>().add(LoadPokemonList());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonInitial ||
              (state is PokemonLoading && state.isFirstFetch)) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is PokemonError) {
            return Center(child: Text(state.message));
          }

          List pokemones = (state is PokemonLoaded)
              ? state.pokemones
              : (state as PokemonLoading).oldPokemons;

          return ListView.builder(
            controller: _scrollController,
            itemCount: pokemones.length + (state is PokemonLoading ? 1 : 0),
            itemBuilder: (context, index) {
              if (index >= pokemones.length) {
                return Center(child: CircularProgressIndicator());
              }
              return PokemonTile(pokemon: pokemones[index]);
            },
          );
        },
      ),
    );
  }
}
