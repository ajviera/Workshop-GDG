part of workshopgdg;

Widget showLoginDialog(String text) {
  return new AlertDialog(
    content: new Text(
      text,
      style: new TextStyle(fontSize: 18.0, color: Colors.grey[300]),
      textAlign: TextAlign.center,
    ),
  );
}
