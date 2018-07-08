part of workshopgdg;

abstract class BaseAuth {
  Future<User> currentUser();
  Future<User> signIn(String email, String password);
  Future<User> createUser(String email, String password);
  Future<User> signInWithGoogle();
  Future<void> signOut();
}
