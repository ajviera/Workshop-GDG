part of workshopgdg;

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title, this.auth, this.onSignIn}) : super(key: key);

  final String title;
  final BaseAuth auth;
  final VoidCallback onSignIn;

  @override
  _LoginPageState createState() => new _LoginPageState();
}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  static final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  FormType _formType = FormType.login;
  final double _buttonHeight = 44.0;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    if (validateAndSave()) {
      try {
        FirebaseUser user = _formType == FormType.login
            ? await widget.auth.signIn(_email, _password)
            : await widget.auth.createUser(_email, _password);
        showDialog(
          context: context,
          builder: (_) =>
              showLoginDialog('Signed In\n\nUser email: ${user.email}'),
        );
        widget.onSignIn();
      } on PlatformException {
        showDialog(
          context: context,
          builder: (_) => showLoginDialog(
              'Sign In Error\n\nThe Email or the Password is invalid'),
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (_) => showLoginDialog('Sign In Error\n\n${e.toString()}'),
        );
      }
    }
  }

  void validateAndSubmitWithGoogleAuth() async {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    try {
      FirebaseUser user = await widget.auth.signInWithGoogle();
      showDialog(
        context: context,
        builder: (_) =>
            showLoginDialog('Signed In\n\nUser email: ${user.email}'),
      );
      widget.onSignIn();
    } on NoSuchMethodError {} catch (e) {
      showDialog(
        context: context,
        builder: (_) => showLoginDialog('Sign In Error\n\n${e.toString()}'),
      );
    }
  }

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState.reset();
    setState(
      () {
        _formType = FormType.login;
      },
    );
  }

  List<Widget> usernameAndPassword() {
    return [
      padded(
        child: new TextFormField(
            key: new Key('email'),
            decoration: new InputDecoration(labelText: 'Email'),
            autocorrect: false,
            validator: (val) => val.isEmpty ? 'Email can\'t be empty.' : null,
            onSaved: (val) => _email = val),
      ),
      padded(
        child: new TextFormField(
            key: new Key('password'),
            decoration: new InputDecoration(labelText: 'Password'),
            obscureText: true,
            autocorrect: false,
            validator: (val) =>
                val.isEmpty ? 'Password can\'t be empty.' : null,
            onSaved: (val) => _password = val),
      ),
    ];
  }

  List<Widget> submitWidgets() {
    switch (_formType) {
      case FormType.login:
        return [
          new PrimaryButton(
            key: new Key('login'),
            text: 'Log in',
            height: _buttonHeight,
            onPressed: validateAndSubmit,
          ),
          new FlatButton(
            key: new Key('need-account'),
            child: new Text("Need an account? Sign up"),
            onPressed: moveToRegister,
          )
        ];
      case FormType.register:
        return [
          new PrimaryButton(
            key: new Key('register'),
            text: 'Sign up',
            height: _buttonHeight,
            onPressed: validateAndSubmit,
          ),
          new FlatButton(
            key: new Key('need-login'),
            child: new Text("Have an account? Log in"),
            onPressed: moveToLogin,
          )
        ];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      backgroundColor: Colors.grey[300],
      body: new Center(
        child: new SingleChildScrollView(
          child: new Container(
            padding: const EdgeInsets.all(16.0),
            child: new Column(children: [
              new Card(
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.all(16.0),
                      child: new Form(
                        key: formKey,
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: usernameAndPassword() + submitWidgets(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              new Container(
                margin: const EdgeInsets.all(5.0),
                child: new ConstrainedBox(
                  constraints: BoxConstraints.expand(height: _buttonHeight),
                  child: new RaisedButton(
                    elevation: 7.0,
                    shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius
                            .all(Radius.circular(_buttonHeight / 2))),
                    color: Colors.white,
                    key: new Key('login/register'),
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          padding: const EdgeInsets.only(left: 13.0, top: 10.0),
                          child: new Row(
                            children: <Widget>[
                              new Container(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: new Image(
                                  image: AssetImage(
                                      'assets/images/google-logo.png'),
                                  width: 20.0,
                                  height: 20.0,
                                ),
                              ),
                              new Text(
                                'Log in/Sign up with Google',
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      validateAndSubmitWithGoogleAuth();
                    },
                  ),
                ),
                height: _buttonHeight,
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget padded({Widget child}) {
    return new Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: child,
    );
  }
}
