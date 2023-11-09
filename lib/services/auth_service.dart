import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final auth = FirebaseAuth.instance;
  static Stream<User?> authStateChange() {
    return auth.authStateChanges();
  }

  Future<UserCredential> signUp(String email, String password) {
    return auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> signIn(String email, String password) {
    return auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> logOut() {
    return auth.signOut();
  }
}
