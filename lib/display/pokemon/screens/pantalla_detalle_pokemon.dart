import 'package:flutter/material.dart';
import 'package:pokedex_bloc/data/models/pokemon_model.dart';

class PantallaDetallePokemon extends StatelessWidget {
  final PokemonModel pokemon;

  const PantallaDetallePokemon({required this.pokemon, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name.toUpperCase()),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              pokemon.image,
              height: 200,
              fit: BoxFit.cover,
            ),
            Text(pokemon.name),
            Text(pokemon.id),
            Text(pokemon.url),
          ],
        ),
      ),
    );
  }
}
