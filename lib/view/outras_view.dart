// ignore_for_file: prefer_const_constructors, dead_code

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:construafacil/controller/outras_controller.dart';
import 'package:construafacil/model/outras.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../controller/outras_controller.dart';
import '../controller/login_controller.dart';
import '../model/outras.dart';

class OutrasView extends StatefulWidget {
  const OutrasView({super.key});

  @override
  State<OutrasView> createState() => _OutrasViewState();
}

class _OutrasViewState extends State<OutrasView> {
  TextEditingController txtTitulo = TextEditingController();
  TextEditingController txtNumero = TextEditingController();
  TextEditingController txtDescricao = TextEditingController();
  TextEditingController txtData = TextEditingController();
  TextEditingController txtPalavras = TextEditingController();
  TextEditingController txtLink = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Color.fromARGB(255, 44, 27, 237),
        title: Text(
          'Outras',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          //fluxo de dados
          stream: OutrasController().listarOutras().snapshots(),
          //exibição dos dados
          builder: (context, snapshot) {
            //verificar a conectividade
            switch (snapshot.connectionState) {
              //sem conexão
              case ConnectionState.none:
                return Center(
                  child: Text("Falha na conexão."),
                );

              //conexão lenta
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );

              //dados recuperados com sucesso
              default:
                final dados = snapshot.requireData;
                if (dados.size > 0) {
                  //exibir a lista de tarefas
                  return ListView.builder(
                    itemCount: dados.size,
                    itemBuilder: (context, index) {
                      //ID do documento
                      String id = dados.docs[index].id;

                      //DADOS armazenados no documento
                      dynamic item = dados.docs[index].data();

                      return Card(
                        child: ListTile(
                          title: Text(item['titulo']),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item['numero']),
                              Text(item['palavras_chave']),
                              Text(item['data_publicacao']),
                              Text(item['descricao']),
                              Text(item['link']),
                            ],
                          ), //
                          // Atualizar e Excluir Tarefas
                          //
                          trailing: SizedBox(
                            width: 80,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    txtTitulo.text = item['titulo'];
                                    txtNumero.text = item['numero'];
                                    txtPalavras.text = item['palavras_chave'];
                                    txtData.text = item['data_publicacao'];
                                    txtDescricao.text = item['descricao'];
                                    txtLink.text = item['link'];
                                    salvarOutras(context, docId: id);
                                  },
                                  icon: Icon(Icons.edit_rounded),
                                ),
                                IconButton(
                                  onPressed: () {
                                    OutrasController()
                                        .excluirOutras(context, id);
                                  },
                                  icon: Icon(Icons.delete_rounded),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {},
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text("Nenhuma coleção encontrada."),
                  );
                }
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          salvarOutras(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  //
  // ADICIONAR TAREFA
  //
  void salvarOutras(context, {docId}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: Text((docId == null) ? "Adicionar Outras" : "Editar "),
          content: SizedBox(
            height: 450,
            width: 300,
            child: Column(
              children: [
                TextField(
                  controller: txtTitulo,
                  decoration: InputDecoration(
                    labelText: 'titulo',
                    prefixIcon: Icon(Icons.description),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: txtNumero,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: 'numero',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: txtPalavras,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: 'palavras_chave',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: txtData,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: 'data_publicacao',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: txtDescricao,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: 'descricao',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: txtLink,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: 'link',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actionsPadding: EdgeInsets.fromLTRB(20, 0, 20, 10),
          actions: [
            TextButton(
              child: Text("fechar"),
              onPressed: () {
                txtTitulo.clear();
                txtNumero.clear();
                txtPalavras.clear();
                txtData.clear();
                txtDescricao.clear();
                txtLink.clear();
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text("salvar"),
              onPressed: () {
                //criação do objeto
                var o = Outras(
                  LoginController().idUsuario(),
                  txtTitulo.text,
                  txtNumero.text,
                  txtPalavras.text,
                  txtData.text,
                  txtDescricao.text,
                  txtLink.text,
                );

                if (docId == null) {
                  OutrasController().adicionarOutras(context, o);
                } else {
                  OutrasController().atualizarOutras(context, docId, o);
                }

                txtTitulo.clear();
                txtNumero.clear();
                txtPalavras.clear();
                txtData.clear();
                txtDescricao.clear();
                txtLink.clear();
              },
            ),
          ],
        );
      },
    );
  }
}
