import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sipaealuno/src/models/city/city_model.dart';
import 'package:sipaealuno/src/utils/api_urls.dart';

abstract class CityReposity {
  Future<List<CityModel>> getAllCities();
}

class CityReposityImpl implements CityReposity {
  @override
  Future<List<CityModel>> getAllCities() async {
    final response = await http.get(Uri.parse(cityUrl));

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);

      return list.map((cities) => CityModel.fromMap(cities)).toList();
    } else {
      throw Exception('Falha ao carregar os dados da API');
    }
  }
}
