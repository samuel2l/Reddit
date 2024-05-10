import 'package:flutter/material.dart';
import 'package:reddit/features/auth/repository/auth_repo.dart';
//instead of instantiating an instance of the auth controller we will use provider
//provider will cache it hence no need for reinstantiation upon rebuild
//will also use a provider for the params of the auth repo for the same reason
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit/features/models/user_model.dart';

final userProvider = StateProvider<UserModel?>((ref) => null);

final authControllerProvider = Provider((ref) {
  return AuthController(authRepository: ref.read(authRepoProvider));
});

class AuthController {
  final AuthRepo _authRepository;
  final Ref _ref;

  AuthController({required AuthRepo authRepository, required Ref ref})
      : _authRepository = authRepository,
        _ref = ref,
        super(false);
  void signInWithGoogle(BuildContext context)async {
    final user= await _authRepository.signInWithGoogle();
    _ref.read(userProvider.notifier).update((state) => userModel);
  }
}
