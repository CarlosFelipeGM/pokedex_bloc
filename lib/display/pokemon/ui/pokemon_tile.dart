import 'package:flutter/material.dart';
import 'package:pokedex_bloc/data/models/pokemon_model.dart';
import 'package:pokedex_bloc/display/pokemon/screens/pantalla_detalle_pokemon.dart';

class PokemonTile extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonTile({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(pokemon.image),
      title: Text(pokemon.name.toUpperCase()),
      subtitle: Text(pokemon.url),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PantallaDetallePokemon(pokemon: pokemon),
          ),
        );
      },
    );
  }
}
