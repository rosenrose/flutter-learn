import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter_learn/models/webtoon.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "/today";

  static Future<List<WebtoonModel>> getTodayWebtoons() async {
    final Future<http.Response> req = http.get(Uri.parse("$baseUrl$today"));
    final Future<dynamic> randDelay =
        Future.delayed(Duration(seconds: Random().nextInt(3) + 1));

    var [res, _] = await Future.wait([req, randDelay]);

    if (res.statusCode != 200) {
      throw Exception("Failed to load today's webtoons");
    }

    final List<WebtoonModel> webtoonModels = [];
    final List<dynamic> webtoons = jsonDecode(res.body);

    for (var webtoon in webtoons) {
      webtoonModels.add(WebtoonModel.fromJson(webtoon));
    }

    return webtoonModels;
  }
}
