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
      key: _scaffoldKey,
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Center(
            child: new Container(
              child: new UserCircleAvatar(user: widget.user),
              margin: const EdgeInsets.only(bottom: 30.0),
              padding: const EdgeInsets.only(top: 150.0),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Text(
              "Email",
              style: TextStyle(color: Colors.grey, fontSize: 16.0),
            ),
          ),
          new Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Row(
              children: <Widget>[
                new Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  height: 30.0,
                  width: 1.0,
                  color: Colors.grey.withOpacity(0.5),
                  margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                ),
                new Expanded(
                  child: new Text(
                    widget.user.email != null ? widget.user.email : '',
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              ],
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Text(
              "Name",
              style: TextStyle(color: Colors.grey, fontSize: 16.0),
            ),
          ),
          new Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Row(
              children: <Widget>[
                new Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  height: 30.0,
                  width: 1.0,
                  color: Colors.grey.withOpacity(0.5),
                  margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                ),
                new Expanded(
                  child: new Text(
                    widget.user.displayName != null
                        ? widget.user.displayName
                        : '',
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
