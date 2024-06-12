import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: PrincipalView(),
  ));
}

class PrincipalView extends StatefulWidget {
  const PrincipalView({Key? key}) : super(key: key);

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
  String? searchResult;

  String? selectedCollection;

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
                  },
                ),
                CircularIconButton(
                  label: 'Estaduais',
                  onTap: () {
                    Navigator.pushNamed(context, 'estaduais');
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
                  },
                ),
                CircularIconButton(
                  label: 'Outras',
                  onTap: () {
                    Navigator.pushNamed(context, 'outras');
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Pesquisar'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                        labelText: 'Digite algo para pesquisar',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Simulando um resultado de pesquisa
                        String fakeLink = 'http://link/norma.com.br';
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Resultado da pesquisa'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Link de retorno da pesquisa:'),
                                  SizedBox(height: 10),
                                  SelectableText(
                                    fakeLink,
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Pesquisar'),
                                          content: Text('Deseja salvar o resultado da pesquisa?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                // Coloque aqui a lógica para salvar
                                                setState(() {
                                                  searchResult = fakeLink;
                                                });
                                                showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text('Salvando...'),
                                                      content: Text('Pesquisando...'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                            Navigator.pop(context); // Fechar o último AlertDialog
                                                          },
                                                          child: Text('OK'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              child: Text('Sim'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                // Coloque aqui a lógica para apenas pesquisar
                                                showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text('Pesquisando...'),
                                                      content: Text('Pesquisando...'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                          },
                                                          child: Text('OK'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              child: Text('Não'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text('Pesquisar'),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.search),
        backgroundColor: Colors.blue,
      ),
    );
  }

  List<String> getList(String collection) {
    switch (collection) {
      case 'Federais':
        return [];
      case 'Estaduais':
        return [];
      case 'Municipais':
        return [];
      case 'Outras':
        return [];
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
