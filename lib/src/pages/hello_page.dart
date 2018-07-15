part of workshopgdg;

class HelloPage extends StatefulWidget {
  @override
  _HelloPageState createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "Hello World",
          style: TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }
}
