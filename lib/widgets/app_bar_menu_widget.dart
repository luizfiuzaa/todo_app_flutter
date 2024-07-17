import 'package:flutter/material.dart';

class AppBarMenuWidget extends StatelessWidget {
  const AppBarMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.list,
                size: 13,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(7.0),
            child: ListTile(
              title: Text("SETTINGS"),
              leading: Icon(Icons.settings_rounded),
              
            ),
          ),
        ],
      ),
    );
  }
}
