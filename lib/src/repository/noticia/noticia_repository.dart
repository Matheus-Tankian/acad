import 'package:acad/src/models/noticia/noticia_model.dart';
import 'package:acad/src/services/mocks/noticia_mock.dart';

abstract class NoticiaReposity {
  Future<List<NoticiaModel>> getAllNoticias();
}

class NoticiaReposityImpl implements NoticiaReposity {
  // final ApiBaseHelper _apiBaseHelper = ApiBaseHelper();
  @override
  Future<List<NoticiaModel>> getAllNoticias() async {
    // final response = await _apiBaseHelper.get(getNoticiasUrl());
    final response = noticiasMock;
    Iterable list = response.map((noticia) => noticia.toMap());

    return list.map((noticias) => NoticiaModel.fromMap(noticias)).toList();
  }
}
