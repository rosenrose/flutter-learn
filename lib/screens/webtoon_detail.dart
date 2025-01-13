import 'package:flutter/material.dart';
import 'package:flutter_learn/models/webtoon_today.dart';
import 'package:flutter_learn/models/webtoon_detail.dart';
import 'package:flutter_learn/models/webtoon_episode.dart';
import 'package:flutter_learn/services/api_service.dart';
import 'package:flutter_learn/widgets/webtoon_thumb.dart';
import 'package:flutter_learn/widgets/webtoon_appbar.dart';

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
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: WebtoonThumb(webtoon: widget.webtoon),
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

              return Column(
                children: [
                  Text(snapshot.data!.title),
                  Text(snapshot.data!.about),
                  Text(snapshot.data!.genre),
                  Text(snapshot.data!.age),
                ],
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder(
            future: webtoonEpisodes,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text("getEpisodesById error");
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
                  makeEpisodeList(snapshot.data!),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Expanded makeEpisodeList(List<WebtoonEpisodeModel> episodes) {
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(10),
        itemCount: episodes.length,
        itemBuilder: (context, idx) {
          return Row(
            children: [
              Text(episodes[idx].title),
              Text(episodes[idx].rating),
              Text(episodes[idx].date),
            ],
          );
        },
        separatorBuilder: (context, idx) {
          return const SizedBox(
            width: 10,
          );
        },
      ),
    );
  }
}
