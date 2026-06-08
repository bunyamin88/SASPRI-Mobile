import '../models/user.dart';
import '../helper/enum.dart';


class AuthState {
  final AuthStatus status;

  final String? token;

  final User? user;

  const AuthState({
    this.status =
        AuthStatus.unauthenticated,
    this.token,
    this.user,
  });

  AuthState copyWith({
    AuthStatus? status,
    String? token,
    User? user,
  }) {
    return AuthState(
      status: status ?? this.status,
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }
}