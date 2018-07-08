part of workshopgdg;

class RowPadded extends StatelessWidget {
  const RowPadded({
    Key key,
    @required this.primaryText,
    @required this.secondaryText,
  }) : super(key: key);

  final String primaryText;
  final String secondaryText;

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
          border: new Border.all(color: const Color(0x80000000)),
          borderRadius: new BorderRadius.circular(5.0)),
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.all(10.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    primaryText,
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Text(
            secondaryText,
            style: new TextStyle(
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}
