class WebtoonTodayModel {
  final String id;
  final String title;
  final String thumb;

  WebtoonTodayModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        thumb = json["thumb"];
}
