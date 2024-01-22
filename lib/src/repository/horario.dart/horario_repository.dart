import 'package:sipaealuno/src/models/horario/horario_model.dart';
import 'package:sipaealuno/src/services/mocks/horario_mock.dart';

abstract class DiaReposity {
  Future<List<DiaModel>> getAllHorario();
}

class DiaReposityImpl implements DiaReposity {
  //final ApiBaseHelper _apiBaseHelper = ApiBaseHelper();
  @override
  Future<List<DiaModel>> getAllHorario() async {
    //final response = await _apiBaseHelper.get(getMateriasUrl(1, 2));
    final response = diasMock;
    Iterable list = response.map((dia) => dia.toMap());

    return list.map((dias) => DiaModel.fromMap(dias)).toList();
  }
}
