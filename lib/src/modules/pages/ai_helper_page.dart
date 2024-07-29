import 'package:flutter/material.dart';
import 'package:todo_app/src/widgets/ai_helper_hint_widget.dart';
import 'package:todo_app/src/widgets/app_bar_widget.dart';

class AiHelperPage extends StatelessWidget {
  const AiHelperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBarWidget(
        title: 'AI Helper',
        body: Column(
          children: [AiHelperHintWidget()],
        ));
  }
}
