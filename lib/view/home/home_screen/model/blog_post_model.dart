// To parse this JSON data, do
//
//     final blog = blogFromJson(jsonString);

import 'package:mobx/mobx.dart';
part 'blog_post_model.g.dart';

class BlogPost extends _BlogPostViewModel with _$BlogPost {
  BlogPost.fromJson(Map<String, dynamic> json) {
    title = json['Title'] as String?;
    content = json['Content'] as String?;
    image = json['Image'] as String?;
    categoryId = json['CategoryId'] as String?;
    id = json['Id'] as String?;
    isFavorited = json['isFavorited'] ?? false;
  }

  Map<String, dynamic> toJson(BlogPost instance) => <String, dynamic>{
        'Title': instance.title,
        'Content': instance.content,
        'Image': instance.image,
        'CategoryId': instance.categoryId,
        'Id': instance.id,
        'IsFavorited': instance.isFavorited,
      };
}

abstract class _BlogPostViewModel with Store {
  String? title;
  String? content;
  String? image;
  String? categoryId;
  String? id;

  @observable
  bool isFavorited = false;

  @action
  void toggleFavorite() {
    isFavorited = !isFavorited;
  }
}
