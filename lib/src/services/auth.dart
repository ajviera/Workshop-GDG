part of workshopgdg;

abstract class BaseAuth {
  Future<FirebaseUser> currentUser();
  Future<FirebaseUser> signIn(String email, String password);
  Future<FirebaseUser> createUser(String email, String password);
  Future<FirebaseUser> signInWithGoogle();
  Future<FirebaseUser> signOutWithGoogle();
  Future<void> signOut();
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> signIn(String email, String password) async {
    FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return user;
  }

  Future<FirebaseUser> createUser(String email, String password) async {
    FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return user;
  }

  Future<FirebaseUser> currentUser() async {
    final FirebaseUser currentUser = await _firebaseAuth.currentUser();
    return currentUser;
  }

  Future<void> signOut() async {
    signOutWithGoogle();
  }

  Future<FirebaseUser> signInWithGoogle() async {
    GoogleSignInAccount currentUser = _googleSignIn.currentUser;
    if (currentUser == null) {
      currentUser = await _googleSignIn.signInSilently();
    }
    if (currentUser == null) {
      currentUser = await _googleSignIn.signIn();
    }

    final GoogleSignInAuthentication auth = await currentUser.authentication;

    final FirebaseUser user = await _firebaseAuth.signInWithGoogle(
      idToken: auth.idToken,
      accessToken: auth.accessToken,
    );

    assert(user != null);
    assert(!user.isAnonymous);

    return user;
  }

  Future<Null> signOutWithGoogle() async {
    // Sign out with firebase
    await _firebaseAuth.signOut();
    // Sign out with google
    await _googleSignIn.signOut();
  }
}
