
import 'package:flutter/material.dart';
import 'dart:math';


List<FichaData> fichas = [];

void main() {
  runApp(
    MaterialApp(
      title: 'Componente ficha',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(
        title: 'Componente ficha Home Page',
        fichas: fichas, // Passa a lista de fichas para a página MyHomePage
      ),
      routes: {
        '/createFicha': (context) => const CreateFichaPage(fichas: [],),
      },
    ),
  );
}


class MyApp extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componente ficha',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Componente ficha Home Page', fichas: [],),
      routes: {
        '/createFicha': (context) => const CreateFichaPage(fichas: [],),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.fichas});

  final String title;
  final List<FichaData> fichas;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 260.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/createFicha');
              },
              child: const Text('Criar Ficha'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FichasPage(fichas: widget.fichas)),
              );
              },
              child: const Text('Acessar Fichas'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: widget.fichas.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(widget.fichas[index].name),
                    subtitle: Text('Matrícula: ${widget.fichas[index].registrationNumber}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateFichaPage extends StatefulWidget {
  const CreateFichaPage({Key? key, required this.fichas});

  final List<FichaData> fichas;

  @override
  _CreateFichaPageState createState() => _CreateFichaPageState();
}

class _CreateFichaPageState extends State<CreateFichaPage> {
  String? _selectedImage;

  final List<String> _imageOptions = [
    'assets/homem.png',
    'assets/mulher.png',
    'assets/none.jpeg',
  ];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();

  String _generateRegistrationNumber() {
    Random random = Random();
    int randomNumber = random.nextInt(900000) + 100000; // Gera um número aleatório entre 100000 e 999999
    return randomNumber.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Ficha'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                ),
              ),
              TextFormField(
                controller: _schoolController,
                decoration: const InputDecoration(
                  labelText: 'Escola',
                ),
              ),
              TextFormField(
                controller: _yearController,
                decoration: const InputDecoration(
                  labelText: 'Ano/Período',
                ),
              ),
              const SizedBox(height: 16),
              const Text('Selecione uma imagem:'),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildImageOptions(),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  String name = _nameController.text;
                  String school = _schoolController.text;
                  String year = _yearController.text;
                  String registrationNumber = _generateRegistrationNumber();
                  String imagePath = _selectedImage ?? 'assets/none.jpeg'; // Caminho da imagem selecionada ou imagem padrão

                  FichaData fichaData = FichaData(
                    name: name,
                    school: school,
                    year: year,
                    registrationNumber: registrationNumber,
                    imagePath: imagePath, // Atribui o caminho da imagem selecionada
                  );

                  MyHomePage? homePage = context.findAncestorWidgetOfExactType<MyHomePage>();
                  if (homePage != null) {
                    widget.fichas.add(fichaData);
                  }

                  Navigator.pop(context);
                },
                child: const Text('Salvar'),
              ),

            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildImageOptions() {
    return _imageOptions.map((imagePath) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _selectedImage = imagePath;
          });
        },
        child: Container(
          margin: const EdgeInsets.all(8),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
              color: _selectedImage == imagePath
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }).toList();
  }
}

class FichasPage extends StatelessWidget {
  final List<FichaData> fichas;

  const FichasPage({Key? key, required this.fichas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fichas'),
      ),
      body: ListView.builder(
        itemCount: fichas.length,
        itemBuilder: (context, index) {
          final fichaData = fichas[index];

          return Card(
            child: ListTile(
              leading: Image.asset(fichaData.imagePath),
              title: Text(fichaData.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Escola: ${fichaData.school}'),
                  Text('Ano/Período: ${fichaData.year}'),
                  Text('Matrícula: ${fichaData.registrationNumber}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}





class FichaData {
  final String name;
  final String school;
  final String year;
  final String registrationNumber;
  final String imagePath; 

  FichaData({
    required this.name,
    required this.school,
    required this.year,
    required this.registrationNumber,
    required this.imagePath,
  });
}
