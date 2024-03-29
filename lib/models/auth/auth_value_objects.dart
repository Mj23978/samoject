import 'package:dartz/dartz.dart';

import 'value_object.dart';
import 'auth_failures.dart';
import '../../core/states/auth_value_validators.dart';

class EmailAddress extends ValueObject<String> {
  factory EmailAddress({String? email}) {
    return EmailAddress._(validateEmailAddress(email: email));
  }

  const EmailAddress._(this.valueObject);

  @override
  final Either<AuthValueFailures<String>, String>? valueObject;
}

class Password extends ValueObject<String> {
  factory Password({String? password}) {
    return Password._(validatePassword(password: password));
  }

  const Password._(this.valueObject);

  @override
  final Either<AuthValueFailures<String>, String>? valueObject;
}
