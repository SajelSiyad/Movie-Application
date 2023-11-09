import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/models/auth_model.dart';
import 'package:movieapp/services/auth_service.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

final signUpProvider =
    FutureProvider.family<UserCredential, AuthModel>((ref, data) async {
  return ref.read(authServiceProvider).signUp(data.email, data.password);
});

final signInProvider =
    FutureProvider.family<UserCredential, AuthModel>((ref, data) async {
  return ref.read(authServiceProvider).signIn(data.email, data.email);
});
