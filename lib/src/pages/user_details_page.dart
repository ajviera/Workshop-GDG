part of workshopgdg;

class UserDetailsPage extends StatefulWidget {
  UserDetailsPage({this.user});

  final FirebaseUser user;

  @override
  UserDetailsPageState createState() => new UserDetailsPageState();
}

class UserDetailsPageState extends State<UserDetailsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Padding(
          padding: new EdgeInsets.only(top: 140.0),
          child: new Column(
            children: [
              new Container(
                child: new UserCircleAvatar(user: widget.user),
                margin: const EdgeInsets.only(bottom: 30.0),
              ),
              new RowPadded(
                  primaryText: 'Email:',
                  secondaryText:
                      widget.user.email != null ? widget.user.email : ''),
              new RowPadded(
                  primaryText: 'Name:',
                  secondaryText: widget.user.displayName != null
                      ? widget.user.displayName
                      : ''),
            ],
          ),
        ),
      ),
    );
  }
}
