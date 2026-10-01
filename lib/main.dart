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

  TextEditingController cepController = TextEditingController();

  void consultarCep(){
    
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
            ElevatedButton(onPressed: consultarCep, child: const Text("Consultar CEP")),
          ],
        ),
      ),
    );
  }
}
