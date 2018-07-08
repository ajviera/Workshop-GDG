part of workshopgdg;

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();

  Future<User> signIn(String email, String password) async {
    FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _createUser(user);
  }

  Future<User> createUser(String email, String password) async {
    FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return _createUser(user);
  }

  Future<User> currentUser() async {
    final FirebaseUser currentUser = await _firebaseAuth.currentUser();
    return _createUser(currentUser);
  }

  Future<void> signOut() async {
    // Sign out with firebase
    await _firebaseAuth.signOut();
    // Sign out with google
    await _googleSignIn.signOut();
  }

  Future<User> signInWithGoogle() async {
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

    return _createUser(user);
  }

  User _createUser(FirebaseUser firebaseUser) {
    return User(
      email: firebaseUser.email,
      id: firebaseUser.uid,
      name: firebaseUser.displayName,
      photoUrl: firebaseUser.photoUrl,
    );
  }
}
