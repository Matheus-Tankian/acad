import 'package:acad/src/models/Escola/escola_model.dart';
import 'package:acad/src/services/mocks/escola_mock.dart';

abstract class EscolaReposity {
  Future<List<EscolaModel>> getAllEscolas();
}

class EscolaReposityImpl implements EscolaReposity {
  //final ApiBaseHelper _apiBaseHelper = ApiBaseHelper();
  @override
  Future<List<EscolaModel>> getAllEscolas() async {
    //final response = await _apiBaseHelper.get(getEscolasUrl());
    final response = escolasMock;
    Iterable list = response.map((escola) => escola.toMap());

    return list.map((escolas) => EscolaModel.fromMap(escolas)).toList();
  }
}
