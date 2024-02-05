import 'package:hive/hive.dart';
import 'package:sipaealuno/src/models/nova_senha/nova_senha_model.dart';
import 'package:sipaealuno/src/services/http/api_base.dart';
import 'package:sipaealuno/src/utils/api_urls.dart';
import 'package:sipaealuno/src/utils/hive_box.dart';

abstract class NovaSenhaReposity {
  Future<void> postNovaSenha(NovaSenhaModel novaSenhaModel);
}

class NovaSenhaReposityImpl implements NovaSenhaReposity {
  final ApiBaseHelper _apiBaseHelper = ApiBaseHelper();

  Future<String> getUrlCityHive() async {
    var box = await Hive.openBox(hiveBoxCityUrl);
    return box.get('url');
  }

  @override
  Future<void> postNovaSenha(NovaSenhaModel novaSenhaModel) async {
    final urlCity = await getUrlCityHive();
    await _apiBaseHelper.post(baseUrl, novaSenhaModel.toMap(), urlCity);
  }
}
