import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class TodoWidget extends StatefulWidget {
  Future<http.Response> getTodos() {
    return http.get("https://jsonplaceholder.typicode.com/todos/");
  }

  @override
  State<StatefulWidget> createState() {
    return _TodoWidgetState();
  }
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<http.Response>(
      future: widget.getTodos(),
      builder: (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
        List<Widget> children = [];
        if (snapshot.hasData) {
          List<dynamic> data = json.decode(snapshot.data.body);
          for (dynamic d in data) {
            children.add(ListTile(
              onTap: (){
                Navigator.pushNamed(context, "/screen", arguments: {
                  "userId": d['userId'],
                  "completed": d['completed'],
                  "title": d['title'] 
                });
              },
              title: Text(d['title']),
              subtitle: Text("User id: ${d['userId'].toString()}, Completed: ${d['completed']}"),
            ));
          }
        } else if (snapshot.hasError) {
          children.add(Text("Has error"));
        } else {
          children.add(Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.all(10),
                    child: CircularProgressIndicator())
              ]));
        }
        return ListView(
          children: children,
        );
      },
    );
  }
}
