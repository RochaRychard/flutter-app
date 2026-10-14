import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutterapp/components/big_card.dart';
import 'package:flutterapp/main.dart';
import 'package:provider/provider.dart';

class LinhasColunasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MainAppState>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Feed de Notícia"),
        backgroundColor: Colors.black87,
      ),
      body: Column(
        children: [
          _buildNewsItem(
            "Flutter é Incrivel",
            "Descubra como é criar apps rápido.",
            Colors.blue,
          ),

          Divider(),

          Row(
            children: [
              Expanded(
                flex: 7,
                child: Container(
                  height: 100,
                  color: Colors.green[100],
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text("Manchete Principal: Ocupa 70% da tela"),
                  ),
                ),
              ),

              Expanded(
                flex: 3,
                child: Container(
                  height: 100,
                  color: Colors.red[100],
                  child: Center(child: Text("Ads (30%)")),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildNewsItem(String title, String subtitle, Color color){
  return Padding(
    padding: EdgeInsets.all(10),
    child: row(
      CrossAxisAlignment: CrossAxisAlignment.start,
      children[
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.image, color: Colors.white),
        )

        SizedBox(width: 15),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            childrean: [
              Text:title,
              style
            ]
          ),
        )

      ]
    ),
  ),
}