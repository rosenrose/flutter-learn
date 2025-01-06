import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/widgets/Button.dart';
import 'package:flutter_learn/widgets/currency_card.dart';

void main() {
  var nico = Player(name: "nico");

  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;

  void addCount(int cnt) {
    setState(() {
      counter += cnt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Click Count",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                "$counter",
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      addCount(1);
                    },
                    icon: const Icon(
                      Icons.add_circle_rounded,
                      size: 70,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      addCount(-1);
                    },
                    icon: const Icon(
                      Icons.remove_circle_rounded,
                      size: 70,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Player {
  String name;

  Player({required this.name});
}
