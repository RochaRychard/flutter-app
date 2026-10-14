import 'package:flutter/material.dart';
import 'package:flutterapp/main.dart';

class BigCard extends StatelessWidget {
  const BigCard({super.key, required this.appState});
  final MainAppState appState;
  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    final estilo = tema.textTheme.displayLarge!.copyWith(
      color: tema.colorScheme.onPrimary,
      fontWeight: FontWeight.w100,
    );

    var palavra = appState.palavraAtual;

    return Card(
      color: tema.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          appState.palavraAtual.asLowerCase,
          style: estilo,
          semanticsLabel: "${palavra.first} ${palavra.second}",
        ),
      ),
    );
  }
}
