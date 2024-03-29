import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:samoject/config/database/configs_store.dart';

import 'logger.dart';
import 'notifiers/app_provider.dart';
import 'notifiers/auth_state_controller.dart';
import 'notifiers/cache_auth_facade.dart';
import 'notifiers/home_provider.dart';
import 'notifiers/space_provider.dart';
import 'notifiers/splash_provider.dart';
import 'states/auth_states.dart';

final ProviderFamily<Logger, String> loggerProvider =
    Provider.family<Logger, String>((ref, scope) {
  return getLogger(scope);
});

late final Provider<ConfigsStore> configsProvider;

final appProvider = Provider(
  (ref) => AppProvider(ref.watch(configsProvider)),
);

final homeProvider = ChangeNotifierProvider((ref) {
  return HomeProvider(ref.watch(appProvider));
});

final spaceProvider = ChangeNotifierProvider((ref) {
  return SpaceProvider(ref.watch(homeProvider));
});

final splashProvider =
    StateNotifierProvider<SplashNotifier, SplashState>((ref) {
  return SplashNotifier();
});

final loginProvider =
    StateNotifierProvider<AuthStateController, AuthStates>((ref) {
  final mockAuthFacade = MockAuthFacade(ref.watch(appProvider));
  return AuthStateController(mockAuthFacade, ref.watch(appProvider));
});
