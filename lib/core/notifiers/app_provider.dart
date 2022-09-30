import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import '../../models/user/user.dart';
import '../../../utils/keys.dart';

class AppProvider extends ChangeNotifier {
  Box conf = Hive.box(DBKeys.hive_config);

  close() async {}

  void setPlayers(input) {
    notifyListeners();
  }

  void setRoles(List<String> input) {
    notifyListeners();
  }

}
