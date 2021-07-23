import 'package:flutter_project_template/common/data/model/result.dart';

class SignUpState {}

class TermsStateChange extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {}

class SignUpFailedState extends SignUpState {
  final Result data;

  SignUpFailedState(this.data);
}
