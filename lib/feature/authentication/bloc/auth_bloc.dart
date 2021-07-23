import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_template/common/data/model/result.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is CheckAuthStateEvent) {
      yield AuthLoadingState();
      final result = await _checkIfLoggedIn();
      if (result) {
        yield AuthAuthenticatedState();
      } else {
        yield AuthUnAuthenticatedState();
      }
    } else if (event is AuthSignOutEvent) {
      yield AuthLoadingState();
      await _signOut();
      yield AuthUnAuthenticatedState();
    }
  }

  Future<bool> _checkIfLoggedIn() async {
    bool isLoggedIn = false;
    await Future.delayed(Duration.zero);
    return isLoggedIn;
  }

  Future<Result> _signOut() async {
    return Success();
  }
}
