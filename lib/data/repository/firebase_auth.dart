import 'package:cursus_app/data/exceptions/general_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthentication {
  // FirebaseAuth firebaseAuth;
  // GoogleSignIn googleSignIn;
  // FacebookAuth facebookAuth;
/*
  FirebaseAuthentication(
      {
    // required this.firebaseAuth,
    // required this.googleSignIn,
    // required this.facebookAuth,
  });
*/

 /* Future<UserCredential> signInWithGoogle() async {
    // try {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    UserCredential userCredential =
        await firebaseAuth.signInWithCredential(credential);
    print(userCredential);

    return userCredential;
    // } catch (e) {
    //   throw GoogleSignInException();
    // }
  }

  Future<UserCredential> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await facebookAuth.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      return firebaseAuth.signInWithCredential(facebookAuthCredential);
    } catch (e) {
      throw FacebookSignInException();
    }
  }*/
}
