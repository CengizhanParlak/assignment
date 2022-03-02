// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    this.title,
    this.image,
    this.id,
  });

  String? title;
  String? image;
  String? id;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        title: json["Title"],
        image: json["Image"],
        id: json["Id"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Image": image,
        "Id": id,
      };
}
