import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/src/modules/interactor/atoms/ai_atom.dart';
import 'package:todo_app/src/modules/interactor/atoms/todo_atom.dart';
import 'package:todo_app/src/modules/interactor/reducers/ai_reducer.dart';
import 'package:todo_app/src/modules/interactor/reducers/todo_reducer.dart';
import 'package:todo_app/src/modules/pages/ai_helper_page.dart';
import 'package:todo_app/src/modules/pages/home_page.dart';
import 'package:todo_app/src/modules/pages/settings_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<TodoAtom>(
          (i) => TodoAtom(),
          onDispose: (atoms) => atoms.dispose(),
        ),
        Bind.singleton<TodoReducer>(
          (i) => TodoReducer(),
          onDispose: (reducer) => reducer.dispose(),
        ),
        Bind.singleton<AiAtom>(
          (i) => AiAtom(),
          onDispose: (atoms) => atoms.dispose(),
        ),
        Bind.singleton<AiReducer>(
          (i) => AiReducer(),
          onDispose: (reducer) => reducer.dispose(),
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
        ChildRoute(
          '/ai_helper/',
          child: (context, args) => const AiHelperPage(),
        ),
      ];
}
