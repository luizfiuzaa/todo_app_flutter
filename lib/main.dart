import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/app_module.dart';
import 'package:todo_app/app_widget.dart';
import 'package:todo_app/modules/adapter/todo_adapter.dart';
import 'package:todo_app/modules/boxes/todo_box.dart';
import 'package:todo_app/modules/hive/hive_config/hive_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();
  Hive.registerAdapter(TodoItemAdapter());
  todoBox = await Hive.openBox<TodoItem>('todoBox');
  runApp(
    RxRoot(
      child: ModularApp(
        module: AppModule(),
        child: const AppWidget(),
      ),
    ),
  );
}
