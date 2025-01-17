import 'package:flutter/material.dart';
import 'package:flutter_learn/models/webtoon_episode.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WebtoonEpisode extends StatelessWidget {
  final String webtoonId;
  final WebtoonEpisodeModel episode;

  const WebtoonEpisode({
    super.key,
    required this.webtoonId,
    required this.episode,
  });

  void openEpisode() {
    launchUrlString(
        "https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: openEpisode,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.green.shade400,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                episode.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
