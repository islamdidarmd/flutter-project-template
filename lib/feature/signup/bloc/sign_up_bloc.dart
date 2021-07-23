import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_template/common/data/model/result.dart';
import 'package:flutter_project_template/feature/signup/bloc/sign_up_event.dart';

import 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState());

  bool _isTermsAccepted = false;

  bool get isTermsAccepted => _isTermsAccepted;

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is TermsClickedEvent) {
      this._isTermsAccepted = event.isAccepted;
      yield TermsStateChange();
    } else if (event is EmailPassSignUpEvent) {
      yield SignUpLoadingState();
      final result = await _signupWithEmailPass(
          event.email, event.password, event.rePassword);
      if(result is Success){
        yield SignUpSuccessState();
      }else{
        yield SignUpFailedState(result);
      }
    }
  }

  Future<Result> _signupWithEmailPass(
      String email, String password, String rePassword) async {
    if (email.isEmpty || password.isEmpty) {
      return Error(
          showSnackBar: true,
          info: Info(message: 'Please enter email and password'));
    } else if (password != rePassword) {
      return Error(
          showSnackBar: true, info: Info(message: 'Passwords do not match'));
    }

    return Success(showSnackBar: true, info: Info(message: 'Login Successful'));
  }
}
