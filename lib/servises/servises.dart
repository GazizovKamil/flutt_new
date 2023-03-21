import 'package:firebase_auth/firebase_auth.dart';

import 'model.dart';

class DBConnection{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future <UserModel?> signUp(String email, String password)async{
    try{
      UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, 
        password: password,
      );
      User user = result.user as User;
      return UserModel.fromFirebase(user);
    }
    catch (e) {
      return null;
    }
  }

  Future <UserModel?> signIn(String email, String password)async{
    try{
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user as User;

      return UserModel.fromFirebase(user);
    }
    catch (e) {
      return null;
    }
  }

  Future logOut()async{
      await _firebaseAuth.signOut();
  }
}