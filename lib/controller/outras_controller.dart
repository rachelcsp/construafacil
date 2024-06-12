// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:construafacil/model/outras.dart';
import 'package:flutter/material.dart';

import '../view/util.dart';
import 'login_controller.dart';

class OutrasController {
  void adicionarOutras(context, Outras o) {
    FirebaseFirestore.instance
        .collection('outras')
        .add(o.toJson())
        .then((resultado) => sucesso(context, 'Norma adicionada com sucesso'))
        .catchError(
            (e) => erro(context, 'Não foi possível adicionar a norma a coleção'));
  }


  listarOutras() {
    return FirebaseFirestore.instance
        .collection('outras')
        .where('uid', isEqualTo: LoginController().idUsuario());
  }

  void atualizarOutras(context, id, Outras o) {
    FirebaseFirestore.instance
        .collection('outras')
        .doc(id)
        .update(o.toJson())
        .then((resultado) => sucesso(context, 'Norma atualizada com sucesso'))
        .catchError((e) => erro(context, 'Não foi possível atualizar a Norma'))
        .whenComplete(() => Navigator.pop(context));
  }

  void excluirOutras(context, id) {
    FirebaseFirestore.instance
        .collection('outras')
        .doc(id)
        .delete()
        .then((resultado) => sucesso(context, 'Norma excluída com sucesso'))
        .catchError((e) => erro(context, 'Não foi possível excluir a Norma'));
  }
}
