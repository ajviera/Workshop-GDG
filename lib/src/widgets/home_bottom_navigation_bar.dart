part of workshopgdg;

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new BottomNavigationBar(
      items: [
        new BottomNavigationBarItem(
          icon: new Icon(Icons.star),
          title: new Text("Add"),
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.delete),
          title: new Text("Delete"),
        ),
      ],
    );
  }
}