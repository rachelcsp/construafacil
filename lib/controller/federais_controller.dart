// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:construafacil/model/federais.dart';
import 'package:flutter/material.dart';


import '../model/federais.dart';
import '../view/util.dart';
import 'login_controller.dart';

class FederaisController {
  void adicionarFederais(context) {
    FirebaseFirestore.instance
        .collection('federais')
        .add(   
          {
            'titulo' : 'Exemplo de título',
            'numero' : '12345',
            'palavras_chave' : 'palavra1, palavra2, palavra3',
            'data_publicacao' : '01/01/2001',
            'descricao' : 'Exemplo de descrição',
            'link' : 'http://wwww.link.com.br'
          }
          )
        .then((resultado) => sucesso(context, 'Coleção adicionada com sucesso'))
        .catchError((e) => erro(context, 'Não foi possível adicionar a coleção'));
  }

  //Listar todas as tarefas do Usuário autenticado
  listarFederais(){
    return FirebaseFirestore.instance.collection('federais').where('uid', isEqualTo: LoginController().idUsuario());
    
  }

  void atualizarFederais(context,id, Federais f){
    FirebaseFirestore.instance.collection('federais')
      .doc(id)
      .update(f.toJson())
      .then((resultado) => sucesso(context, 'Norma atualizada com sucesso'))
      .catchError((e) => erro(context, 'Não foi possível atualizar a tarefa'))
      .whenComplete(() => Navigator.pop(context));
  }

  void excluirFederais(context,id){
     FirebaseFirestore.instance.collection('federais')
      .doc(id)
      .delete()
      .then((resultado) => sucesso(context, 'Norma excluída com sucesso'))
      .catchError((e) => erro(context, 'Não foi possível excluir a tarefa'));
  }





}