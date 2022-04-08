import 'package:firebase_auth/firebase_auth.dart';
import 'package:leas_01/models/myuser.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyUser? _userfromFirebase(User user) {
    return MyUser(uid: user.uid, email: user.email);
  }

//sign in with email and passwword
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userfromFirebase(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
