import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

import '../../models/auth/auth_value_objects.dart';
import '../../models/errors.dart';
import '../../models/user/user.dart';
import '../states/auth_failures.dart';
import 'app_provider.dart';
import 'auth_i_facade.dart';

class MockAuthFacade implements IAuthFacade {
  MockAuthFacade(this.app);

  final AppProvider app;

  @override
  Future<Either<AuthFailures, Unit>> registerWithEmailAndPassword(
      {required EmailAddress? emailAddress,
      required Password? password}) async {
    final emailAddressString = emailAddress!.valueObject!
        .fold((l) => throw UnExpectedValueError(l), id);
    final passwordString =
        password!.valueObject!.fold((l) => throw UnExpectedValueError(l), id);
    try {
      User user = User(
        id: Uuid().v4(),
        email: emailAddressString,
        password: passwordString,
        username: "${emailAddressString.split('@')[0]}}",
        active: true,
        date: DateTime.now(),
      );
      await app.configsStore.addMe(user);
      return right(unit);
    } catch (e) {
      return left(const AuthFailures.serverError());
    }
  }

  @override
  Future<Either<AuthFailures, Unit>> signInWithEmailAndPassword(
      {required EmailAddress? emailAddress,
      required Password? password}) async {
    final emailAddressString = emailAddress!.valueObject!
        .fold((l) => throw UnExpectedValueError(l), id);
    final passwordString =
        password!.valueObject!.fold((l) => throw UnExpectedValueError(l), id);
    try {
      if (app.configsStore.getMe() == null) {
        return (left(AuthFailures.invalidEmailAndPasswordCombination()));
      }
      if (app.configsStore.getMe()!.email == emailAddressString &&
          (app.configsStore.getMe()!.password == null || app.configsStore.getMe()!.password == passwordString)) {
        return right(unit);
      }
      throw Error();
    } catch (e) {
      return left(const AuthFailures.serverError());
    }
  }

  @override
  Future<User?> getSignedInUser() async {
    return app.configsStore.getMe();
  }

  @override
  Future<void> signOut() async {}
}
