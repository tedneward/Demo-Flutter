import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

// {{## BEGIN first ##}}
class FirstRoute extends StatelessWidget {
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Route'),),
      body: Center(
        child: RaisedButton(
          child: Text('Open route'),
          onPressed: () {
            Navigator.push(context, 
              MaterialPageRoute(builder: (context) => SecondRoute()),
            );
          },
        ),
      ),
    );
  }
}
// {{## END first ##}}

// {{## BEGIN second ##}}
class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("Second Route"), ),
      body: Center(
        child: RaisedButton(
          onPressed: () { Navigator.pop(context); },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
// {{## END second ##}}
