import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_learn/models/webtoon.dart';

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "/today";
  List<WebtoonModel> webtoonModels = [];

  Future<List<WebtoonModel>> getTodayWebtoons() async {
    final http.Response res = await http.get(Uri.parse("$baseUrl$today"));

    if (res.statusCode != 200) {
      throw Exception("Failed to load today's webtoons");
    }

    final List<dynamic> webtoons = jsonDecode(res.body);

    for (var webtoon in webtoons) {
      webtoonModels.add(WebtoonModel.fromJson(webtoon));
    }

    return webtoonModels;
  }

  Future<int> a() {
    return Future.value(2 + 2);
  }
}
