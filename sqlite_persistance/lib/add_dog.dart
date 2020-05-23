import 'package:flutter/material.dart';
import 'package:sqlite_persistance/models/dog.dart';

class AddDog extends StatefulWidget {
  Dog _dog = new Dog();

  @override
  _AddDogState createState() => _AddDogState();
}

class _AddDogState extends State<AddDog> {
  @override
  Widget build(BuildContext context) {
    Dog d = ModalRoute.of(context).settings.arguments;
    widget._dog = d == null ? new Dog(): d;
    Widget body = Container(
      alignment: Alignment.center,
      child: Form(
          child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextFormField(
              initialValue: d != null ? d.name : '',
              decoration: const InputDecoration(hintText: 'Enter dog name: '),
              onChanged: (value) {
                widget._dog.name = value;
              },
            ),
            TextFormField(
                initialValue: d != null ? d.age.toString() : '',
                decoration: const InputDecoration(
                  hintText: 'Enter Age: ',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  widget._dog.age = int.parse(value);
                }),
            RaisedButton(
              onPressed: () {
                print(widget._dog.toString());
                var insertAndPop = () async {
                  if(d == null){
                    await widget._dog.insert();
                  }else{
                    await widget._dog.save();
                  }
                  Navigator.pop(context);
                };
                insertAndPop();
              },
              child: Text("Save"),
            )
          ],
        ),
      )),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Add new Dog."),
      ),
      body: body,
    );
  }
}
