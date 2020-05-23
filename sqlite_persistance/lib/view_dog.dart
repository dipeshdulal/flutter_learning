import 'package:flutter/material.dart';

import 'models/dog.dart';

class ViewDog extends StatelessWidget {
  Future<void> _showMyDialog(context, Dog d) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Do you want to delete ?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Icon(Icons.cancel, color: Colors.blue),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Icon(
                Icons.check,
                color: Colors.red,
              ),
              onPressed: () {
                var deleteDog = () async {
                  await d.delete();
                  Navigator.of(context).pop();
                  Navigator.pop(context);
                };
                deleteDog();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Dog d = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _showMyDialog(context, d);
            },
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.popAndPushNamed(context, "/addDog", arguments: d);
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(
              d.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("ID: ${d.id}"),
            Text("AGE: ${d.age}"),
          ],
        ),
      ),
    );
  }
}
