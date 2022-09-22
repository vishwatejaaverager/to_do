import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/features/auth/repository/auth_repo.dart';

final authControllerProvider = Provider((ref) {
  final authRepo = ref.watch(authRepoProvider);
  return AuthController(authRepo: authRepo, ref: ref);
});

class AuthController {
  final AuthRepo authRepo;
  final ProviderRef ref;

  AuthController({required this.authRepo, required this.ref});

  void signInWithPhone(BuildContext context, String phoneNumber) {
    authRepo.signInWithPhone(context, phoneNumber);
  }

  void verifyOTP(BuildContext context, String verificationId, String userOTP) {
    authRepo.verifyOTP(
        context: context, verificationId: verificationId, userOTP: userOTP);
  }

  void saveUserDataToFirebase(BuildContext context, String name) {
    authRepo.saveUserDataToFirebase(name: name, ref: ref, context: context);
  }
}
