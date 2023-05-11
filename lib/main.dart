import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

void main() => runApp(const PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  void responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        perguntaSelecionada++;
        pontuacaoTotal = pontuacao + pontuacaoTotal;
      });
    }
  }

  void reiniciarQuestionario() {
    setState(() {
      perguntaSelecionada = 0;
      pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  int perguntaSelecionada = 0;
  int pontuacaoTotal = 0;
  final List<Map<String, Object>> perguntas = const [
    {
      'Texto': 'Qual a sua cor favorita?',
      'respostas': [
        {'Texto': 'Preto', 'Nota': 10},
        {'Texto': 'Vermelho', 'Nota': 5},
        {'Texto': 'Azul', 'Nota': 3},
        {'Texto': 'Verde', 'Nota': 1},
      ]
    },
    {
      'Texto': 'Qual o seu animal favorito?',
      'respostas': [
        {'Texto': 'Cobra', 'Nota': 1},
        {'Texto': 'Gato', 'Nota': 5},
        {'Texto': 'Cachorro', 'Nota': 10},
        {'Texto': 'Leão', 'Nota': 3},
      ]
    },
    {
      'Texto': 'Qual o seu anime favorito?',
      'respostas': [
        {'Texto': 'Oshi no ko', 'Nota': 10},
        {'Texto': 'Naruto', 'Nota': 1},
        {'Texto': 'Atack on titan', 'Nota': 5},
        {'Texto': 'Lycoris recoil', 'Nota': 3},
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Projeto perguntas')),
        ),
        body: Center(
          child: temPerguntaSelecionada
              ? Questionario(
                  texto: perguntas[perguntaSelecionada]['Texto'].toString(),
                  resposta: [...respostas],
                  responder: responder,
                )
              : Resultado(
                  pontuacao: pontuacaoTotal,
                  reiniciar: reiniciarQuestionario,
                ),
        ),
      ),
    );
  }
}
