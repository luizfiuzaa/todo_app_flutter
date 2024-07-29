import 'package:asp/asp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/modules/interactor/atoms/ai_atom.dart';
import 'package:todo_app/src/services/api_service.dart';


class AiReducer extends Reducer {
  final AiAtom aiAtom= Modular.get<AiAtom>();

  AiReducer(){
    on(() => [aiAtom.getTodo], () async{
      
    });
  }

  void dispose();
}