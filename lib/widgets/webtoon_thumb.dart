import 'package:flutter/material.dart';
import 'package:flutter_learn/models/webtoon.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WebtoonThumb extends StatelessWidget {
  final WebtoonModel webtoon;

  const WebtoonThumb({
    super.key,
    required this.webtoon,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: webtoon.id,
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                blurRadius: 5, offset: Offset(10, 10), color: Colors.black38)
          ],
        ),
        clipBehavior: Clip.hardEdge,
        child: Image.network(
          webtoon.thumb,
          headers: {"User-Agent": dotenv.env['USER_AGENT']!},
        ),
      ),
    );
  }
}
