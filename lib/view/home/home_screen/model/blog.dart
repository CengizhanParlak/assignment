// To parse this JSON data, do
//
//     final blog = blogFromJson(jsonString);

import 'dart:convert';

Blog blogFromJson(String str) => Blog.fromJson(json.decode(str));

String blogToJson(Blog data) => json.encode(data.toJson());

class Blog {
  Blog({
    this.title,
    this.content,
    this.image,
    this.categoryId,
    this.id,
  });

  String? title;
  String? content;
  String? image;
  String? categoryId;
  String? id;

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
        title: json["Title"],
        content: json["Content"],
        image: json["Image"],
        categoryId: json["CategoryId"],
        id: json["Id"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Content": content,
        "Image": image,
        "CategoryId": categoryId,
        "Id": id,
      };
}
