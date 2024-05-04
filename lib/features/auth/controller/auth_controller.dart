import 'package:reddit/features/auth/repository/auth_repo.dart';
//instead of instantiating an instance of the auth controller we will use provider
//provider will cache it hence no need for reinstantiation upon rebuild
//will also use a provider for the params of the auth repo for the same reason
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = Provider((ref) {
  return AuthController(
      authRepository: ref.read(authRepoProvider));
});

class AuthController {
  final AuthRepo _authRepository;

  AuthController({required AuthRepo authRepository})
      : _authRepository = authRepository;
  void signInWithGoogle() {
    _authRepository.signInWithGoogle();
  }
}
