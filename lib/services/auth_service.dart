import 'package:firebase_auth/firebase_auth.dart';
import 'package:le_chat/services/database_service.dart';

class AuthService{
  final FirebaseAuth firebaseAuth=FirebaseAuth.instance;


  //login




  //register

  Future registerUserWithEmailAndPassword(
    String fullName, String email, String Password) async{
    try{
      User user= (await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: Password)).user!;

      if(user!=null){
        await DatabaseService(uid: user.uid).updateUserData(fullName, email);
        return true;
      }
    }on FirebaseAuthException catch(e){
      
      return e.message;
    };
  }
}