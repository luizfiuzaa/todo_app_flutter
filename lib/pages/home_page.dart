import 'package:flutter/material.dart';
import 'package:todo_app/widgets/drawer_widget.dart';
import 'package:todo_app/widgets/todo_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  save() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Scaffold(
        appBar: AppBar(
          title: const Text("To do"),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        drawer: const DrawerWidget(),
        body: Column(
          children: [
            // TextField(),
            // ElevatedButton(
            //   onPressed: () {
            //     save();
            //   },
            //   child: Icon(Icons.save),
            // ),
            ToDoCardWidget(),
          ],
        ),
      ),
    );
  }
}
