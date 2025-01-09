import 'package:flutter/material.dart';
import 'package:flutter_learn/services/api_service.dart';
import 'package:flutter_learn/models/webtoon.dart';

class WebtoonApp extends StatelessWidget {
  const WebtoonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WebtoonScreen(),
    );
  }
}

class WebtoonScreen extends StatefulWidget {
  const WebtoonScreen({super.key});

  @override
  State<WebtoonScreen> createState() => _WebtoonScreenState();
}

class _WebtoonScreenState extends State<WebtoonScreen> {
  List<WebtoonModel> webtoonModels = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    waitForWebtoons();
  }

  void waitForWebtoons() async {
    webtoonModels = await ApiService.getTodayWebtoons();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ApiService().getTodayWebtoons();
    print(webtoonModels);
    print(isLoading);

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
