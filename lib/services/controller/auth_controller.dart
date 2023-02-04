import 'package:auth_flaxen/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../login/login_screen.dart';
import '../../global/utils/show_snack_bar.dart';
import '../repository/auth_repository.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
      authRepository: ref.watch(authRepositoryProvider), ref: ref);
});

// final authStateChangeProvider = StreamProvider<User?>((ref) {
//   final authController = ref.watch(authControllerProvider.notifier);
//   return authController.authStateChange;
// });

class AuthController extends StateNotifier<bool> {
  final AuthRepository _authRepository;
  final Ref _ref;

  AuthController({required AuthRepository authRepository, required Ref ref})
      : _authRepository = authRepository,
        _ref = ref,
        super(false);

  Stream<User?> get authStateChange => _authRepository.authStateChange;

  Future<void> signUp(BuildContext context, String username, String password,
      String email, String contact, String gender) async {
    state = true;
    final res = await _authRepository.signUp(
        username, email, password, contact, gender);
    state = false;
    res.fold((l) => showSnackBar(context, l.message), (r) {
      showSnackBar(context, "Account successfully created!");
      Navigator.pushNamed(context, LoginScreen.routeName);
    });
  }

  Future<void> signIn(
      BuildContext context, String email, String password) async {
    final res = await _authRepository.signIn(email, password);
    res.fold((l) => showSnackBar(context, l.message), (r) {
      showSnackBar(context, "Login is successful");
      Navigator.pushNamed(context, HomeScreen.routeName);
    });
  }

  Future<void> logOut(BuildContext context) async {
    final res = await _authRepository.logOut();
    res.fold((l) => showSnackBar(context, l.message), (r) {
      showSnackBar(context, "Log Out is successful!");
      Navigator.pushNamed(context, LoginScreen.routeName);
    });
  }
}
