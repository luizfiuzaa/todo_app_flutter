import 'package:asp/asp.dart';
import 'package:flutter/material.dart';

class ToDoCardWidget extends StatelessWidget {
  const ToDoCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(7),
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Center(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: CheckBoxWidget(),
                  title: const Text(
                    "TESTE",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  subtitle: const Text("Teste teste"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CheckBoxWidget extends StatefulWidget {
  final a = Atom<bool>(false);
  CheckBoxWidget({super.key});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    final b = context.select(() => widget.a);

    return Checkbox(
        value: b.value,
        onChanged: (v) {
          b.setValue(v!);
        });
  }
}
