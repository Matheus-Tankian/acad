import 'package:flutter/material.dart';
import 'package:sipaealuno/src/models/noticia/noticia_model.dart';
import 'package:sipaealuno/src/repository/noticia/noticia_repository.dart';

class NoticiaViewModel extends ChangeNotifier {
  final NoticiaReposity _noticiaReposity;
  bool _disposed = false;

  List<NoticiaModel> _noticias = [];
  List<NoticiaModel> get noticias => _noticias;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  NoticiaViewModel(this._noticiaReposity) {
    loading();
  }

  void changeNoticias(List<NoticiaModel> value) async {
    _noticias = value;
    notifyListeners();
  }

  void changeIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> loading() async {
    await getNoticias();
    await Future.delayed(
      const Duration(seconds: 1),
    );
    changeIsLoading(true);
  }

  Future<List<NoticiaModel>> getNoticias() async {
    final result = await _noticiaReposity.getAllNoticias();

    changeNoticias(result);

    return result;
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }
}
