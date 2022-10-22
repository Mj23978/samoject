import 'package:beamer/beamer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_strategy/url_strategy.dart';

import 'core/providers.dart';
import 'pages/not_found/not_found_view.dart';
import 'pages/routes.dart';
import 'utils/helpers.dart';
import 'utils/keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setPathUrlStrategy();

  if (!kIsWeb) {
    final appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
  } else {
    Hive.initFlutter();
  }
  await Hive.openBox(DBKeys.app_config);
  await Hive.openBox(DBKeys.hive_config);
  await Hive.openBox(DBKeys.users);
  initConfig();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale("en", "US"), Locale("fa", "IR")],
      path: 'assets/translations',
      fallbackLocale: Locale("en", "US"),
      child: ProviderScope(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final app = ref.read(appProvider);
    useMemoized(() async {
      await app.initApp();
    }, []);
    final parser = useMemoized(BeamerParser.new);
    final routerDelegate = useMemoized(() {
      return BeamerDelegate(
        initialPath: (app.configsStore.showSplash ?? false) ? (app.configsStore.me != null) ? '/home' : '/auth' : '/',
        locationBuilder: BeamerLocationBuilder(beamLocations: [
          HomeLocation(),
        ]),
        notFoundPage: BeamPage(key: ValueKey("404"), child: NotFoundPage()),
        // guards: [
        //   BeamGuard(
        //     pathPatterns: ['/$firstRoute/$secondRoute'],
        //     check: (_, __) => read(navigationToSecondProvider).state,
        //   ),
        // ],
      );
    });

    return ValueListenableBuilder<Box>(
        valueListenable: Hive.box(DBKeys.hive_config).listenable(),
        builder: (context, box, child) {
          // var locale = box.get("local").split("_");
          // print(locale);
          return MaterialApp.router(
            routeInformationParser: parser,
            routerDelegate: routerDelegate,
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            // backButtonDispatcher: BeamerBackButtonDispatcher(delegate: routerDelegate),
            backButtonDispatcher:
                BeamerBackButtonDispatcher(delegate: routerDelegate),
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              ...context.localizationDelegates,
            ],
            debugShowCheckedModeBanner: false,
            theme: mDefaultTheme,
          );
        });
  }
}

final ThemeData mDefaultTheme = ThemeData(
  primaryColor: string2Color('#0a0a0a'),
);

initConfig() {
  Box conf = Hive.box(DBKeys.hive_config);
  if (!conf.get("initialized", defaultValue: false)) {
    conf.put("initialized", true);
    conf.put("local", Locale("fa", "IR").toString());
  }
}
