import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListileWidget extends StatelessWidget {
  const ListileWidget({
    super.key,
    required this.leading,
    required this.title,
    required this.route,
  });
  final Widget leading;
  final String title;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: ListTile(
            leading: leading,
            title: Text(title),
            onTap: () {
              Modular.to.navigate(route);
              Modular.to.pop();
            }),
      ),
    );
  }
}
