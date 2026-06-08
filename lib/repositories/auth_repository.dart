import '../models/login_response.dart';
import '../models/user.dart';
import '../services/auth_service.dart';

class AuthRepository {
  final AuthService service;

  AuthRepository(this.service);

  Future<LoginResponse> login(
    String username,
    String password,
  ) {
    return service.login(
      username,
      password,
    );
  }

Future<User> getMe(String token) {
  return service.getMe(token);
}
}