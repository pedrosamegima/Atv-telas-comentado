import 'package:flutter/material.dart';
import 'CadastroProduto.dart';

// Inicia o aplicativo
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) { // O widget principal 'Scaffold' define a estrutura básica da tela do aplicativo.

    return Scaffold(
      // Barra superior da tela exibindo o título centralizado e com fundo verde claro.
        appBar: AppBar(
          title: const Text('Tela de cadastro de usuarios'),
          centerTitle: true,
          backgroundColor: Colors.lightGreenAccent,
        ),
        // Corpo da tela centralizado com um botão 'ElevatedButton'
        body: Center(
          child: ElevatedButton(
            // Texto exibido no botão
              child: const Text('Leva pra tela de cadastro dos produtos'),
              // Ação executada ao clicar no botão: navega para a rota '/CadastroProduto'.
              onPressed: (){
                Navigator.pushNamed(
                    context,
                    '/CadastroProduto'  // Nome da rota
                );
              }
          ),
        )
    );
  }
}
// Esta classe representa a tela de cadastro de usuário
class CadastroUser extends StatefulWidget {
  const CadastroUser({super.key});

  @override
  State<CadastroUser> createState() => _CadastroUserState();
}

// Controladores para os campos de texto 'usuario' e 'senha'.
class _CadastroUserState extends State<CadastroUser> {
  TextEditingController usuarioController =TextEditingController();
  TextEditingController senhaController = TextEditingController();
  String _textInfo = "Informe seus dados";  // String para armazenar a mensagem de informação exibida na tela

// Função para cadastrar o usuário
  void _cadastro() {
    setState(() {
      // Recupera o texto digitado nos campos de usuário e senha.
      String user = usuarioController.text;
      String senha = senhaController.text;
      // Verifica se os campos estão vazios e atualiza a mensagem de informação.
      if (user.isEmpty || senha.isEmpty) {
        _textInfo = "O campos estão vazios";
      } else {
        _textInfo = "Usuario foi cadastrado com sucesso";
      }

    });
  }
  // Função para limpar os campos de texto e a mensagem de informação.
  void _limpar_tela(){
    usuarioController.text = "";
    senhaController.text = "";
    setState(() {
      _textInfo = "Informe seus dados";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de usuario"),
        centerTitle: true,
        backgroundColor: Colors.lightGreenAccent,
        actions: <Widget>[
          IconButton(onPressed: _limpar_tela, icon: Icon(Icons.refresh))
        ],
      ),
      // Corpo da tela com scroll caso o conteúdo ultrapasse a tela.
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Column(
          // Organiza os widgets na vertical.
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Ícone de 'pessoa' no topo da tela.
            const Icon(
              Icons.person,
              size: 120.0,
              color: Colors.lightGreenAccent,
            ),
            // Campo de texto para inserir o nome de usuário.
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Usuario",
                  labelStyle: TextStyle(color: Colors.lightGreenAccent)),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: usuarioController,
            ),
            // Campo de texto para inserir a senha do usuario
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(color: Colors.lightGreenAccent)),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              obscureText: true,
              controller: senhaController,
            ),
            Padding(
             //Adiciona espaçamento acima e abaixo do widget
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: SizedBox(
                height: 50.0, // Define a altura fixa do widget
                child: ElevatedButton(
                  onPressed: _cadastro,// Função que será chamada quando o botão for pressionado
                  child: const Text("Cadastre-se"),
                ),
              ),
            ),
            Text( // Texto dinâmico que será atualizado com a variável
              _textInfo,
              textAlign: TextAlign.center,// Alinha o texto ao centro
              style: TextStyle(color: Colors.lightGreenAccent, fontSize: 25.0), // Estilo do texto, cor e tamanho da fonte
            )
          ],
        ),
      ),
    );
  }
}



