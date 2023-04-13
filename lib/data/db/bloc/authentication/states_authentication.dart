abstract class AuthenticationState {
  const AuthenticationState();
}

//initState auth_false

//authing auth_false

//auth aut_true

class AuthenticationInitial extends AuthenticationState {
  const AuthenticationInitial();
}

class AuthenticationAuthing extends AuthenticationState {
  const AuthenticationAuthing();
}

class AuthenticationAuth extends AuthenticationState {
  const AuthenticationAuth();
}

class AuthenticationError extends AuthenticationState {
  final String message;
  const AuthenticationError(this.message);
}
