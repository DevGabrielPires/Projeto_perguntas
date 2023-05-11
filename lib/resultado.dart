import 'package:flutter/cupertino.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciar;
  const Resultado({
    super.key,
    required this.pontuacao,
    required this.reiniciar,
  });

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns!!';
    } else if (pontuacao < 12) {
      return 'Você é bom!';
    } else if (pontuacao < 16) {
      return 'Impressionante';
    }
    return 'Jedi';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          fraseResultado,
          style: const TextStyle(fontSize: 28),
        ),
        CupertinoButton(onPressed: reiniciar, child: const Text('Reiniciar?'))
      ],
    );
  }
}
