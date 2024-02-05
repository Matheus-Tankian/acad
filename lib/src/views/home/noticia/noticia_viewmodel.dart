import 'package:acad/src/models/noticia/noticia_model.dart';
import 'package:acad/src/repository/noticia/noticia_repository.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';


class NoticiaViewModel extends ChangeNotifier {
  final NoticiaReposity _noticiaReposity;
  final int _indexItem;
  bool _disposed = false;

  List<NoticiaModel> _noticias = [];
  List<NoticiaModel> get noticias => _noticias;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final ItemScrollController scrollController = ItemScrollController();

  NoticiaViewModel(this._noticiaReposity, this._indexItem) {
    loading();
  }

  void animatedScrollController() {
    scrollController.scrollTo(
      index: _indexItem,
      duration: const Duration(seconds: 1),
    );
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
    await Future.delayed(
      const Duration(milliseconds: 200),
    );
    animatedScrollController();
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
