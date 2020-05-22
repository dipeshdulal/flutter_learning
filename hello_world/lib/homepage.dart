
import 'package:flutter/material.dart';

import 'favWidget.dart';

class HomeScreen extends StatelessWidget {
  Column _makeIcon(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: color),
        Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(label,
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w400, color: color)))
      ],
    );
  }


  _buttonPressed(context) async {
    final _response = await Navigator.pushNamed(context, '/second', arguments: ScreenArguments("Test", "Message"));
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(_response),));
  }

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text('Pashupatinath',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text('Pashupatinath',
                    style: TextStyle(color: Colors.grey[500])),
              ),
            ],
          )),
          FavouriteWidget()
        ],
      ),
    );

    Widget buttonGroups = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _makeIcon(Colors.blue[500], Icons.call, "Call"),
        _makeIcon(Colors.blue[500], Icons.map, "Route"),
        _makeIcon(Colors.blue[500], Icons.share, "Share"),
      ],
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to flutter"),
      ),
      body: ListView(children: <Widget>[
        Image.asset(
          'images/lake.jpeg',
          width: 600,
          height: 240,
          fit: BoxFit.cover,
        ),
        titleSection,
        buttonGroups,
        textSection,
        RaisedButton(
          onPressed: () => _buttonPressed(context),
          child: Text('Go to another screen'),
        )
      ]),
    );
  }
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);

}