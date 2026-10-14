import 'dart:convert'; // Converter JSON par Map
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Requisições HTTP

void main() {
  runApp(const MainApp());
}

//Aplicação Principal
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ConsultaCepPage(),
    );
  }
}

//Tela de Consulta de CEP
class ConsultaCepPage extends StatefulWidget {
  const ConsultaCepPage({super.key});

  @override
  State<ConsultaCepPage> createState() => _ConsultaCepPageState();
}

class _ConsultaCepPageState extends State<ConsultaCepPage> {

  //Pega o Cep digitado pelo usuário
  TextEditingController cepController = TextEditingController();
  
  //Variável para armazenar o resultado da consulta
  String resultado = "";

  //Função para consultar o CEP
  Future<void> consultarCep() async {
    String url = "https://viacep.com.br/ws/${cepController.text}/json/";

    //Fazendo a requisição HTTP
    var response = await http.get(Uri.parse(url));

    //Convertendo a resposta para Map
    Map dados = json.decode(response.body);

    //Atualizando a variável resultado e a Tela
    setState(() {
      resultado = "CEP: ${dados['cep']}\n"
                  "Logradouro: ${dados['logradouro']}\n"
                  "Bairro: ${dados['bairro']}\n"
                  "Cidade: ${dados['localidade']}\n"
                  "Estado: ${dados['uf']}";
    });

  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta de CEP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        
        child: Column(
          children: [
            TextField(
              controller: cepController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite o CEP',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            //Botão para consultar o CEP
            ElevatedButton(onPressed: consultarCep, child: const Text("Consultar CEP")),

            const SizedBox(height: 20),

            Text("Resultado da Consulta: $resultado", style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}
