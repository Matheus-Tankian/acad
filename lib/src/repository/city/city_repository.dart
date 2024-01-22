import 'package:sipaealuno/src/models/city/city_model.dart';
import 'package:sipaealuno/src/services/http/api_base.dart';
import 'package:sipaealuno/src/utils/api_urls.dart';

abstract class CityReposity {
  Future<List<CityModel>> getAllCities();
}

class CityReposityImpl implements CityReposity {
  final ApiBaseHelper _apiBaseHelper = ApiBaseHelper();

  @override
  Future<List<CityModel>> getAllCities() async {
    final response = await _apiBaseHelper.get(getCitysUrl());

    Iterable list = response;

    return list.map((cities) => CityModel.fromMap(cities)).toList();
  }
}
