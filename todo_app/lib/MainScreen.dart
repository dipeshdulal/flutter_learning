import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/MTodos.dart';
import 'package:todo_app/TodoDisplay.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget consumer = Consumer<MTodosNotifier>(
      builder: (context, value, child) {
        return ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            ...value.todos.map((d) => TodoDisplay(d))
          ],
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Todo Application"),
      ),
      body: consumer,
      floatingActionButton: RawMaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, "/add");
        },
        elevation: 2.0,
        fillColor: Colors.blue[500],
        child: Icon(
          Icons.add,
          size: 35.0,
          color: Colors.white,
        ),
        padding: EdgeInsets.all(15.0),
        shape: CircleBorder(),
      ),
    );
  }
}
