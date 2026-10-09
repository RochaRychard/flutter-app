import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  void naoFazNada() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),

      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: naoFazNada,
            child: Text("Meu Botão"),
          ),
        ),
      ),
    );
  }
}
