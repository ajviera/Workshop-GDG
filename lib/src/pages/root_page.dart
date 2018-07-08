part of workshopgdg;

class RootPage extends StatefulWidget {
  RootPage({Key key, this.auth}) : super(key: key);
  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _RootPageState();
}

enum AuthStatus {
  notSignedIn,
  signedIn,
}

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.notSignedIn;
  User user;

  initState() {
    super.initState();
    widget.auth.currentUser().then((User userResponse) {
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
