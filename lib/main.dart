import 'package:acad/src/app.dart';
import 'package:acad/src/utils/hive_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:path_provider/path_provider.dart';


void main() {
  initializeDateFormatting('pt_BR', null).then((_) async {
    WidgetsFlutterBinding.ensureInitialized();
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    await Hive.openBox(hiveAuthBoxName);
    await Hive.openBox(hiveBoxCityUrl);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    runApp(const App());
  });
}
