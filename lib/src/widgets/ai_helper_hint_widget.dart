import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/src/modules/interactor/atoms/ai_atom.dart';
import 'package:todo_app/src/modules/interactor/atoms/todo_atom.dart';

class AiHelperHintWidget extends StatefulWidget {
  const AiHelperHintWidget({super.key});

  @override
  State<AiHelperHintWidget> createState() => _AiHelperHintWidgetState();
}

class _AiHelperHintWidgetState extends State<AiHelperHintWidget> {
  final aiAtom = Modular.get<AiAtom>();
  final todoAtom = Modular.get<TodoAtom>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final aiResponse = context.select(() => todoAtom.aiResult.value);

    return Column(
      children: [
        Card(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(7.0),
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: const Icon(Icons.android),
                    ),
                  ),
                  const Text(
                    "AI HELPER:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 11, horizontal: 3),
                child: Row(
                  children: [
                    Text(aiResponse ?? 'Loading'),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
