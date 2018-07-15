part of workshopgdg;

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  HomePage({this.auth, this.onSignOut});

  final BaseAuth auth;
  final VoidCallback onSignOut;

  final drawerItems = [
    new DrawerItem("Hello World", Icons.search),
    new DrawerItem("User Details", Icons.cloud_circle),
    new DrawerItem("Bye World", Icons.history),
  ];

  @override
  State<StatefulWidget> createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;
  FirebaseUser user;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new HelloPage();
      case 1:
        return new UserDetailsPage(user: this.user);
      // case 2:
        // return new ByePage();

      default:
        return new Text("Error");
    }
  }

  initState() {
    super.initState();
    widget.auth.currentUser().then((FirebaseUser userResponse) {
      setState(() {
        this.user = userResponse;
      });
    });
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }
    return new Scaffold(
      appBar: new AppBar(
        title: new SafeArea(
            child: new Text(widget.drawerItems[_selectedDrawerIndex].title)),
      ),
      drawer: new HomeDrawer(
          auth: widget.auth,
          onSignOut: widget.onSignOut,
          user: user,
          drawerOptions: drawerOptions),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
