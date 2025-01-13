import 'package:flutter/material.dart';
import 'package:flutter_learn/services/api_service.dart';
import 'package:flutter_learn/models/webtoon_today.dart';
import 'package:flutter_learn/widgets/webtoon_card.dart';
import 'package:flutter_learn/widgets/webtoon_appbar.dart';

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

  final Future<List<WebtoonTodayModel>> webtoons =
      ApiService.getTodayWebtoons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const WebtoonAppBar(
        title: Center(
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
            return const Text("getTodayWebtoons error");
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
              makeTodayWebtoonList(snapshot.data!),
            ],
          );
        },
      ),
    );
  }

  Expanded makeTodayWebtoonList(List<WebtoonTodayModel> webtoons) {
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
