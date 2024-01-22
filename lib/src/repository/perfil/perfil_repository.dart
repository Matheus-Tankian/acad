import 'package:sipaealuno/src/models/perfil/perfil_model.dart';
import 'package:sipaealuno/src/services/mocks/perfil_mock.dart';

abstract class PerfilReposity {
  Future<PerfilModel> getPerfil();
}

class PerfilReposityImpl implements PerfilReposity {
  // final ApiBaseHelper _apiBaseHelper = ApiBaseHelper();
  @override
  Future<PerfilModel> getPerfil() async {
    // final response = await _apiBaseHelper.get(getPerfilUrl());

    final response = perfilMock;

    return response;
  }
}
