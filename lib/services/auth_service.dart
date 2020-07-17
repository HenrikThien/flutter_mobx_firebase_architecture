import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> signIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    return user;
  }

  Future<FirebaseUser> signUp(String email, String password) async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(email: email, password: password)).user;
    return user;
  }
}
