import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
//we used private vars so they cannot be modified so in the constructor we will assign input vals to these final vars
  AuthRepo(
      {required FirebaseFirestore firestore,
      required FirebaseAuth auth,
      required GoogleSignIn googleSignIn})
      : _firestore = firestore,
        _auth = auth,
        _googleSignIn = googleSignIn;

  void signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final credential = GoogleAuthProvider.credential(
          accessToken: (await googleUser?.authentication)?.accessToken,
          idToken: (await googleUser?.authentication)?.idToken);
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      print(userCredential.user);
    } catch (e) {
      print(e);
    }
  }
}
