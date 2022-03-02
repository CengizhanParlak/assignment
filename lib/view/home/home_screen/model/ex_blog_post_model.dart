import 'package:assignment/core/constants/api_constants.dart';
import 'package:assignment/view/home/home_screen/service/network_request.dart';
import 'package:mobx/mobx.dart';
import 'blog_post_model.dart';

part 'ex_blog_post_model.g.dart';

class ExBlogPost extends _ExBlogPost with _$ExBlogPost {
  ExBlogPost(BlogPost blogPost) : super(blogPost);
}

abstract class _ExBlogPost extends BlogPost with Store {
  _ExBlogPost(BlogPost blogPost)
      : super(
          categoryId: blogPost.categoryId,
          content: blogPost.content,
          id: blogPost.id,
          image: blogPost.image,
          title: blogPost.title,
          isFavorited: blogPost.isFavorited,
        );

  @observable
  bool isFavorite = false;

  @action
  void toggleFavorite(String articleId) {
    toggleFavoritePOST(
      ApiConstants.TEST_TOKEN,
      articleId: articleId,
    ).then((value) {
      switch (value) {
        case 0:
          isFavorite = false;
          break;
        case 1:
          isFavorite = true;
          break;
        default:
          isFavorite = false;
      }
    });
  }
}
