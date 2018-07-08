part of workshopgdg;

class UserCircleAvatar extends StatelessWidget {
  const UserCircleAvatar({
    Key key,
    @required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return new CircleAvatar(
        backgroundColor: Colors.white,
        radius: 40.0,
        backgroundImage: _imageUser());
  }

  _imageUser() {
    if (user.photoUrl != null) {
      return new NetworkImage(user.photoUrl);
    } else {
      return new AssetImage('assets/images/logo-gdg.png');
    }
  }
}
