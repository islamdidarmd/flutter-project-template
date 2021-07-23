import 'package:flutter_project_template/common/data/model/result.dart';

class LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginFailedState extends LoginState {
  final Result data;

  LoginFailedState(this.data);
}
