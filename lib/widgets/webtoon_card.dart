import 'package:flutter/material.dart';
import 'package:flutter_learn/models/webtoon_today.dart';
import 'package:flutter_learn/screens/webtoon_detail.dart';
import 'package:flutter_learn/widgets/webtoon_thumb.dart';

class WebtoonCard extends StatelessWidget {
  final WebtoonTodayModel webtoon;

  const WebtoonCard({
    super.key,
    required this.webtoon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebtoonDetail(webtoon: webtoon),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          WebtoonThumb(webtoon: webtoon),
          const SizedBox(
            height: 20,
          ),
          Text(webtoon.title,
              style: const TextStyle(
                fontSize: 14,
              )),
        ],
      ),
    );
  }
}
