import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum AuthState { Unknown, Unauthenticated, Authenticated }

class AuthenticationProvider with ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  AuthenticationProvider();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  AuthState _authState = AuthState.Unknown;
  AuthState get authState => _authState;

  void setAuthState(AuthState authState) {
    _authState = authState;
    notifyListeners();
  }

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<void> signOut() async {
    setLoading(true);
    await firebaseAuth.signOut();
    setLoading(false);
  }

  Future<String?> signIn(
      {required String email, required String password}) async {
    setLoading(true);
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      setLoading(false);
    } on FirebaseAuthException catch (e) {
      setLoading(false);
      return e.message;
    }
  }

  Future<String?> signUp(
      {required String email, required String password}) async {
    setLoading(true);
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      setLoading(false);
      return e.message;
    }
  }

  Future<String?> uid() async {
    return firebaseAuth.currentUser?.uid;
  }
}
