import 'package:flutter/material.dart';

class FlappyButton extends StatefulWidget {
  @override FlappyButtonState createState() => FlappyButtonState();
}
class FlappyButtonState extends State<FlappyButton> {
  bool _flapping = false;

  void flap() {
    print("FLAP");
    setState(() { _flapping = !_flapping; });
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: flap,
      child: FlatButton(
        onPressed: null,
        child: Icon(_flapping? Icons.flight_takeoff : Icons.flight_land),
      )
    );
  }
}

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  // Fields in a Widget subclass are always marked "final".
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0, // in logical pixels
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      // Row is a horizontal, linear layout.
      child: Row(
        // <Widget> is the type of items in the list.
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, // null disables the button
          ),
          // Expanded expands its child to fill the available space.
          Expanded(
            child: title,
          ),
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece of paper on which the UI appears.
    return Material(
      // Column is a vertical, linear layout.
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FlappyButton(),
                Text("Hello, Flutter"),
                Icon(Icons.flag),
                RaisedButton(
                  onPressed: () => { print("YOU PRESSED ME") },
                  child: Text("PUSH ME"),
                  color: Colors.red,
                )
              ]
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: MyScaffold(),
  ));
}