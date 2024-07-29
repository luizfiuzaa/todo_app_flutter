import 'dart:developer';

import 'package:asp/asp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/src/modules/interactor/atoms/ai_atom.dart';
import 'package:todo_app/src/modules/interactor/atoms/todo_atom.dart';
import 'package:todo_app/src/services/api_service.dart';


class AiReducer extends Reducer {
  final AiAtom aiAtom= Modular.get<AiAtom>();
  final TodoAtom todoAtom = Modular.get<TodoAtom>();
  final ApiService _apiService = ApiService();
  AiReducer(){
    on(() => [aiAtom.getTodo], () async{
      final prompt = 'Cite somente em tópicos resumidos como posso fazer a seguinte atividade: ${todoAtom.helpAiTodoAction}';
      final response = await _apiService.getChatGptResponse(prompt);
      response.toString();
      log(response);
    });
  }

  void dispose();
}