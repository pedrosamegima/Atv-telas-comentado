import 'dart:math';  // Importa a biblioteca de matemática para funcionalidades como números aleatórios

import 'package:flutter/material.dart'; // Importa a biblioteca principal do Flutter.
import 'contador.dart';// Importa o arquivo 'contador.dart', provavelmente contendo o código para uma tela de contador

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Imc tela'),
    centerTitle: true,
    backgroundColor: Colors.blueGrey,
    ),
        body: Center(
          child: ElevatedButton(
              child: const Text('Clique para ir ao contador'),
              onPressed: (){
                Navigator.pushNamed(
                    context,
                    '/contador'
                );
              }
          ),
        )
    );
  }
}
class Imc extends StatefulWidget {
  const Imc({super.key});

  @override
  State<Imc> createState() => _ImcPageState();
}

class _ImcPageState extends State<Imc> {
  TextEditingController pesoController = new TextEditingController();
  TextEditingController alturaController = new TextEditingController();
  String _textoInfo = "Informe seus dados";

  void _limpar_tela(){
    // Função para limpar os campos de texto e redefinir o texto de informações.
    pesoController.text = "";
    alturaController.text = "";
    setState(() {
      _textoInfo= "Informe seus dados";
    });

  }
  void _calcular_Imc(){
    // Função para calcular o IMC e atualizar o texto de informações
    setState(() {
      double peso = double.parse(pesoController.text);// Converte a entrada de peso para double.
      double altura = double.parse(alturaController.text);// Converte a entrada de altura para double.

      double imc = peso/pow((altura/100),2);  // Calcula o IMC.

      if(imc<16.5){
        _textoInfo = "Desnutrido (${imc})";
      }
      else if(imc<=18.5){
        _textoInfo = "Abaixo do peso (${imc})";
      }
      else if(imc<=24.9){
        _textoInfo = "Peso ideal (${imc})";
      }
      else if(imc<=29.9){
        _textoInfo = "Sobre peso (${imc})";
      }
      else if(imc<=34.9){
        _textoInfo = "Obesidade grau 1(${imc})";
      }
      else if(imc<=39.9){
        _textoInfo = "Obesidade grau 2(${imc})";
      }
      else{
        _textoInfo = "Obesidade grau 3(${imc})";
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"), // Define o título do aplicativo.
        centerTitle: true,  // Centraliza o texto do título.
        backgroundColor: Colors.blueGrey, // Define a cor de fundo da barra de aplicativo
        actions: <Widget>[
          IconButton(
              onPressed: _limpar_tela,
              icon: Icon(Icons.refresh) // Ícone para o botão atualizar.
          )
        ],
      ),
      body: SingleChildScrollView (
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Icon(
                Icons.person_outline,
                size: 120.0,
                color: Colors.blueGrey,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "PESO(Kg)",
                    labelStyle: TextStyle(color: Colors.blueGrey)
                ),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0),
                controller: pesoController,
              ),
              //Segundo input para a altura
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "ALTURA(CM)",
                    labelStyle: TextStyle(color: Colors.blueGrey)
                ),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0),
                controller: alturaController,
              ),
              //Botão para executar o calculo do imc
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: SizedBox(
                  height:50.0,
                  child: ElevatedButton(
                      onPressed:_calcular_Imc,
                      child: const Text("Calcular")
                  ),
                ),
              ),
              Text(
                _textoInfo,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25.0
                ),
              ),
            ]
        ),
      ),
    );
  }
}
