import 'package:flutter/material.dart';
import 'package:flutter_learn/services/api_service.dart';

class WebtoonApp extends StatelessWidget {
  const WebtoonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WebtoonScreen(),
    );
  }
}

class WebtoonScreen extends StatelessWidget {
  const WebtoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ApiService().getTodayWebtoons();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.greenAccent,
        elevation: 2,
        title: const Center(
          child: Text(
            "Today's Webtoons",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
