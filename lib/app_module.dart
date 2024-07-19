import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/pages/settings_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

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
