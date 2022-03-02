// To parse this JSON data, do
//
//     final blog = blogFromJson(jsonString);

import 'dart:convert';

BlogPost blogPostFromJson(String str) => BlogPost.fromJson(json.decode(str));

String blogPostToJson(BlogPost data) => json.encode(data.toJson());

class BlogPost {
  BlogPost({
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

  factory BlogPost.fromJson(Map<String, dynamic> json) => BlogPost(
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
