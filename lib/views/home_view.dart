import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/app_utils/app_utils.dart';

import '../app_utils/contestants.dart';
import '../model/todo_model.dart';
import '../services/state_managment/todo_provider.dart';
import '../widgets/todo_card_widget.dart';
import 'add_todo_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoProvider(),
      builder: (context, _) {
        final provider = Provider.of<TodoProvider>(context);
        final searchConTe = TextEditingController(text: provider.searchQuery);
        return Scaffold(
          appBar: AppUtils.homeAppBar(
            PopupMenuButton<FilterOptions>(
              itemBuilder: (context) {
                return [
                  const PopupMenuItem<FilterOptions>(
                    value: FilterOptions.all,
                    child: Text("All Todos"),
                  ),
                  const PopupMenuItem<FilterOptions>(
                    value: FilterOptions.completed,
                    child: Text("Completed Todos"),
                  ),
                  const PopupMenuItem<FilterOptions>(
                    value: FilterOptions.pending,
                    child: Text("Pending Todos"),
                  ),
                ];
              },
              onSelected: (FilterOptions value) {
                provider.setSelectedFilter(value);
              },
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
                child: TextFormField(
                  controller: searchConTe,
                  onChanged: (query) {
                    provider
                        .setSearchQuery(query); // Call setSearchQuery method
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 8.0),
                    filled: true,
                    fillColor: greyColr.withOpacity(0.2),
                    hintText: "Search...",
                    hintStyle: const TextStyle(fontSize: 16.0),
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 28.0,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ValueListenableBuilder<List<TodoModel>>(
                  valueListenable: provider.todosNotifier,
                  builder: (context, todos, child) {
                    final filteredTodos =
                        provider.getFilteredTodos(searchConTe.text);
                    if (filteredTodos.isEmpty) {
                      return AppUtils.noTaskImage(context);
                    }
                    return ListView.builder(
                      itemCount: filteredTodos.length,
                      itemBuilder: (context, index) {
                        final todo = filteredTodos[index];
                        return TodoListTile(
                          todo: todo,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: AppUtils.actionButton(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddTodoView()),
            ),
          ),
        );
      },
    );
  }
}
