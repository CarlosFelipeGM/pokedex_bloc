import 'package:dio/dio.dart';
import 'package:pokedex_bloc/core/configs.dart';

class PokemonService {
  final Dio _dio = Dio(BaseOptions(baseUrl: Config.baseUrl));

  Future<Map<String, dynamic>> getPokemons(
      {int offset = 0, int limit = 20}) async {
    final response = await _dio
        .get('pokemon', queryParameters: {'offset': offset, 'limit': limit});
    return response.data;
  }
}
