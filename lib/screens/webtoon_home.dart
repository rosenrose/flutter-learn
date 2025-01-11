import 'package:flutter/material.dart';
import 'package:flutter_learn/services/api_service.dart';
import 'package:flutter_learn/models/webtoon.dart';
import 'package:flutter_learn/widgets/webtoon_card.dart';

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

          return Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              makeList(snapshot.data!),
            ],
          );
        },
      ),
    );
  }

  Expanded makeList(List<WebtoonModel> webtoons) {
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(10),
        itemCount: webtoons.length,
        itemBuilder: (context, idx) {
          return WebtoonCard(webtoon: webtoons[idx]);
        },
        separatorBuilder: (context, idx) {
          return const SizedBox(
            width: 40,
          );
        },
      ),
    );
  }
}
