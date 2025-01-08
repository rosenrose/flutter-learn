import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "/today";

  void getTodayWebtoons() async {
    final http.Response res = await http.get(Uri.parse("$baseUrl$today"));

    if (res.statusCode != 200) {
      throw Exception("Failed to load today's webtoons");
    }

    print(res.body);
  }

  Future<int> a() {
    return Future.value(2 + 2);
  }
}
