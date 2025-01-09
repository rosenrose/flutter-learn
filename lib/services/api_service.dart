import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_learn/models/webtoon.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "/today";

  static Future<List<WebtoonModel>> getTodayWebtoons() async {
    await Future.delayed(const Duration(seconds: 1));
    final http.Response res = await http.get(Uri.parse("$baseUrl$today"));

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
