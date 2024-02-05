import 'package:acad/src/models/ocorrencia/ocorrencia_model.dart';
import 'package:acad/src/services/mocks/ocorrencia_mock.dart';

abstract class OcorrenciaReposity {
  Future<List<OcorrenciaModel>> getAllOcorrencias();
}

class OcorrenciaReposityImpl implements OcorrenciaReposity {
  //final ApiBaseHelper _apiBaseHelper = ApiBaseHelper();
  @override
  Future<List<OcorrenciaModel>> getAllOcorrencias() async {
    //final response = await _apiBaseHelper.get(getOcorrenciasUrl());
    final response = ocorreciaMock;
    Iterable list = response.map((ocorrencias) => ocorrencias.toMap());

    return list
        .map((ocorrencias) => OcorrenciaModel.fromMap(ocorrencias))
        .toList();
  }
}
