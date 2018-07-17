part of workshopgdg;

class UserCircleAvatar extends StatelessWidget {
  const UserCircleAvatar({
    Key key,
    @required this.user,
  }) : super(key: key);

  final FirebaseUser user;

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(80.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black,
            blurRadius: 10.0,
          ),
        ],
      ),
      height: 150.0,
      width: 150.0,
      child: new CircleAvatar(
        backgroundColor: Colors.white,
        radius: 40.0,
        backgroundImage: _imageUser(),
      ),
    );
  }

  _imageUser() {
    if (user.photoUrl != null) {
      return new NetworkImage(user.photoUrl);
    } else {
      return new AssetImage('assets/images/logo-gdg.png');
    }
  }
}
