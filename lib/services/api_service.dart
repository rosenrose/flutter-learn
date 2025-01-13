import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter_learn/models/webtoon_today.dart';
import 'package:flutter_learn/models/webtoon_detail.dart';
import 'package:flutter_learn/models/webtoon_episode.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";

  static Future<List<WebtoonTodayModel>> getTodayWebtoons() async {
    final Future<http.Response> req = http.get(Uri.parse("$baseUrl/today"));
    final Future<dynamic> randDelay =
        Future.delayed(Duration(seconds: Random().nextInt(3) + 1));

    var [res, _] = await Future.wait([req, randDelay]);

    if (res.statusCode != 200) {
      throw Exception("Failed to load today's webtoons");
    }

    final List<dynamic> webtoons = jsonDecode(res.body);
    final List<WebtoonTodayModel> webtoonModels =
        webtoons.map((webtoon) => WebtoonTodayModel.fromJson(webtoon)).toList();

    return webtoonModels;
  }

  static Future<WebtoonDetailModel> getWebtoonDetailById(String id) async {
    final Future<http.Response> req = http.get(Uri.parse("$baseUrl/$id"));
    final http.Response res = await req;

    if (res.statusCode != 200) {
      throw Exception("Failed to load webtoon detail: $id");
    }

    WebtoonDetailModel webtoonDetail =
        WebtoonDetailModel.fromJson(jsonDecode(res.body));

    return webtoonDetail;
  }

  static Future<List<WebtoonEpisodeModel>> getEpisodesById(String id) async {
    final Future<http.Response> req =
        http.get(Uri.parse("$baseUrl/$id/episodes"));
    final http.Response res = await req;

    if (res.statusCode != 200) {
      throw Exception("Failed to load webtoon episodes: $id");
    }

    final List<dynamic> episodes = jsonDecode(res.body);
    final List<WebtoonEpisodeModel> episodeModels = episodes
        .map((episode) => WebtoonEpisodeModel.fromJson(episode))
        .toList();

    return episodeModels;
  }
}
