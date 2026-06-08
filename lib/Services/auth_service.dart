import 'package:dio/dio.dart';

import '../models/login_response.dart';
import '../models/user.dart';

class AuthService {
  final Dio dio;

  AuthService(this.dio);

  Future<LoginResponse> login(
    String username,
    String password,
  ) async {

    final response = await dio.post(
      '/user/login',
      data: {
        'username': username,
        'password': password,
      },
    );

    return LoginResponse.fromJson(
      response.data,
    );
  }

Future<User> getMe(String token) async {

    final response = await dio.get(
      '/user/me',
      options: Options(
        headers: {
          'Authorization':
              'Bearer $token',
        },
      ),
    );

    return User.fromJson(
      response.data,
    );
  }
}