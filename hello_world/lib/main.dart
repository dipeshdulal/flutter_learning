import 'package:flutter/material.dart';

import 'homepage.dart';

main() {
  runApp(MainWidget());
}

class MainWidget extends StatelessWidget {
  final _routes = {
    '/': (context) => Scaffold(body: HomeScreen()),
    '/second': (context) => SecondScreen()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World App',
      initialRoute: '/',
      routes: _routes,
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(title: Text(args.title)),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                child: Text(args.message),
                margin: const EdgeInsets.all(10),
              ),
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    onPressed: () {
                      Navigator.pop(context, "Yes");
                    },
                    child: Text("Yes: msg: " + args.message),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pop(context, "No");
                    },
                    child: Text("No! msg: " + args.message),
                  )
                ],
              ))
            ],
          ),
        ));
  }
}
