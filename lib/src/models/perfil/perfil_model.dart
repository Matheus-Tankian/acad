import 'dart:convert';

class PerfilModel {
  final String? userName;
  final String? userEmail;
  final String? userTelefone;
  final String? userNivel;
  final String? userAcesso;

  PerfilModel({
    this.userName,
    this.userEmail,
    this.userTelefone,
    this.userNivel,
    this.userAcesso,
  });

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'userEmail': userEmail,
      'userTelefone': userTelefone,
      'userNivel': userNivel,
      'userAcesso': userAcesso,
    };
  }

  factory PerfilModel.fromMap(Map<String, dynamic> map) {
    return PerfilModel(
      userName: (map['userName'] ?? '').toString(),
      userEmail: (map['userEmail'] ?? '').toString(),
      userTelefone: (map['userTelefone'] ?? '').toString(),
      userNivel: (map['userNivel'] ?? '').toString(),
      userAcesso: (map['userAcesso'] ?? '').toString(),
    );
  }

  factory PerfilModel.empty() => PerfilModel(
        userEmail: '',
        userAcesso: '',
        userName: '',
        userNivel: '',
        userTelefone: '',
      );

  String toJson() => json.encode(toMap());

  factory PerfilModel.fromJson(String source) =>
      PerfilModel.fromMap(json.decode(source));
}
