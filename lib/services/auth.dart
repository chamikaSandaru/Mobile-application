import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/models/usermodel.dart'; // Make sure this import is correct

class AuthServices {
  // Firebase instances
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance; // Add Firestore instance

  UserModel? _userWithFirebaseUserUid(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_userWithFirebaseUserUid);
  }

  // Sign in anonymously
  Future<UserModel?> signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userWithFirebaseUserUid(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  // Register with email and password
  Future<UserCredential?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return result;
    } catch (e) {
      print("Error during registration: $e");
      return null;
    }
  }

  // Sign in with email and password
  Future<UserModel?> signInUsingEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      return _userWithFirebaseUserUid(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      return await _auth.signOut();
    } catch (err) {
      print(err.toString());
    }
  }

  // Get current user UID
  Future<String> getCurrentUserUID() async {
    final user = _auth.currentUser;
    return user?.uid ?? 'No UID found'; // Safely return UID or default message
  }

  // Get user data
  Future<Map<String, dynamic>> getUserData(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('client').doc(uid).get();
      return doc.data() as Map<String, dynamic>? ?? {};
    } catch (e) {
      print("Error fetching user data: $e");
      return {};
    }
  }
}
