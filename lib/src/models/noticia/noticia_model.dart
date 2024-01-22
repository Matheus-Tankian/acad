import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';

class NoticiaModel {
  final String data;
  final String title;
  final String infoText;
  final String tagLabel;
  final Color tagColor;
  final List<String>? imgsList;

  NoticiaModel({
    required this.data,
    required this.title,
    required this.infoText,
    required this.tagLabel,
    this.imgsList,
    required this.tagColor,
  });

  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'title': title,
      'infoText': infoText,
      'tagLabel': tagLabel,
      'tagColor': tagColor.value,
      'imgsList': imgsList,
    };
  }

  factory NoticiaModel.fromMap(Map<String, dynamic> map) {
    return NoticiaModel(
      data: (map['data'] ?? '').toString(),
      title: (map['title'] ?? '').toString(),
      infoText: (map['infoText'] ?? '').toString(),
      tagLabel: (map['tagLabel'] ?? '').toString(),
      tagColor: Color(map['tagColor']),
      imgsList: List<String>.from(map['imgsList'] ?? []),
    );
  }

  String toJson() => json.encode(toMap());

  factory NoticiaModel.fromJson(String source) =>
      NoticiaModel.fromMap(json.decode(source));
}
