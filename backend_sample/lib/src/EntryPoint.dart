import 'package:flutter/material.dart';

import 'MainScreen.dart';
import 'TodoScreen.dart';

class EntryPoint extends StatelessWidget {
  final _routes = {"/": (_) => MainScreen(), "/screen": (_) => TodoScreen()};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App Title",
      routes: _routes,
      initialRoute: "/",
    );
  }
}
