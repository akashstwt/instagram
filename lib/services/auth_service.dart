import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:instagram/models/user.dart';

class AuthService {
  final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty && password.isNotEmpty && username.isNotEmpty) {
        // Register user
        firebase_auth.UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Create user model
        User user = User(
          username: username,
          uid: cred.user!.uid,
          email: email,
          bio: bio,
          followers: [],
          following: [],
          photoUrl: '',
          isPrivate: false,
        );

        // Add user to database
        await _firestore.collection('users').doc(cred.user!.uid).set(user.toJson());
        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<User?> getUserDetails() async {
    firebase_auth.User? currentUser = _auth.currentUser;
    
    if (currentUser != null) {
      DocumentSnapshot snap = await _firestore.collection('users').doc(currentUser.uid).get();
      return User.fromSnap(snap.data() as Map<String, dynamic>);
    }
    return null;
  }

  Future<String> resetPassword(String email) async {
    String res = "Some error occurred";
    try {
      await _auth.sendPasswordResetEmail(email: email);
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}