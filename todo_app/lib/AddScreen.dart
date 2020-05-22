import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/MTodos.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  String _title;
  String _description;

  @override
  Widget build(BuildContext context) {
    Widget button = Consumer<MTodosNotifier>(
      builder: (context, value, child) => RaisedButton(
              onPressed: () {
                List<MTodos> todoList = List<MTodos>();
                todoList.add(MTodos(_title, _description));
                value.addTodos(todoList);
                Navigator.pop(context);
              },
              child: Text("Add"),
            ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Ola"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Form(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextFormField(
              onChanged: (value) {
                setState(() {
                  _title = value;
                });
              },
              decoration: const InputDecoration(hintText: "Enter Title"),
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  _description = value;
                });
              },
              decoration: const InputDecoration(hintText: "Enter Description"),
            ),
            button
          ],
        )),
      ),
    );
  }
}
