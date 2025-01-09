import 'package:flutter/material.dart';
import 'package:flutter_learn/services/api_service.dart';
import 'package:flutter_learn/models/webtoon.dart';

class WebtoonApp extends StatelessWidget {
  const WebtoonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WebtoonScreen(),
    );
  }
}

class WebtoonScreen extends StatelessWidget {
  WebtoonScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodayWebtoons();

  @override
  Widget build(BuildContext context) {
    // ApiService().getTodayWebtoons();

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
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error!");
          }

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final List<WebtoonModel> webtoons = snapshot.data!;

          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: webtoons.length,
            itemBuilder: (context, idx) {
              WebtoonModel webtoon = webtoons[idx];
              print(idx);
              return Column(
                children: [
                  Text("item$idx"),
                  Text(webtoon.title),
                ],
              );
            },
            separatorBuilder: (context, idx) {
              return DecoratedBox(
                decoration: const BoxDecoration(color: Colors.green),
                child: Text("sep$idx"),
              );
            },
          );
        },
      ),
    );
  }
}
