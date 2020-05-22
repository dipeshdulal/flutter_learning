import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/AddScreen.dart';
import 'package:todo_app/MainScreen.dart';

import 'MTodos.dart';

main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    var routes = {"/": (_) => MainScreen(), "/add": (_) => AddScreen()};
    return ChangeNotifierProvider(
        create: (_) {
          return MTodosNotifier();
        },
        child: MaterialApp(initialRoute: "/", routes: routes));
  }
}
