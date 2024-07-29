import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/src/modules/interactor/atoms/todo_atom.dart';
import 'package:todo_app/src/widgets/listile_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final todoAtom = Modular.get<TodoAtom>();
    return Drawer(
      child: Column(
        children: [
          const Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.android_rounded,
                    size: 50,
                  ),
                ),
              ),
            ],
          ),
          const ListileWidget(
            leading: Icon(Icons.home),
            title: 'HOME',
            route: '/',
          ),
          const ListileWidget(
            leading: Icon(Icons.settings),
            title: 'SETTINGS',
            route: '/settings/',
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Colors.red.shade500,
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.all(5),
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: ListTile(
                tileColor: Colors.red,
                textColor: Colors.white70,
                iconColor: Colors.white70,
                title: const Text("CLEAR DATA"),
                leading: const Icon(Icons.delete),
                onTap: () {
                  todoAtom.deleteAllTodoAction();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
