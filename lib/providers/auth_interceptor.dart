import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_provider.dart';

class AuthInterceptor
    extends Interceptor {

  final Ref ref;

  AuthInterceptor(this.ref);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {

    final token =
        ref.read(authProvider).token;

    if (token != null) {
      options.headers[
          'Authorization'] =
          'Bearer $token';
    }
    
    handler.next(options);
  }
}