import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/src/interactor/atoms/todo_atom.dart';
import 'package:todo_app/src/interactor/reducers/todo_reducer.dart';
import 'package:todo_app/src/pages/home_page.dart';
import 'package:todo_app/src/pages/settings_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<TodoAtom>(
          (i) => TodoAtom(),
          onDispose: (atoms) => atoms.dispose(),
          // export: true,
        ),
        Bind.singleton<TodoReducer>(
          (i) => TodoReducer(),
          onDispose: (reducer) => reducer.dispose(),
          // export: true,
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => HomePage(),
        ),
        ChildRoute(
          '/settings/',
          child: (context, args) => const SettingsPage(),
        ),
      ];
}
