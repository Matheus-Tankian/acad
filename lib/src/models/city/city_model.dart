import 'dart:convert';

class CityModel {
  String? id;
  String? url;
  String? cidade;

  CityModel({
    this.id,
    this.url,
    this.cidade,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
      'cidade': cidade,
    };
  }

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      id: (map['id'] ?? 0).toString(),
      url: (map['url'] ?? '').toString(),
      cidade: (map['cidade'] ?? '').toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CityModel.fromJson(String source) =>
      CityModel.fromMap(json.decode(source));
}
