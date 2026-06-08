import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saspri_mobile/helper/enum.dart';

import '../models/auth_state.dart';
import '../repositories/auth_repository.dart';
import '../services/auth_service.dart';

import 'dio_provider.dart';
import 'storage_provider.dart';

final authServiceProvider =
    Provider<AuthService>((ref) {
  return AuthService(
    ref.read(dioProvider),
  );
});

final authRepositoryProvider =
    Provider<AuthRepository>((ref) {
  return AuthRepository(
    ref.read(authServiceProvider),
  );
});

class AuthNotifier
    extends Notifier<AuthState> {

  @override
  AuthState build() {
    return const AuthState(
      status:
          AuthStatus.unauthenticated,
    );
  }

  Future<void> restoreSession()
      async {

    state = state.copyWith(
      status: AuthStatus.loading,
    );

    final storage =
        ref.read(
          secureStorageProvider,
        );

    final token =
        await storage.read(
      key: 'access_token',
    );

    if (token == null) {

      state = const AuthState(
        status:
            AuthStatus
                .unauthenticated,
      );

      return;
    }

    try {

      final repository =
          ref.read(
        authRepositoryProvider,
      );

      final user =
          await repository.getMe(
        token,
      );

      state = AuthState(
        status:
            AuthStatus
                .authenticated,
        token: token,
        user: user,
      );

    } catch (_) {

      await storage.delete(
        key: 'access_token',
      );

      state = const AuthState(
        status:
            AuthStatus
                .unauthenticated,
      );
    }
  }

  Future<void> login(
    String email,
    String password,
  ) async {

    final repository =
        ref.read(
      authRepositoryProvider,
    );

    final loginResult =
        await repository.login(
      email,
      password,
    );

    final user =
        await repository.getMe(
      loginResult.accessToken,
    );

    final storage =
        ref.read(
      secureStorageProvider,
    );

    await storage.write(
      key: 'access_token',
      value:
          loginResult.accessToken,
    );

    state = AuthState(
      status:
          AuthStatus
              .authenticated,
      token:
          loginResult.accessToken,
      user: user,
    );
  }

  Future<void> logout() async {

    final storage =
        ref.read(
      secureStorageProvider,
    );

    await storage.delete(
      key: 'access_token',
    );

    state = const AuthState(
      status:
          AuthStatus
              .unauthenticated,
    );
  }
}

final authProvider =
    NotifierProvider<
      AuthNotifier,
      AuthState
    >(
      AuthNotifier.new,
    );