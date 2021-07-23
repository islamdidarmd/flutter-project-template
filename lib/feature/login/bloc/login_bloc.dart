import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_template/common/data/model/result.dart';
import 'package:flutter_project_template/feature/login/bloc/login_event.dart';
import 'package:flutter_project_template/feature/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginWithEmailPassEvent) {
      yield LoginLoadingState();
      final result = await _tryLoginWithEmailPass(event.email, event.pass);
      if (result is Success) {
        yield LoginSuccessState();
      } else {
        yield LoginFailedState(result);
      }
    }
  }

  Future<Result> _tryLoginWithEmailPass(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      return Error(
          showSnackBar: true,
          info: Info(message: 'Please enter email and password'));
    }

    Result result =
        Success(showSnackBar: true, info: Info(message: 'Login Successful'));
    return result;
  }
}
