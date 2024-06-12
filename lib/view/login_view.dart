// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import '../controller/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  var txtEmailEsqueceuSenha = TextEditingController();

  List<String> list = <String>['Master', 'Convidado'];
  String dropdownValue = 'Master';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 44, 27, 237),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 50, 30, 50),
        child: Column(
          children: [
            Text(
              'Login',
              style: TextStyle(color: Colors.white, fontSize: 60),
            ),

            SizedBox(height: 40),
            DropdownButton<String>(
              dropdownColor: Color.fromARGB(255, 44, 27, 237),
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.white),
              underline: Container(
                height: 2,
                color: Colors.white,
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            SizedBox(height:15),
            TextField(
              controller: txtEmail,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder()),
            ),

            SizedBox(height: 15),
            TextField(
              controller: txtSenha,
              obscureText: true,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Senha',
                  prefixIcon: Icon(Icons.password),
                  border: OutlineInputBorder()),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Color.fromARGB(255, 44, 27, 237),
                        title: Text(
                          "Esqueceu a senha?",
                          style: TextStyle(color: Colors.white),
                        ),
                        content: Container(
                          height: 150,
                          child: Column(
                            children: [
                              Text(
                                "Identifique-se para receber um e-mail com as instruções e o link para criar uma nova senha.",style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 25),
                              TextField(
                                controller: txtEmailEsqueceuSenha,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  labelText: 'Email',
                                  prefixIcon: Icon(Icons.email),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        actionsPadding: EdgeInsets.all(20),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('cancelar'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              LoginController().esqueceuSenha(
                                context,
                                txtEmailEsqueceuSenha.text,
                              );

                              Navigator.pop(context);
                            },
                            child: Text('enviar'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  'Esqueceu a senha?',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 40),
              ),
              onPressed: () {
                LoginController().login(
                  context,
                  txtEmail.text,
                  txtSenha.text,
                );
                txtEmail.clear();
                txtSenha.clear();
              },
              child: Text('Entrar'),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ainda não tem conta?',
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'cadastrar');
                  },
                  child: Text(
                    'Cadastre-se',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
              
            ),

            //
            //Caixa de Texto "Sobre nós"
            //
            SizedBox(height: 100),
                TextButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      backgroundColor: Color.fromARGB(255, 44, 27, 237),
                      title: const Text('Sobre nós', style: TextStyle(color: Colors.white)),
                      content: const 
                      Text('Somos um aplicativo que busca facilitar a vida dos profisisonais da Construção Civil, nós iremos te ajudar a desenvolver seu projeto sem erros!', style: TextStyle(color: Colors.white)),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Sair'),
                          child: const Text('X',style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                  child: const Text('Sobre nós',style:TextStyle (color: Colors.white),),
                )
          ],
        ),  
      ),
    );  
  }
}
