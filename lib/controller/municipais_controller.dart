// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:construafacil/model/municipais.dart';
import 'package:flutter/material.dart';

import '../view/util.dart';
import 'login_controller.dart';

class MunicipaisController {
  void adicionarMunicipais(context, Municipais m) {
    FirebaseFirestore.instance
        .collection('municipais')
        .add(m.toJson())
        .then((resultado) => sucesso(context, 'Norma adicionada com sucesso'))
        .catchError(
            (e) => erro(context, 'Não foi possível adicionar a norma a coleção'));
  }


  listarMunicipais() {
    return FirebaseFirestore.instance
        .collection('municipais')
        .where('uid', isEqualTo: LoginController().idUsuario());
  }

  void atualizarMunicipais(context, id, Municipais m) {
    FirebaseFirestore.instance
        .collection('municipais')
        .doc(id)
        .update(m.toJson())
        .then((resultado) => sucesso(context, 'Norma atualizada com sucesso'))
        .catchError((e) => erro(context, 'Não foi possível atualizar a Norma'))
        .whenComplete(() => Navigator.pop(context));
  }

  void excluirMunicipais(context, id) {
    FirebaseFirestore.instance
        .collection('municipais')
        .doc(id)
        .delete()
        .then((resultado) => sucesso(context, 'Norma excluída com sucesso'))
        .catchError((e) => erro(context, 'Não foi possível excluir a Norma'));
  }
}
