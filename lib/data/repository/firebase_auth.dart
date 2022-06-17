
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
