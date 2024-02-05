import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:acad/src/models/auth/auth_response_model.dart';
import 'package:acad/src/services/http/api_exceptions.dart';
import 'package:acad/src/utils/cache_repository.dart';
import 'package:acad/src/utils/hive_box.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class ApiBaseHelper {
  final _authCache = HiveCache(
    Hive.box(hiveAuthBoxName),
  ).getFromCache(key: hiveAuthBoxKey);

  Future<dynamic> get(String url, String cityUrl) async {
    final auth = AuthResponseModel.fromJson(_authCache);

    final token = 'Bearer ${auth.token}';

    const baseUrl = "https://thirsty-villani.207-246-79-65.plesk.page/api";

    try {
      final response = await http.get(
        Uri.parse('$baseUrl/$url/$cityUrl'),
        headers: {
          HttpHeaders.authorizationHeader: token,
        },
      ).timeout(const Duration(seconds: 7), onTimeout: () {
        throw TimeoutException(
            "Tempo de conexção excedido - Verifique se você tem conexão com a internet!");
      });
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('Sem conexão com a internet');
    }
  }

  Future<dynamic> post(String url, Object? body, String cityUrl) async {
    final auth = AuthResponseModel.fromJson(_authCache);
    final token = 'Bearer ${auth.token}';
    const baseUrl = "https://thirsty-villani.207-246-79-65.plesk.page/api";

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/$url/$cityUrl'),
        body: body,
        headers: {HttpHeaders.authorizationHeader: token},
      ).timeout(const Duration(seconds: 30), onTimeout: () {
        throw TimeoutException(
            "Tempo de conexção excedido - Verifique se você tem conexão com a internet!");
      });

      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('Sem conexão com a internet');
    }
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body);
      case 401:
        throw UnauthorisedException("Credenciais inválidas");
      case 500:
      default:
        throw FetchDataException(
            'Ocorreu um erro durante a comunicação com o servidor com StatusCode : ${response.statusCode}');
    }
  }
}
