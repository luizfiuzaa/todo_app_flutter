import 'package:flutter/material.dart';
import 'package:todo_app/items/todo_item.dart';
import 'package:todo_app/services/todo_service.dart';
import 'package:todo_app/widgets/drawer_widget.dart';
import 'package:todo_app/widgets/todo_card_widget.dart';
import 'package:todo_app/widgets/todo_input_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text("To do"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const DrawerWidget(),
      body: const Column(
        children: [
          TodoInputWidget(),
          ToDoCardWidget(
            todoTitle: "Teste",
          ),
        ],
      ),
    );
  }
}
