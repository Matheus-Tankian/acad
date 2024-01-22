import 'dart:convert';

import 'package:crypto/crypto.dart';

class AuthRequestModel {
  late final String user;
  late final String password;

  AuthRequestModel({required this.user, required String password}) {
    this.password = passwordEncrypt(password);
  }

  passwordEncrypt(String pass) {
    var salt = '402d10d54sd3dhf4f5314f50f5s324505f';
    var data = utf8.encode('$salt${pass}CC-Santos');
    var passEncrypt = sha1.convert(data);
    return passEncrypt.toString();
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'user': user});
    result.addAll({'password': password});

    return result;
  }

  factory AuthRequestModel.fromMap(Map<String, dynamic> map) {
    return AuthRequestModel(
      user: map['user'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthRequestModel.fromJson(String source) =>
      AuthRequestModel.fromMap(json.decode(source));

  AuthRequestModel copyWith({
    String? user,
    String? password,
  }) {
    return AuthRequestModel(
      user: user ?? this.user,
      password: password ?? this.password,
    );
  }
}
