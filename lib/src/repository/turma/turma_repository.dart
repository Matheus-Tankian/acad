import 'package:acad/src/models/turma/turma_model.dart';
import 'package:acad/src/services/mocks/turma_mock.dart';

abstract class TurmaReposity {
  Future<List<TurmaModel>> getAllTurmas();
}

class TurmaReposityImpl implements TurmaReposity {
  //final ApiBaseHelper _apiBaseHelper = ApiBaseHelper();
  @override
  Future<List<TurmaModel>> getAllTurmas() async {
    // final response = await _apiBaseHelper.get(getTurmasUrl());
    final response = turmasMock;
    Iterable list = response.map((turma) => turma.toMap());

    return list.map((turma) => TurmaModel.fromMap(turma)).toList();
  }
}
