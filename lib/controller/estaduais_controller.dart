// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:construafacil/model/estaduais.dart';
import 'package:flutter/material.dart';

import '../view/util.dart';
import 'login_controller.dart';

class EstaduaisController {
  void adicionarEstaduais(context, Estaduais e) {
    FirebaseFirestore.instance
        .collection('estaduais')
        .add(e.toJson())
        .then((resultado) => sucesso(context, 'Norma adicionada com sucesso'))
        .catchError(
            (e) => erro(context, 'Não foi possível adicionar a norma a coleção'));
  }

  //Listar todas as tarefas do Usuário autenticado
  listarEstaduais() {
    return FirebaseFirestore.instance
        .collection('estaduais')
        .where('uid', isEqualTo: LoginController().idUsuario());
  }

  void atualizarEstaduais(context, id, Estaduais e) {
    FirebaseFirestore.instance
        .collection('estaduais')
        .doc(id)
        .update(e.toJson())
        .then((resultado) => sucesso(context, 'Norma atualizada com sucesso'))
        .catchError((e) => erro(context, 'Não foi possível atualizar a Norma'))
        .whenComplete(() => Navigator.pop(context));
  }

  void excluirEstaduais(context, id) {
    FirebaseFirestore.instance
        .collection('estaduais')
        .doc(id)
        .delete()
        .then((resultado) => sucesso(context, 'Norma excluída com sucesso'))
        .catchError((e) => erro(context, 'Não foi possível excluir a Norma'));
  }
}
