import 'package:flutter/material.dart';
import 'package:flutterapp/main.dart';
import 'package:provider/provider.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: AnimatedSize(
          duration: Duration(milliseconds: 200),
          // Make sure that the compound word wraps correctly when the window
          // is too narrow.
          child: MergeSemantics(
            child: Wrap(
              children: [
                Text(
                  palavra.first,
                  style: tema.textTheme.displayMedium!.copyWith(
                    color: tema.colorScheme.primary,
                  ),
                ),
                Text(
                  palavra.second,
                  style: tema.textTheme.displayMedium!.copyWith(
                    color: tema.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
