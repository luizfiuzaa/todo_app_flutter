import 'package:flutter/material.dart';
import 'package:todo_app/widgets/listile_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: const Padding(
              padding: EdgeInsets.all(7.0),
              child: ListTile(
                tileColor: Colors.red,
                textColor: Colors.white70,
                iconColor: Colors.white70,
                title: Text("CLEAR DATA"),
                leading: Icon(Icons.delete),
                // onTap: () => delete all todo's,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
