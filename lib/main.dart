import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  void naoFazNada() {}

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainAppState(),
      child: MaterialApp(
        theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),

      home: HomePage(),
      ),
    );
    
     
  }
}

class MainAppState extends ChangeNotifier{
  var palavraatual = WordPair.random();

  void gerarNovaPalavra(){
    palavraatual = WordPair.random();
    notifyListeners();
  }
}