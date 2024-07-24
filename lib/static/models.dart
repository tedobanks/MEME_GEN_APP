// To parse this JSON data, do
//
//     final meme = memeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Meme memeFromJson(String str) => Meme.fromJson(json.decode(str));

String memeToJson(Meme data) => json.encode(data.toJson());

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
