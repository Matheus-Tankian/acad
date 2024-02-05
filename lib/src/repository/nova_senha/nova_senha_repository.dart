import 'package:acad/src/models/nova_senha/nova_senha_model.dart';
import 'package:acad/src/services/http/api_base.dart';
import 'package:acad/src/utils/api_urls.dart';
import 'package:acad/src/utils/hive_box.dart';
import 'package:hive/hive.dart';

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
