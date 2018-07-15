part of workshopgdg;

abstract class BaseAuth {
  Future<FirebaseUser> currentUser();
  Future<FirebaseUser> signIn(String email, String password);
  Future<FirebaseUser> createUser(String email, String password);
  Future<FirebaseUser> signInWithGoogle();
  Future<void> signOut();
}
