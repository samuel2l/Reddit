import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
//we used private vars so they cannot be modified so in the constructor we will assign input vals to these final vars
  AuthRepo({required FirebaseFirestore firestore, required FirebaseAuth auth, required GoogleSignIn googleSignIn}) : _firestore = firestore, _auth = auth, _googleSignIn = googleSignIn;

}
