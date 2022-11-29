import 'package:flutter/material.dart';

void main() {
  runApp(const PerguntaApp());
}

class PerguntaApp extends StatelessWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é seu animal favorito?'
    ];
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('oi'),
          ),
          body: Center(
            child: Column(
              children: [
                Text(perguntas[0]),
                Text(perguntas[1]),
                const ElevatedButton(
                  onPressed: null,
                  child: Text('Resposta 1'),
                ),
                const ElevatedButton(
                  onPressed: null,
                  child: Text('Resposta 2'),
                ),
                const ElevatedButton(
                  onPressed: null,
                  child: Text('Resposta 3'),
                )
              ],
            ),
          )),
    );
  }
}
