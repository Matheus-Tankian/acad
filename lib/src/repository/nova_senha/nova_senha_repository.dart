import 'package:sipaealuno/src/models/nova_senha/nova_senha_model.dart';
import 'package:sipaealuno/src/services/http/api_base.dart';
import 'package:sipaealuno/src/utils/api_urls.dart';

abstract class NovaSenhaReposity {
  Future<void> postNovaSenha(NovaSenhaModel novaSenhaModel);
}

class NovaSenhaReposityImpl implements NovaSenhaReposity {
  final ApiBaseHelper _apiBaseHelper = ApiBaseHelper();
  @override
  Future<void> postNovaSenha(NovaSenhaModel novaSenhaModel) async {
    await _apiBaseHelper.post(baseUrl, novaSenhaModel.toMap());
  }
}
