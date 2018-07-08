part of workshopgdg;

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key key,
    this.auth,
    this.onSignOut,
    @required this.user,
    @required this.drawerOptions,
  }) : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignOut;
  final User user;
  final List<Widget> drawerOptions;

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        primary: false,
        children: <Widget>[
          new Column(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                  // onDetailsPressed: () => showUserDetails(context),
                  currentAccountPicture: new UserCircleAvatar(user: user),
                  accountName: new Text(
                      user.name != null ? user.name : ''),
                  accountEmail: new Text(user.email)),
              new Column(children: drawerOptions)
            ],
          ),
          new ListTile(
            title: const Text('Logout', textAlign: TextAlign.right),
            trailing: const Icon(Icons.exit_to_app),
            onTap: _signOut,
          ),
        ],
      ),
    );
  }

  // void showUserDetails(BuildContext context) {
  //   Navigator.push(
  //       context,
  //       new MaterialPageRoute(
  //           builder: (context) => new UserDetailsPage(auth: auth)));
  // }

  void _signOut() async {
    try {
      await auth.signOut();
      onSignOut();
    } catch (e) {
      print(e.toString());
    }
  }
}

