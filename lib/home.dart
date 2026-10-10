import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/components/big_card.dart';
import 'package:flutterapp/main.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MainAppState>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BigCard(appState:appState),

            Text("asLowerCase: ${appState.palavraatual.asLowerCase}"),
            

            ElevatedButton(
              onPressed: appState.gerarNovaPalavra,



              child: Text("Próxima palavra"))
          ],
        ),
      ),
    );
  }
}

