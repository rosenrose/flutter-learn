import 'package:flutter/material.dart';
import 'package:flutter_learn/models/webtoon_today.dart';
import 'package:flutter_learn/models/webtoon_detail.dart';
import 'package:flutter_learn/models/webtoon_episode.dart';
import 'package:flutter_learn/services/api_service.dart';
import 'package:flutter_learn/widgets/webtoon_appbar.dart';
import 'package:flutter_learn/widgets/webtoon_episode.dart';
import 'package:flutter_learn/widgets/webtoon_thumb.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WebtoonDetail extends StatefulWidget {
  final WebtoonTodayModel webtoon;

  const WebtoonDetail({
    super.key,
    required this.webtoon,
  });

  @override
  State<WebtoonDetail> createState() => _WebtoonDetailState();
}

class _WebtoonDetailState extends State<WebtoonDetail> {
  late Future<WebtoonDetailModel> webtoonDetail;
  late Future<List<WebtoonEpisodeModel>> webtoonEpisodes;

  @override
  void initState() {
    super.initState();
    webtoonDetail = ApiService.getWebtoonDetailById(widget.webtoon.id);
    webtoonEpisodes = ApiService.getWebtoonEpisodesById(widget.webtoon.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: WebtoonAppBar(
        title: Text(
          widget.webtoon.title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 30,
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => launchUrlString(
                  "https://comic.naver.com/webtoon/list?titleId=${widget.webtoon.id}"),
              child: Center(
                child: WebtoonThumb(webtoon: widget.webtoon),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            FutureBuilder(
              future: webtoonDetail,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text("getWebtoonDetailById error");
                }

                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final WebtoonDetailModel detail = snapshot.data!;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      detail.title,
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    Text(detail.about),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("${detail.genre} / ${detail.age}"),
                      ],
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 15,
            ),
            FutureBuilder(
              future: webtoonEpisodes,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text("getEpisodesById error");
                }

                if (!snapshot.hasData) {
                  return Center(
                    child: Container(),
                  );
                }

                return Column(
                  children: [
                    for (var episode in snapshot.data!)
                      WebtoonEpisode(
                          webtoonId: widget.webtoon.id, episode: episode),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
