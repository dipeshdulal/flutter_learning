import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MTodos.dart';

class TodoDisplay extends StatefulWidget {
  
  final MTodos _todos;

  const TodoDisplay(this._todos);

  @override
  _TodoDisplayState createState() => _TodoDisplayState();

}

class _TodoDisplayState extends State<TodoDisplay> {
  @override
  Widget build(BuildContext context) {

    Widget button = Consumer<MTodosNotifier>(builder: (context, value, child) => RaisedButton(
        onPressed: () { 
          value.toggleTodos(widget._todos.description);
        },
        elevation: 1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.white)),
        color: widget._todos.enabled ? Colors.white: Colors.red,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      widget._todos.title,
                      style: TextStyle(fontSize: 16.0, 
                      decoration: widget._todos.enabled? TextDecoration.none: TextDecoration.lineThrough,
                      fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    widget._todos.description,
                    style: TextStyle(fontSize: 14.0),
                  )
                ],
              )
            ],
          ),
        ),
      ),);

    return Container(
      margin: const EdgeInsets.all(10),
      child: button
    );
  }
}
