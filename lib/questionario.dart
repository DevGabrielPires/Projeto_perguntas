import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final String texto;
  final List<Map<String, Object>> resposta;
  final void Function(int) responder;
  const Questionario({
    super.key,
    this.texto = '',
    required this.resposta,
    required this.responder,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      ...resposta.map((element) => Resposta(
            texto: element.cast()['Texto'],
            responder: responder,
            pontuacao: element.cast()['Nota'],
          ))
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Questao(
          texto: texto,
        ),
        ...widgets
      ],
    );
  }
}
