import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sipaealuno/src/core/app_colors.dart';
import 'package:sipaealuno/src/repository/noticia/noticia_repository.dart';
import 'package:sipaealuno/src/views/home/noticia/noticia_viewmodel.dart';
import 'package:sipaealuno/src/widgets/card_new_widget.dart';

class NoticiaView extends StatelessWidget {
  final int indexSelected;
  const NoticiaView({
    super.key,
    required this.indexSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NoticiaViewModel>(
      create: (_) => NoticiaViewModel(
        NoticiaReposityImpl(),
        indexSelected,
      ),
      child: Consumer<NoticiaViewModel>(
        builder: (_, provider, __) => Scaffold(
          appBar: AppBar(
            title: const Text('Noticias'),
            backgroundColor: AppColors.peachFury5,
          ),
          body: Visibility(
            visible: provider.isLoading,
            replacement: const Center(
              child: CircularProgressIndicator(
                color: AppColors.peachFury5,
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: ScrollablePositionedList.builder(
                    itemScrollController: provider.scrollController,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 10,
                    ),
                    itemCount: provider.noticias.length,
                    itemBuilder: (context, index) {
                      return NewCradWidget(
                        title: provider.noticias[index].title,
                        infoText: provider.noticias[index].infoText,
                        data: provider.noticias[index].data,
                        tagName: provider.noticias[index].tagLabel,
                        tagColor: provider.noticias[index].tagColor,
                        imgsList: provider.noticias[index].imgsList,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
