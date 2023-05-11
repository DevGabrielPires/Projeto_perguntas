import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final int pontuacao;
  final void Function(int) responder;
  const Resposta({
    super.key,
    required this.texto,
    required this.responder,
    required this.pontuacao,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(150, 50),
          backgroundColor: Colors.blue,
          textStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () {
          responder(pontuacao);
        },
        child: Text(texto),
      ),
    );
  }
}
