// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:construafacil/model/federais.dart';
import 'package:flutter/material.dart';

import '../controller/federais_controller.dart';
import '../controller/estaduais_controller.dart';
import '../controller/municipais_controller.dart';
import '../controller/outras_controller.dart';

class PrincipalView extends StatefulWidget {
  const PrincipalView({super.key});

  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {
  TextEditingController txtTitulo = TextEditingController();
  TextEditingController txtNumero = TextEditingController();
  TextEditingController txtDescricao = TextEditingController();
  TextEditingController txtData = TextEditingController();
  TextEditingController txtPalavras = TextEditingController();

  bool isSearching = false;

  String? selectedCollection;

  List<String> federais = [];
  List<String> estaduais = [];
  List<String> municipais = [];
  List<String> outras = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 44, 27, 237),
        title: Text(
          'Construa Fácil',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.exit_to_app, color: Colors.white),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularIconButton(
                  label: 'Federais',
                  onTap: () {
                    Navigator.pushNamed(context, 'federais');
                    setState(() {
                      isSearching = false;
                      selectedCollection = 'Federais';
                    });
                  },
                ),
                CircularIconButton(
                  label: 'Estaduais',
                  onTap: () {
                    Navigator.pushNamed(context, 'estaduais');
                    setState(() {
                      isSearching = false;
                      selectedCollection = 'Estaduais';
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularIconButton(
                  label: 'Municipais',
                  onTap: () {
                    Navigator.pushNamed(context, 'municipais');
                    setState(() {
                      isSearching = false;
                      selectedCollection = 'Municipais';
                    });
                  },
                ),
                CircularIconButton(
                  label: 'Outras',
                  onTap: () {
                    Navigator.pushNamed(context, 'outras');
                    setState(() {
                      isSearching = false;
                      selectedCollection = 'Outras';
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            if (isSearching) ...[
              TextField(
                controller: txtTitulo,
                decoration: InputDecoration(
                  labelText: 'Titulo',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: txtNumero,
                decoration: InputDecoration(
                  labelText: 'Número',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: txtDescricao,
                decoration: InputDecoration(
                  labelText: 'Descrição',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: txtData,
                decoration: InputDecoration(
                  labelText: 'Data de Publicação',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: txtPalavras,
                decoration: InputDecoration(
                  labelText: 'Palavras-chave',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ],
            if (!isSearching && selectedCollection != null)
              Expanded(
                child: ListView.builder(
                  itemCount: getList(selectedCollection!).length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(getList(selectedCollection!)[index]),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  List<String> getList(String collection) {
    switch (collection) {
      case 'Federais':
        return federais;
      case 'Estaduais':
        return estaduais;
      case 'Municipais':
        return municipais;
      case 'Outras':
        return outras;
      default:
        return [];
    }
  }
}

class CircularIconButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const CircularIconButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Color.fromARGB(255, 44, 27, 237),
            radius: 60,
            child: Text(
              label,
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
