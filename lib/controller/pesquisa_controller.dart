import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/pesquisa_view.dart';
import '../view/util.dart';
import 'login_controller.dart';


class PesquisaController {
  void adicionar(context, Pesquisa p) {
    FirebaseFirestore.instance
        .collection('Minhas Legislações')
        .add(p.toJson())
        .then((resultado) => sucesso(context, 'Legislação adicionada com sucesso'))
        .catchError((e) => erro(context, 'Não foi possível adicionar essa Legislação'))
        .whenComplete(() => Navigator.pop(context));
  }


//Listar todas as tarefas do Usuário autenticado
  listar(){
    return FirebaseFirestore.instance.collection('Minhas Legislações')
      .where('uid', isEqualTo: LoginController().idUsuario());
  }

  void atualizar(context,id,Pesquisa p){
    FirebaseFirestore.instance.collection('Minhas Legislações')
      .doc(id)
      .update(p.toJson())
      .then((resultado) => sucesso(context, 'Informações da Legislação atualizadas com sucesso'))
      .catchError((e) => erro(context, 'Não foi possível atualizar a legislação'))
      .whenComplete(() => Navigator.pop(context));
  }

  void excluir(context,id){
    FirebaseFirestore.instance.collection('Minhas Legislações')
      .doc(id)
      .delete()
      .then((resultado) => sucesso(context, 'Legislação excluída com sucesso'))
      .catchError((e) => erro(context, 'Não foi possível excluir a legislação'));
  }


}