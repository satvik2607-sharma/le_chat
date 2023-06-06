import 'package:firebase_auth/firebase_auth.dart';
import 'package:le_chat/helper/helper_function.dart';
import 'package:le_chat/services/database_service.dart';

class AuthService{
  final FirebaseAuth firebaseAuth=FirebaseAuth.instance;


  //login

  Future loginWithUsernameAndPassword(
     String email, String Password) async{
    try{
      User user= (await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: Password)).user!;

      if(user!=null){
        return true;
      }
    }on FirebaseAuthException catch(e){
      
      return e.message;
    }
  }


  //register

  Future registerUserWithEmailAndPassword(
    String fullName, String email, String Password) async{
    try{
      User user= (await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: Password)).user!;

      if(user!=null){
        await DatabaseService(uid: user.uid).savingUserData(fullName, email);
        return true;
      }
    }on FirebaseAuthException catch(e){
      
      return e.message;
    }
  }



  //signout

  Future signout() async {
    try{
      await HelperFunction.savedUserLoggedInStatus(false);
      await HelperFunction.savedUserEmailSF("");
      await HelperFunction.savedUserNameSF("");
      await firebaseAuth.signOut();
    }
    catch(e){
      return null;
    }
  }
}