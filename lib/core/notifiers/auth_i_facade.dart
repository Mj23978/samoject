import 'package:dartz/dartz.dart';

import '../../models/user/user.dart';
import '../states/auth_failures.dart';
import '../../models/auth/auth_value_objects.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailures, Unit>> registerWithEmailAndPassword(
      {required EmailAddress? emailAddress, required Password? password});

  Future<Either<AuthFailures, Unit>> signInWithEmailAndPassword(
      {required EmailAddress? emailAddress, required Password? password});

  Future<User?> getSignedInUser();

  Future<void> signOut();
}
