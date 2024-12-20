import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hello Flutter"),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: const Center(
          child: Text("Hello, world!"),
        ),
      ),
    );
  }
}
