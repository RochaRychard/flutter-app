import 'package:flutter/material.dart';

import 'package:flutterapp/components/big_card.dart';
import 'package:flutterapp/main.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MainAppState>();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BigCard(appState: appState),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: appState.gerarNovaPalavra,

                child: Text("Próxima palavra"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
