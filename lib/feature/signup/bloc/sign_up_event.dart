class SignUpEvent {}

class TermsClickedEvent extends SignUpEvent {
  final bool isAccepted;

  TermsClickedEvent({required this.isAccepted});
}

class EmailPassSignUpEvent extends SignUpEvent {
  final String email;
  final String password;
  final String rePassword;

  EmailPassSignUpEvent(
      {required this.email, required this.password, required this.rePassword});
}