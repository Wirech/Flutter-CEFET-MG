import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'atv',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Gabriel Souza de Lima'),
        ),
        body: Center(
          child: MyColumn(),
        ),
      ),
    );
  }
}

class MyColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
          },
          child: const Text('Enviar'),
        ),
        const SizedBox(height: 16), 
        ElevatedButton(
          onPressed: () {
          },
          child: const Text('Cancelar'),
        ),
        const SizedBox(height: 16), 
        ElevatedButton(
          onPressed: () {
          },
          child: const Text('Salvar'),
        ),
        const SizedBox(height: 100),
        const Column(
          children: [
            Text('Aprendendo'),
            Text('Programação'),
            Text('Flutter'),
          ],
        ),
      ],
    );
  }
}