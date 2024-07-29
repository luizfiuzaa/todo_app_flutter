// ignore_for_file: prefer_const_constructors

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
  late final _response;

  @override
  void initState() {
    _response.setValue(aiAtom.getTodo());
  }

  @override
  Widget build(BuildContext context) {
    _response.setValue();
    return Column(
      children: [
        Card(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(7.0),
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: Icon(Icons.android),
                    ),
                  ),
                  Text(
                    "AI HELPER: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 11, horizontal: 3),
                child: Row(
                  children: [
                    Text(_response),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 11, horizontal: 3),
                child: Row(
                  children: [
                    Text(_response),
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
