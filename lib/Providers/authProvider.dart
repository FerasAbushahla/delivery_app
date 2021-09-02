import 'package:delivery_app/Database/firebasAutheHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final authServicesProvider = Provider<FirebaseAuthHelper>((ref) {
  return FirebaseAuthHelper(ref.read(firebaseAuthProvider));
});

final authStateProvider = StreamProvider<User>((ref) {
  return ref.watch(authServicesProvider).authStateChange;
});
