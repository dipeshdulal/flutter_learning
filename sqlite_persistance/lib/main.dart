import 'package:flutter/material.dart';

import 'add_dog.dart';
import 'models/dog.dart';
import 'view_dog.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() {
  runApp(EntryPoint());
}

class EntryPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var routes = {
      "/": (_) => MainScreen(),
      "/addDog": (_) => AddDog(),
      "/viewDog": (_) => ViewDog()
    };
    return MaterialApp(
      initialRoute: "/",
      routes: routes,
      navigatorObservers: [routeObserver],
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {}

  @override
  void didPopNext() {
    setState(() {});
  }

  _showDeleteContextMenu(context, Dog d) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) => Container(
              child: new Wrap(
                children: <Widget>[
                  ListTile(
                      onTap: () {
                        d.delete();
                        // reload data
                        setState(() {});
                        Navigator.pop(context);
                      },
                      leading: Icon(Icons.delete),
                      title: Text("DELETE"))
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Persistance Learning"),
        ),
        floatingActionButton: RaisedButton(
          padding: EdgeInsets.all(10),
          color: Colors.lightBlue,
          elevation: 2.0,
          onPressed: () {
            Navigator.pushNamed(context, "/addDog");
          },
          child: Icon(
            Icons.add,
            size: 40,
            color: Colors.white,
          ),
          shape: CircleBorder(),
        ),
        body: FutureBuilder<List<Dog>>(
          future: Dog.getAll(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Dog> dogs = snapshot.data;
              return ListView.builder(
                itemCount: dogs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, "/viewDog", arguments: dogs[index]);
                    },
                    onLongPress: () =>
                        _showDeleteContextMenu(context, dogs[index]),
                    title: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(dogs[index].name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    subtitle: Text("Age: ${dogs[index].age}"),
                  );
                },
              );
            }

            if (snapshot.hasError) {
              return Container(
                child: Text("We have error getting dogs."),
              );
            }

            return Center(child: Text("Loading..."));
          },
        ));
  }
}
