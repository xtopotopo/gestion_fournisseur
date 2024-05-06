import 'package:firebase_auth/firebase_auth.dart';

class AuthentificationDao{

  //Field
  late FirebaseAuth _authentification;

  //Constructor
  AuthentificationDao(){
    _authentification=FirebaseAuth.instance;
  }

  //signIn method
  Future<void> signIn({required String email,required String password}) async{
    await _authentification.signInWithEmailAndPassword(
      email: email,
      password: password
    );
  }

  //signUp method
  Future<void> signUp({required String email,required String password}) async{
    await _authentification.createUserWithEmailAndPassword(
      email: email,
      password: password
    );
  }

  //reset Password method
  Future<void> resetPassword(String email) async{
    await _authentification.sendPasswordResetEmail(
      email: email,
    );
  }

  // SignOut method
  Future<void> signOut() async{
    await _authentification.signOut();
  }
}