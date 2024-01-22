import 'package:sipaealuno/src/models/materia/materia_model.dart';
import 'package:sipaealuno/src/services/mocks/materia_mock.dart';

abstract class MateriaReposity {
  Future<AlunoNotaModel> getAllMaterias(int idEscola, int idTurma);
}

class MateriaReposityImpl implements MateriaReposity {
  // final ApiBaseHelper _apiBaseHelper = ApiBaseHelper();
  @override
  Future<AlunoNotaModel> getAllMaterias(int idEscola, int idTurma) async {
    //final response = await _apiBaseHelper.get(getMateriasUrl(1, 2));
    final key = '$idEscola-$idTurma';
    // final response = alunoNotaMock.containsKey(key) ? alunoNotaMock[key] : null;

    if (alunoNotaMock.containsKey(key)) {
      return Future.value(alunoNotaMock[key]);
    } else {
      return Future.error(
          'Não há dados mock para idEscola: $idEscola e idTurma: $idTurma');
    }
  }
}

 

  // @override
  // Future<AlunoNotaModel> postTurmaEscola(
  //     String url, AlunoNotaModel alunoNota) async {
  //   //final response = await _apiBaseHelper.post(baseUrl, alunoNota.toMap());

  //   final response = json.decode(mockedPostResult);

  //   await Future.delayed(const Duration(seconds: 1));

  //   return AlunoNotaModel.fromMap(response);
  // }