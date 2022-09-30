
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import '../../../utils/keys.dart';
import 'app_provider.dart';

class GameProvider extends ChangeNotifier {
  GameProvider(this._appProvider) {
  }
  final AppProvider _appProvider;

  Box conf = Hive.box(DBKeys.hive_config);

}
