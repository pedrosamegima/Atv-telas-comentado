import 'package:flutter/material.dart'; // Importa a biblioteca principal do Flutter
// Esta classe representa a tela inicial do aplicativo
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // O widget principal 'Scaffold' define a estrutura básica do app
        appBar: AppBar(
          title:  Text('Tela de cadastro dos produtos'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: ElevatedButton(
            // Ação executada ao clicar no botão: navega de volta para a rota inicial.
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text ('voltar')
          ),
        )
    );
  }
}
// Esta classe representa a tela de cadastro de produto.
class CadastroProduto extends StatefulWidget {
  const CadastroProduto({super.key});

  @override
  State<CadastroProduto> createState() => _CadastroProdutoState();
}

class _CadastroProdutoState extends State<CadastroProduto> {
  //Campos de texto 'nome' e 'descricao'.
  TextEditingController nomeController =TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  String _textInfo = "Informe seus dados"; // String para armazenar a mensagem de informação exibida na tela.

  // Função para cadastrar o produto
  void _cadastro() {
    setState(() {
      String nome = nomeController.text;
      String descricao = descricaoController.text;
      if (nome.isEmpty || descricao.isEmpty) {
        _textInfo = "O campos estão vazios";
      } else {
        _textInfo = "Produto foi cadastrado com sucesso";
      }

    });
  }
  // Função para limpar os campos de texto e a mensagem de informação.

  void _limpar_tela(){
    nomeController.text = "";
    descricaoController.text = "";
    setState(() {
      _textInfo = "Informe os dados do produto";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de produto"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        actions: <Widget>[
          IconButton(onPressed: _limpar_tela, icon: Icon(Icons.refresh))
        ],
      ),
      // Corpo da tela com scroll caso o conteúdo ultrapasse a tela.
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Icon(
              Icons.person,
              size: 120.0,
              color: Colors.deepPurpleAccent,
            ),
            // Campo de texto para inserir o nome do produto.
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Nome do produto",
                  labelStyle: TextStyle(color: Colors.deepPurpleAccent)),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: nomeController,
            ),
            // Campo de texto para inserir a descrição do produto
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Descricao do produto",
                  labelStyle: TextStyle(color: Colors.deepPurpleAccent)),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              obscureText: true,
              controller: descricaoController,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: SizedBox(
                height: 50.0,
                child: ElevatedButton(
                  onPressed: _cadastro,
                  child: const Text("Cadastre-se"),
                ),
              ),
            ),
            Text(
              _textInfo,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue, fontSize: 25.0),
            )
          ],
        ),
      ),
    );
  }
}

