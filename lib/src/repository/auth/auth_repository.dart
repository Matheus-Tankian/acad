import 'package:sipaealuno/src/models/auth/auth_request_model.dart';
import 'package:sipaealuno/src/models/auth/auth_response_model.dart';
import 'package:sipaealuno/src/services/http/api_base.dart';
import 'package:sipaealuno/src/utils/api_urls.dart';

abstract class AuthRepository {
  Future<AuthResponseModel> authenticate(
      AuthRequestModel authrequest, String baseUrl, String cityUrl);
  Future<String> saveBaseUrl(String url);
}

class AuthRepositoryImpl implements AuthRepository {
  final ApiBaseHelper _apiHelper = ApiBaseHelper();

  @override
  Future<String> saveBaseUrl(String url) async {
    return '';
  }

  @override
  Future<AuthResponseModel> authenticate(
    AuthRequestModel authRequest,
    String baseUrl,
    String cityUrl,
  ) async {
    final response = await _apiHelper.post(
      authUrl,
      authRequest.toMap(),
      cityUrl,
    );

    return AuthResponseModel.fromMap(response);
  }
}
