import 'dart:convert';

class PokemonModel {
  final String name;
  final String url;
  final String image;

  PokemonModel({required this.name, required this.url, required this.image});

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      name: json['name'],
      url: json['url'],
      image:
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${_getIdFromUrl(json['url'])}.png",
    );
  }

  static String _getIdFromUrl(String url) {
    final parts = url.split('/');
    return parts[parts.length - 2];
  }
}

List<PokemonModel> parsePokemonList(String responseBody) {
  final parsed = json.decode(responseBody);
  return (parsed['results'] as List)
      .map((json) => PokemonModel.fromJson(json))
      .toList();
}
