import 'package:flutter/material.dart';
import 'package:flutter_learn/models/webtoon.dart';
import 'package:flutter_learn/widgets/webtoon_thumb.dart';

class WebtoonDetail extends StatelessWidget {
  final WebtoonModel webtoon;

  const WebtoonDetail({
    super.key,
    required this.webtoon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.greenAccent,
        elevation: 2,
        title: Text(
          webtoon.title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: WebtoonThumb(thumbSrc: webtoon.thumb),
          )
        ],
      ),
    );
  }
}
