import 'package:flutter/material.dart';
import 'package:samoject/models/enums.dart';

import 'home_provider.dart';

class SpaceProvider extends ChangeNotifier {
  SpaceProvider(this.home);

  HomeProvider home;

  dchome() {
    final spaceType = home.selectedSpace!.map(
      (v) => v.spaceType,
      box: (v) => v.spaceType,
      boxSettings: (v) => SpaceType.none,
      view: (v) => SpaceType.none,
    );
  }
}
