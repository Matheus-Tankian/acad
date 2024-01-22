import 'dart:convert';

class AuthResponseModel {
  final String token;
  final String userId;
  final String name;

  AuthResponseModel(
    this.token,
    this.userId,
    this.name,
  );

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'token': token});
    result.addAll({'userId': userId});
    result.addAll({'name': name});
    return result;
  }

  factory AuthResponseModel.fromMap(Map<String, dynamic> map) {
    return AuthResponseModel(
      map['token'] ?? '',
      map['userId'] ?? '',
      map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromJson(String? source) {
    source ??= '{"token":"","userId":""}';
    return AuthResponseModel.fromMap(json.decode(source));
  }
}
