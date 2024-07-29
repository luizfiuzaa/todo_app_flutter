import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/src/app_module.dart';
import 'package:todo_app/src/app_widget.dart';
import 'package:todo_app/src/modules/adapter/todo_adapter.dart';
import 'package:todo_app/src/modules/boxes/todo_box.dart';
import 'package:todo_app/src/modules/hive/hive_config/hive_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();
  Hive.registerAdapter(TodoItemAdapter());
  todoBox = await Hive.openBox<TodoItem>('todoBox');
  await dotenv.load();
  runApp(
    RxRoot(
      child: ModularApp(
        module: AppModule(),
        child: const AppWidget(),
      ),
    ),
  );
}
