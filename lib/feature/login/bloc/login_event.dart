class LoginEvent{}

class LoginWithEmailPassEvent extends LoginEvent {
  final String email;
  final String pass;

  LoginWithEmailPassEvent(this.email, this.pass);
}