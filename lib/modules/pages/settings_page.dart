// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:todo_app/src/widgets/drawer_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text("To do"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: DrawerWidget(),
      body: Container(
        child: Text("Freeman"),
      ),
    );
  }
}
