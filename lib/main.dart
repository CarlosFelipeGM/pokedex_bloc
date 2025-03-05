import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_bloc/data/services/pokemon_service.dart';
import 'package:pokedex_bloc/display/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokedex_bloc/data/repositories/pokemon_repository.dart';
import 'package:pokedex_bloc/display/pokemon/screens/pantalla_listado_pokemones.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PokemonBloc(PokemonRepository(PokemonService())),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokedex App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: PantallaListadoPokemones(),
      ),
    );
  }
}
