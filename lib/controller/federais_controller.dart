// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:construafacil/model/federais.dart';
import 'package:flutter/material.dart';

import '../view/util.dart';
import 'login_controller.dart';

class FederaisController {
  void adicionarFederais(context, Federais f) {
    FirebaseFirestore.instance
        .collection('federais')
        .add(f.toJson())
        .then((resultado) => sucesso(context, 'Norma adicionada com sucesso'))
        .catchError(
            (e) => erro(context, 'Não foi possível adicionar a norma a coleção'));
  }


  listarFederais() {
    return FirebaseFirestore.instance
        .collection('federais')
        .where('uid', isEqualTo: LoginController().idUsuario());
  }

  void atualizarFederais(context, id, Federais f) {
    FirebaseFirestore.instance
        .collection('federais')
        .doc(id)
        .update(f.toJson())
        .then((resultado) => sucesso(context, 'Norma atualizada com sucesso'))
        .catchError((e) => erro(context, 'Não foi possível atualizar a Norma'))
        .whenComplete(() => Navigator.pop(context));
  }

  void excluirFederais(context, id) {
    FirebaseFirestore.instance
        .collection('federais')
        .doc(id)
        .delete()
        .then((resultado) => sucesso(context, 'Norma excluída com sucesso'))
        .catchError((e) => erro(context, 'Não foi possível excluir a Norma'));
  }
}
