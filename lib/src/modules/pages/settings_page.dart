
import 'package:flutter/material.dart';
import 'package:todo_app/src/widgets/app_bar_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBarWidget(
      title: 'Settings',
      body: Text("Freeman"),
    );
  }
}
