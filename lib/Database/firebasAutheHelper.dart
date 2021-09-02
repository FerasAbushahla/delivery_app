import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthHelper {
  final FirebaseAuth _auth;
  FirebaseAuthHelper(this._auth);

  Stream<User> get authStateChange => _auth.authStateChanges();

  Future<String> signIn({email, password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "Login Successfull";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signUp({email, password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "User Created successfuly";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    return "SignedOut";
  }

  // Stream get allRestaurantes =>
  //     _firestore.collection("Restaurantes").snapshots();
}

// final databaseProvider = Provider((ref) => FirebaseHelper());
