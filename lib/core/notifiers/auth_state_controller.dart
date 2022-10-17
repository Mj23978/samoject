import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/auth/auth_value_objects.dart';
import '../states/auth_events.dart';
import '../states/auth_failures.dart';
import '../states/auth_states.dart';
import 'app_provider.dart';
import 'auth_i_facade.dart';

class AuthStateController extends StateNotifier<AuthStates> {
  AuthStateController(this._authFacade, this.app) : super(AuthStates.initial());

  final IAuthFacade _authFacade;
  final AppProvider app;

  Future mapEventsToStates(AuthEvents events) async {
    return events.map(
      emailChanged: (value) async {
        state = state.copyWith(
            emailAddress: EmailAddress(
              email: value.email,
            ),
            authFailureOrSuccess: none());
      },
      getUser: (value) async {
        final user = await  _authFacade.getSignedInUser();
        if (user != null) {
        state = state.copyWith(
          user: user,
          emailAddress: EmailAddress(email: user.email),
          password: Password(password: user.password)
        );
          await _performAuthAction(_authFacade.signInWithEmailAndPassword);
        }
      },
      passwordChanged: (value) async {
        state = state.copyWith(
          password: Password(
            password: value.password,
          ),
          authFailureOrSuccess: none(),
        );
      },
      signUpWithEmailAndPasswordPressed: (value) async {
        await _performAuthAction(
          _authFacade.registerWithEmailAndPassword,
        );
      },
      signInWithEmailAndPasswordPressed: (value) async {
        await _performAuthAction(
          _authFacade.signInWithEmailAndPassword,
        );
      },
    );
  }

  Future _performAuthAction(
    Future<Either<AuthFailures, Unit>> Function(
            {required EmailAddress emailAddress, required Password password})
        forwardCall,
  ) async {
    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();
    Either<AuthFailures, Unit>? failureOrSuccess;
    if (isEmailValid && isPasswordValid) {
      state = state.copyWith(
        isSubmitting: true,
        authFailureOrSuccess: none(),
      );
      failureOrSuccess = await forwardCall(
        emailAddress: state.emailAddress,
        password: state.password,
      );
    }
    state = state.copyWith(
      isSubmitting: false,
      showError: true,
      authFailureOrSuccess: optionOf(failureOrSuccess),
    );
  }
}
