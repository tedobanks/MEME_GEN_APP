// To parse this JSON data, do
//
//     final meme = memeFromJson(jsonString);

import 'dart:convert';

List<Meme> memeFromJson(String str) =>
    List<Meme>.from(json.decode(str).map((x) => Meme.fromJson(x)));

String memeToJson(List<Meme> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Meme {
  Meme({
    required this.id,
    required this.url,
    required this.type,
  });

  int id;
  String url;
  String type;

  factory Meme.fromJson(Map<String, dynamic> json) => Meme(
        id: json["id"],
        url: json["url"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "type": type,
      };
}
