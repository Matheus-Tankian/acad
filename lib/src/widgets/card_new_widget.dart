import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sipaealuno/src/core/app_colors.dart';
import 'package:sipaealuno/src/core/app_fonts.dart';
import 'package:sipaealuno/src/widgets/tag_widget.dart';

class NewCradWidget extends StatefulWidget {
  final String title;
  final String infoText;
  final String data;
  final String tagName;
  final Color tagColor;
  final List<String>? imgsList;
  final double spacer;

  const NewCradWidget({
    super.key,
    required this.title,
    required this.infoText,
    required this.data,
    required this.tagName,
    required this.tagColor,
    this.imgsList,
    this.spacer = 8,
  });

  @override
  State<NewCradWidget> createState() => _NewCradWidgetState();
}

class _NewCradWidgetState extends State<NewCradWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(
              strokeAlign: 1,
              color: AppColors.gray,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: widget.imgsList!.isNotEmpty,
                child: SizedBox(
                  child: Visibility(
                    visible: widget.imgsList!.isNotEmpty,
                    replacement: const SizedBox(),
                    child: CarouselWithIndicatorDemo(
                      imgsList: widget.imgsList!,
                    ),
                  ),
                ),
              ),
              Text(
                widget.title,
                style: AppFonts.text22Semibold,
              ),
              const SizedBox(height: 12),
              Text(
                widget.infoText,
                style: AppFonts.text14Regular,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TagWidget(
                    label: widget.tagName,
                    backgroundColor: widget.tagColor,
                  ),
                  Text(
                    widget.data,
                    style: AppFonts.text14Regular,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: widget.spacer),
      ],
    );
  }
}

class CarouselWithIndicatorDemo extends StatefulWidget {
  final List<String> imgsList;

  const CarouselWithIndicatorDemo({
    super.key,
    required this.imgsList,
  });

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = widget.imgsList;

    final List<Widget> imageSliders = imgList
        .map((item) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: SizedBox(
                child: Center(
                  child: Image.network(
                    item,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return const Center(
                          child:
                              CircularProgressIndicator(color: AppColors.gray),
                        );
                      }
                    },
                  ),
                ),
              ),
            ))
        .toList();

    return Column(children: [
      CarouselSlider(
        items: imageSliders,
        carouselController: _controller,
        options: CarouselOptions(
          height: 300,
          enlargeCenterPage: false,
          aspectRatio: 1.0,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          },
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imgList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 6.0,
              height: 6.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black)
                    .withOpacity(_current == entry.key ? 0.9 : 0.4),
              ),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}

class NewsItens {
  final String title;
  final String infoText;
  final String data;
  final String tagName;
  final Color tagColor;
  final List<String>? imgsList;

  NewsItens({
    required this.title,
    required this.infoText,
    required this.data,
    required this.tagName,
    required this.tagColor,
    this.imgsList,
  });
}
