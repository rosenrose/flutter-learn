class WebtoonModel {
  final String id;
  final String title;
  final String thumb;

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        thumb = json["thumb"];
}
