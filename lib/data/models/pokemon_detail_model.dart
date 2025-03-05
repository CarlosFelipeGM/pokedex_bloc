class PokemonDetailModel {
  final List<String> types;

  PokemonDetailModel({
    required this.types,
  });

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) {
    return PokemonDetailModel(
      types: (json['types'] as List)
          .map((type) => type['type']['name'].toString())
          .toList(),
    );
  }
}
