import 'package:flutter/material.dart';

void main() {
  runApp(const ProvaComponentes());
}

class ProvaComponentes extends StatefulWidget {
  const ProvaComponentes({Key? key}) : super(key: key);

  @override
  State<ProvaComponentes> createState() => _AulaComponentesState();
}

class _AulaComponentesState extends State<ProvaComponentes> {
  var perguntaAtual = 0;

  final List<Map<String, Object>> questionario = [
    {
      "pergunta": "Qual é o seu tipo de música preferido?",
      "respostas": ["Pop", "Rock", "Rap", "Eletrônica"]
    },
    {
      "pergunta": "Qual é a sua cor favorita?",
      "respostas": ["Azul", "Vermelho", "Amarelo", "Verde", "Roxo"]
    },
    {
      "pergunta": "Qual é o seu sabor de sorvete preferido?",
      "respostas": ["Chocolate", "Morango", "Baunilha"]
    },
    {
      "pergunta": "Qual é o seu destino de viagem dos sonhos?",
      "respostas": ["Praia paradisíaca", "Metrópole cosmopolita", "Paisagens montanhosas"]
    },
  ];

  List<dynamic> valoresSelecionados = [];

  bool get temPergunta {
    return perguntaAtual < questionario.length;
  }

  void acao(String resposta) {
    setState(() {
      valoresSelecionados.add(resposta);
      perguntaAtual++;
    });
    print(perguntaAtual);
  }

  void _exibirValoresSelecionados() {
    valoresSelecionados.forEach((valor) {
      print(valor);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> respostas = [];
    List<Widget> resultados = [];

    if (temPergunta) {
      for (var resposta in questionario[perguntaAtual]["respostas"] as List<String>) {
        respostas.add(
          Respostas(resposta, () => acao(resposta)),
        );
      }
    } else {
      _exibirValoresSelecionados();
      resultados = valoresSelecionados.map((valor) {
        return Container(
                width: 200,
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor:MaterialStatePropertyAll(Color.fromARGB(255, 255, 145, 0))
                  ),
                  onPressed: null,
                  child: Text(valor,
                    style: const TextStyle(
                      color: Colors.white,

                  )
                  ),
              ),

        );
        
      }).toList();
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: temPergunta ? Questao(questionario[perguntaAtual]["pergunta"].toString()) : const Text("Respostas Selecionadas"),
          backgroundColor: Colors.amber,
          centerTitle: true,
        ),
        body: temPergunta
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...respostas,
                ],
              )
            : Column(
                children: [
                  ...resultados,
                ],
              ),
      ),
    );
  }
}

class Respostas extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionar;

  const Respostas(this.texto, this.quandoSelecionar, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.amber),
        ),
        onPressed: quandoSelecionar,
        child: Text(texto),
      ),
    );
  }
}

class Questao extends StatelessWidget {
  final String texto;

  const Questao(this.texto, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Text(
        texto,
        style: const TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
