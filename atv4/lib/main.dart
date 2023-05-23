import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Tela(),
    );
  }
}

class Tela extends StatefulWidget {
  @override
  _TelaState createState() => _TelaState();
}

class _TelaState extends State<Tela> {
  final TextEditingController _textEditingController = TextEditingController();
  List<String> componenteresposta = [];
  int i=0;
  void _CreateButton() {
    setState(() {
      i++;
      String texto = "Botão $i";
      componenteresposta.add(texto);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componente Resposta'),
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: componenteresposta.length,
              itemBuilder: (BuildContext context, int index) {
                
               return Container(
              child:Row(
                children: [
                  ElevatedButton(
                   style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.amber,
                
                   ),
                   onPressed: () {
                   },
                   child: Text(componenteresposta[index]),
                 ),
                ],
              )
              
            );
              },
            ),
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                
                
                ElevatedButton(
                  onPressed: _CreateButton,
                  style: ElevatedButton.styleFrom(
                  backgroundColor:  Colors.yellow,
                  ),
                  child: const Text('Criar')
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}