import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ATV CORES',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MudaCor(),
    );
  }
}





class MudaCor extends StatefulWidget {
  @override
  _MudaCorState createState() => _MudaCorState();
}






class _MudaCorState extends State<MudaCor> {
  Color _backgroundColor = const Color.fromARGB(221, 37, 36, 36);

  void _Mudar(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mudando as cores :)'),
      ),







      body: Container(
        color: _backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Clique nos respectivos programas para mudar a cor!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [




                const SizedBox(height: 20),
                const SizedBox(width: 100),
                ElevatedButton(
                  onPressed: () => _Mudar(Colors.pink),
                  child: const Text('Rosa'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                ),




                const SizedBox(height: 20),
                const SizedBox(width: 100),
                ElevatedButton(
                  onPressed: () => _Mudar(Colors.yellow),
                  child: const Text('Amarelo'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                ),




                const SizedBox(height: 20),
                const SizedBox(width: 100),
                ElevatedButton(
                  onPressed: () => _Mudar(Colors.white),
                  child: const Text('Branco'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                ),


              ],
            ),
          ],
        ),
      ),
    );
  }
}