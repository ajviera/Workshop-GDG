part of workshopgdg;

// Este Widget al manejar estado, lo extendemos de StatefulWidget
class RootPage extends StatefulWidget {
  // Explicar lo que hace el constructor para que se setee solo
  RootPage({Key key, this.auth}) : super(key: key);
  final BaseAuth auth;

// Acá creamos el State del Widget ***
  @override
  State<StatefulWidget> createState() => new _RootPageState();
}

// Con este enum, controlamos en que estado se encuentra el Usuario.
enum AuthStatus {
  notSignedIn,
  signedIn,
}

class _RootPageState extends State<RootPage> {
  // Iniciamos el estado en no Logueado
  AuthStatus authStatus = AuthStatus.notSignedIn;
  FirebaseUser user;

// El metodo initState() es el primer metodo que se llama al iniciar un StatefulWidget
  initState() {
    super.initState();
    // Para identificar si el usuario está logueado o no.
    widget.auth.currentUser().then((FirebaseUser userResponse) {
      setState(() {
        authStatus =
            userResponse != null ? AuthStatus.signedIn : AuthStatus.notSignedIn;
        this.user = userResponse;
      });
    });
  }

  void _updateAuthStatus(AuthStatus status) {
    setState(() {
      authStatus = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget page;
    // Dependiendo el estado, se devuelve una Page
    switch (authStatus) {
      case AuthStatus.notSignedIn:
        page = new LoginPage(
          title: 'Login',
          auth: widget.auth,
          onSignIn: () => _updateAuthStatus(AuthStatus.signedIn),
        );
        break;
      case AuthStatus.signedIn:
        page = new HomePage(
            auth: widget.auth,
            onSignOut: () => _updateAuthStatus(AuthStatus.notSignedIn));
        break;
    }
    return page;
  }
}
