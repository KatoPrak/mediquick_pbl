import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> signUp(String email, String password, String name) async {
    try {
      print("Starting signUp process");
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;

      if (user != null) {
        print("User created successfully");
        await user.updateDisplayName(name);
        await user.reload();
        user = _firebaseAuth.currentUser;
      }
      return user;
    } on FirebaseAuthException catch (e) {
      print("Error during signUp: ${e.message}");
      throw e;
    } catch (e) {
      print("Unexpected error during signUp: $e");
      throw e;
    }
  }
}