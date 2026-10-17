//import 'package:english_words/src/word_pair.dart';
import 'package:flutter/material.dart';

import 'package:flutterapp/components/big_card.dart';

import 'package:flutterapp/main.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var menuSelecionado = 0;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    Widget pagina;

    switch (menuSelecionado) {
      case 0:
        {
          var pagina = TelaHome();
          break;
        }
      case 1:
        {
          var pagina = TelaFavoritos();
          break;
        }
      default:
        {
          throw UnimplementedError();
        }
    }

    var mainArea = ColoredBox(
      color: colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: menuSelecionado == 0 ? TelaHome() : TelaFavoritos(),
      ),
    );

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            // Use a more mobile-friendly layout with BottomNavigationBar
            // on narrow screens.
            return Column(
              children: [
                Expanded(child: mainArea),
                SafeArea(
                  child: BottomNavigationBar(
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.favorite),
                        label: 'Favorites',
                      ),
                    ],
                    currentIndex: menuSelecionado,
                    onTap: (value) {
                      setState(() {
                        menuSelecionado = value;
                      });
                    },
                  ),
                ),
              ],
            );
          } else {
            return Row(
              children: [
                SafeArea(
                  child: NavigationRail(
                    extended: constraints.maxWidth >= 600,
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(Icons.home),
                        label: Text('Home'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.favorite),
                        label: Text('Favorites'),
                      ),
                    ],
                    selectedIndex: menuSelecionado,
                    onDestinationSelected: (value) {
                      setState(() {
                        menuSelecionado = value;
                      });
                    },
                  ),
                ),
                Expanded(child: mainArea),
              ],
            );
          }
        },
      ),
    );
  }
}

class TelaHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MainAppState>();

    var favoritas = appState.palavrasFavoritas;

    IconData icone;
    if (favoritas.contains(appState.palavraAtual)) {
      icone = Icons.favorite;
    } else {
      icone = Icons.favorite_border;
    }
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Expanded(flex: 3, child: HistoryListView()),
          BigCard(appState: appState),

          SizedBox(height: 10),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: appState.marcarComoFavorito,
                label: Text("Like"),
                icon: Icon(icone),
              ),
              SizedBox(width: 15),
              ElevatedButton(
                onPressed: appState.gerarNovaPalavra,

                child: Text("Próxima palavra"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TelaFavoritos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MainAppState>();

    if (appState.palavrasFavoritas.isEmpty) {
      return Text("Nenhum favorito localizado");
    }

    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(30),
          child: Text(
            "Você tem ${appState.palavrasFavoritas.length} favoritos:",
          ),
        ),
        for (var item in appState.palavrasFavoritas)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(item.asLowerCase),
            onTap: () => appState.removerItem(item),
          ),
      ],
    );
  }
}

class HistoryListView extends StatefulWidget {
  const HistoryListView({super.key});

  @override
  State<HistoryListView> createState() => _HistoryListViewState();
}

class _HistoryListViewState extends State<HistoryListView> {
  /// Needed so that [MyAppState] can tell [AnimatedList] below to animate
  /// new items.
  final _key = GlobalKey();

  /// Used to "fade out" the history items at the top, to suggest continuation.
  static const Gradient _maskingGradient = LinearGradient(
    // This gradient goes from fully transparent to fully opaque black...
    colors: [Colors.transparent, Colors.black],
    // ... from the top (transparent) to half (0.5) of the way to the bottom.
    stops: [0.0, 0.5],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MainAppState>();
    appState.historyListKey = _key;

    return ShaderMask(
      shaderCallback: (bounds) => _maskingGradient.createShader(bounds),
      // This blend mode takes the opacity of the shader (i.e. our gradient)
      // and applies it to the destination (i.e. our animated list).
      blendMode: BlendMode.dstIn,
      child: AnimatedList(
        key: _key,
        reverse: true,
        padding: EdgeInsets.only(top: 100),
        initialItemCount: appState.history.length,
        itemBuilder: (context, index, animation) {
          final pair = appState.history[index];
          return SizeTransition(
            sizeFactor: animation,
            child: Center(
              child: TextButton.icon(
                onPressed: () {
                  appState.palavrasFavoritas;
                },
                icon: appState.palavrasFavoritas.contains(pair)
                    ? Icon(Icons.favorite, size: 12)
                    : SizedBox(),
                label: Text(
                  pair.asLowerCase,
                  semanticsLabel: pair.asPascalCase,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
