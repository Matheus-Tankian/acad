import 'package:sipaealuno/src/core/app_colors.dart';
import 'package:sipaealuno/src/models/noticia/noticia_model.dart';

final List<NoticiaModel> noticiasMock = [
  NoticiaModel(
    data: '12 de Janeiro',
    title: 'Dia do livro',
    infoText:
        'Todos da nossa equipe escolar convida todos para uma boa leitura nesse lindo dia do livro haverá lanches e muita diversão lindo dia do livro haverá lanches e muita diversão lindo dia do livro haverá lanches e muita diversão',
    tagLabel: 'Evento',
    tagColor: AppColors.purple,
  ),
  NoticiaModel(
    data: '14 de Janeiro',
    title: 'Dia do lixero',
    infoText:
        'Todos da nossa equipe escolar convida todos para uma boa leitura nesse lindo dia do livro haverá lanches e muita diversão lindo dia do livro haverá lanches e muita diversão lindo dia do livro haverá lanches e muita diversão',
    tagLabel: 'Comunicado',
    tagColor: AppColors.red,
    imgsList: imgListMock,
  ),
  NoticiaModel(
    data: '15 de Janeiro',
    title: 'Dia da arvore',
    infoText:
        'Todos da nossa equipe escolar convida todos para uma boa leitura nesse lindo dia do livro haverá lanches e muita diversão lindo dia do livro haverá lanches e muita diversão lindo dia do livro haverá lanches e muita diversão',
    tagLabel: 'Notícia',
    tagColor: AppColors.green,
  ),
  NoticiaModel(
    data: '15 de Janeiro',
    title: 'Dia do programador',
    infoText:
        'Todos da nossa equipe escolar convida todos para uma boa leitura nesse lindo dia do livro haverá lanches e muita diversão lindo dia do livro haverá lanches e muita diversão lindo dia do livro haverá lanches e muita diversão',
    tagLabel: 'Notícia',
    tagColor: AppColors.purple,
    imgsList: imgListMock,
  ),
];

final List<String> imgListMock = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
