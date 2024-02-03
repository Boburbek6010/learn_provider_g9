import 'package:flutter/cupertino.dart';

import '../models/todo_model.dart';

class TodoController with ChangeNotifier{

  final List<TodoModel> _items = [];

  List<TodoModel> get todo => _items;

  void addNewTodo({required String title, required String content}){
    if(title.isEmpty || content.isEmpty)return;
    TodoModel todoModel = TodoModel(title: title, content: content, isCompleted: false);
    _items.add(todoModel);
    notifyListeners();
  }

  TodoController(){
    addNewTodo(title: "hello", content: "hello");
  }

  void deleteTodo(TodoModel todoModel){
    _items.remove(todoModel);
    notifyListeners();
  }

  void changeValue(TodoModel todoModel){
    todoModel.isCompleted = !todoModel.isCompleted;
    notifyListeners();
  }

}