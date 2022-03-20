import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class SmartMelonFarmFirebaseUser {
  SmartMelonFarmFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

SmartMelonFarmFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<SmartMelonFarmFirebaseUser> smartMelonFarmFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<SmartMelonFarmFirebaseUser>(
            (user) => currentUser = SmartMelonFarmFirebaseUser(user));
