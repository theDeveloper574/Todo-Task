import 'package:flutter/foundation.dart';
import 'package:todoapp/model/todo_model.dart';
import 'package:todoapp/services/boxes/todo_box.dart';

import '../../app_utils/contestants.dart';

class TodoProvider extends ChangeNotifier {
  List<TodoModel> allTodos = [];
  List<TodoModel> searchList = [];
  FilterOptions selectedFilter = FilterOptions.all;
  ValueNotifier<List<TodoModel>> todosNotifier = ValueNotifier([]);
  String _searchQuery = '';
  String get searchQuery => _searchQuery;
  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  TodoProvider() {
    _loadTodos();
  }

  void _loadTodos() {
    final box = Boxes.getTodoData();
    allTodos = box.values.toList().cast<TodoModel>();
    todosNotifier.value = allTodos;
    box.watch().listen((_) {
      allTodos = box.values.toList().cast<TodoModel>();
      todosNotifier.value = allTodos;
    });
  }

  void setSelectedFilter(FilterOptions filter) {
    selectedFilter = filter;
    notifyListeners();
  }

  List<TodoModel> getFilteredTodos(String query) {
    List<TodoModel> tempList = [];
    tempList.addAll(allTodos);

    if (query.isNotEmpty) {
      tempList = tempList.where((todo) {
        final titleLower = todo.title.toLowerCase();
        final searchLower = query.toLowerCase();
        return titleLower.contains(searchLower);
      }).toList();
    }

    if (selectedFilter == FilterOptions.completed) {
      tempList = tempList.where((todo) => todo.isCompleted).toList();
    } else if (selectedFilter == FilterOptions.pending) {
      tempList = tempList.where((todo) => !todo.isCompleted).toList();
    }

    return tempList;
  }

  void addTodo(TodoModel todo) {
    // Add the new todo to the list of all todos
    allTodos.add(todo);

    // Save the new todo to the data storage
    final box = Boxes.getTodoData();
    box.add(todo);

    // Notify the listeners that the todos list has changed
    todosNotifier.value = allTodos;
  }
}
