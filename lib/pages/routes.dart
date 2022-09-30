import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home/home_page.dart';
import 'settings/settings_page.dart';
import 'splash_view.dart';

final navigationToSecondProvider = StateProvider<bool>((ref) => false);

class HomeLocation extends BeamLocation<BeamState> {

  @override
  List<Pattern> get pathPatterns => [
    '/',
    '/home',  
    '/settings',  
  ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(key: ValueKey("Splash"), child: SplashView()),
      if (state.uri.pathSegments.contains("home"))
        BeamPage(key: ValueKey("Home"), child: HomeView()),
      if (state.uri.pathSegments.contains("settings"))
        BeamPage(key: ValueKey("Settings"), child: SettingsView()),
    ];
  }
}