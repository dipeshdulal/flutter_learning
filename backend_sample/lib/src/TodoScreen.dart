import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> todo = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(todo['title']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: Text(todo['title'],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))),
                Container(child: Text("ID: ${todo['id']}")),
                Container(child: Text("UserID: ${todo['userId']}"))
              ],
            )),
      ),
    );
  }
}
