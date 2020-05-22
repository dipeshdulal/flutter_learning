// list model
import 'package:flutter/foundation.dart';

class MTodosNotifier extends ChangeNotifier{

  List<MTodos> _todos = List<MTodos>();
  
  addTodos(List<MTodos> todo){
    _todos = [..._todos, ...todo];
    notifyListeners();
  }

  List<MTodos> get todos => _todos; 

  toggleTodos(title){
    _todos = _todos.map((element){
      if(element.description == title){
        element.enabled = !element.enabled;
      }
      return element;
    }).toList();
    notifyListeners();
  }

}

class MTodos {
  String title;
  String description;
  bool enabled = true;
  MTodos(this.title, this.description);
}